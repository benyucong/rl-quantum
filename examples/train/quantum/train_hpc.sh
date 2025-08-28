#!/bin/bash
#SBATCH --job-name=quantum_3B
#SBATCH --time=2-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400GB
#SBATCH --gpus=8
#SBATCH --partition=gpu-h200-141g-ellis

cd ../../../
export HF_HOME=$(pwd)/data/huggingface
bash examples/train/quantum/train_qwen_4B_quantum.sh