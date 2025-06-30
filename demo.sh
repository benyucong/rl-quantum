#!/bin/bash
#SBATCH --job-name=demo-verl-tool
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400GB
#SBATCH --gpus=8
#SBATCH --partition=gpu-h200-141g-ellis


bash examples/train/torl/train_qwen_1.5B_math_deep_math.sh