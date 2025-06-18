#!/bin/bash
#SBATCH --job-name=demo-cudaq
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100GB
#SBATCH --gpus=8
#SBATCH --partition=gpu-h200-141g-short

ml cuda

# Set paths (use absolute paths to avoid issues)
WORKDIR=/scratch/work/yuc10/cuda-quantum
IMAGE_PATH="$WORKDIR/cuda-quantum.sif"
SCRIPT_PATH="$WORKDIR/program.py"

# Run the Python script inside the Singularity container
srun singularity exec --nv --bind "$WORKDIR":"$WORKDIR" "$IMAGE_PATH" bash -c "
  echo '=== NVIDIA GPU Status ==='
  nvidia-smi
  echo '=== Running Python Program ==='
  python3 $SCRIPT_PATH
"