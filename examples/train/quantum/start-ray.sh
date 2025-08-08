#!/bin/bash
current_node=$(hostname -s)

cd $PROJECT_HOME/rl_quantum
source venv/bin/activate
export PYTHONPATH=/gpfs/projects/ehpc95/rl_quantum/venv/lib/python3.11/site-packages

export RAY_raylet_start_wait_time_s=300

unset ROCR_VISIBLE_DEVICES

export VLLM_HOST_IP=$(hostname --ip-address)

if [ "$SLURM_PROCID" = "0" ]; then
    echo "Starting ray head on $current_node, connecting to $ip_head, with rank $SLURM_PROCID"
    ray start --head \
        --node-ip-address="$head_node_ip" \
        --port=$head_node_port \
        --num-cpus="${SLURM_CPUS_PER_TASK}" \
        --num-gpus="${GPUS_PER_TASK}" \
        --min-worker-port=11000 \
        --max-worker-port=11999 \
        --disable-usage-stats \
        --block
else
    sleep $((SLURM_PROCID * 2 + 5))
    echo "Starting ray worker on $current_node, connecting to $ip_head, with rank $SLURM_PROCID"
    ray start --address "$ip_head" \
        --num-cpus="${SLURM_CPUS_PER_TASK}" \
        --num-gpus="${GPUS_PER_TASK}" \
        --min-worker-port=$((11000 + SLURM_PROCID % SLURM_NTASKS_PER_NODE * 1000)) \
        --max-worker-port=$((11999 + SLURM_PROCID % SLURM_NTASKS_PER_NODE * 1000)) \
        --disable-usage-stats \
        --block
fi
