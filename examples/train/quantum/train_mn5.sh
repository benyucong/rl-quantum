#!/bin/bash
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=80
#SBATCH --gres=gpu:4
#SBATCH -A ehpc95
#SBATCH -q acc_debug
#SBATCH --time=0-02:00:00

set -x

module --quiet purge
ml cuda/12.6 cudnn mkl impi intel hdf5 python/3.11.5-gcc gcc/11.4.0 ninja

export GPUS_PER_TASK=4

## Optional! Set NCCL debug output to check correct use of aws-ofi-rccl (these are very verbose)
# export NCCL_DEBUG=INFO
# export NCCL_DEBUG_SUBSYS=ALL
# export TORCH_DISTRIBUTED_DEBUG=DETAIL
# export TORCH_NCCL_TRACE_BUFFER_SIZE=1048576  # Example size: 1 MB

export PROJECT_HOME="/gpfs/projects/ehpc95"
export RAY_DEDUP_LOGS=0
export PYTHONUNBUFFERED=1
unset ROCR_VISIBLE_DEVICES

export OMP_NUM_THREADS="$((SLURM_CPUS_PER_TASK / GPUS_PER_TASK))"
export NUMEXPR_MAX_THREADS="$((SLURM_CPUS_PER_TASK / GPUS_PER_TASK))"

export NCCL_SOCKET_NTHREADS=4
export NCCL_NSOCKS_PERTHREAD=4
# export NCCL_IGNORE_CPU_AFFINITY=1
export NCCL_NET_GDR_LEVEL=SYS
export NCCL_NCHANNELS_PER_PEER=32

# export VLLM_FLASH_ATTN_VERSION=3
# export VLLM_USE_TRITON_FLASH_ATTN=0
# export VLLM_USE_RAY_SPMD_WORKER=1
# export VLLM_USE_RAY_COMPILED_DAG=1

export HF_HOME="${PROJECT_HOME}/hf_cache"
export TRANSFORMERS_OFFLINE=1

# export VLLM_USE_V1=0
export VLLM_USE_RAY_COMPILED_DAG_OVERLAP_COMM=1

cd $PROJECT_HOME/rl_quantum
source venv/bin/activate

function get_free_port() {
  read LOWERPORT UPPERPORT < /proc/sys/net/ipv4/ip_local_port_range
  local port=$(comm -23 <(seq $LOWERPORT $UPPERPORT | sort) <(ss -Htan | awk '{print $4}' | cut -d':' -f2 | sort -u) | shuf | head -n 1)
  echo "$port"
}

export get_free_port

MASTER_ADDR=`perl -le '$_=$ENV{"SLURM_JOB_NODELIST"}; s/,.*//; s/-.*//; s/\[//; print'`
MASTER_PORT="$(get_free_port)"

## Obtain the head IP address
head_node_ip=$(hostname --ip-address)

# if we detect a space character in the head node IP, we'll
# convert it to an ipv4 address. This step is optional.
if [[ "$head_node_ip" == *" "* ]]; then
IFS=' ' read -ra ADDR <<<"$head_node_ip"
if [[ ${#ADDR[0]} -gt 16 ]]; then
  head_node_ip=${ADDR[1]}
else
  head_node_ip=${ADDR[0]}
fi
echo "IPV6 address detected. We split the IPV4 address as $head_node_ip"
fi

export head_node_ip

head_node_port="$(get_free_port)"
ip_head=$head_node_ip:$head_node_port
export ip_head
export head_node_port
echo "IP Head: $ip_head"

export TRANSFORMERS_OFFLINE=1
export PYTHONPATH=/gpfs/projects/ehpc95/rl_quantum/venv/lib/python3.11/site-packages

cd rl-quantum

srun examples/train/quantum/start-ray.sh &

sleep 40

ray status

bash examples/train/quantum/train_qwen_3B_quantum.sh
