#!/bin/bash
#SBATCH --job-name=quantum_4B
#SBATCH --time=4-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400GB
#SBATCH --gpus=8
#SBATCH --partition=gpu-h200-141g-ellis

module purge
module load scicomp-python-env/2024-01
module load scicomp-llm-env


cd ../../../

source .venv/bin/activate
export HF_HOME=$(pwd)/data/huggingface
bash examples/train/quantum/train_qwen_4B_quantum.sh