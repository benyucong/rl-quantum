#!/bin/bash
#SBATCH --job-name=quantum_3B_4_gpus
#SBATCH --time=2-00:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400GB
#SBATCH --gpus=4
#SBATCH --partition=gpu-a100-80g,gpu-h100-80g

cd ../../../
bash examples/train/quantum/train_qwen_3B_quantum.sh