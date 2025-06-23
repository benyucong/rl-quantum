#!/bin/bash
#SBATCH --job-name=demo-verl-tool
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400GB
#SBATCH --gpus=8
#SBATCH --partition=gpu-h200-141g-short


bash examples/train/quantum/train_qwen_3B_quantum.sh