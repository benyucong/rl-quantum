#!/bin/bash
#SBATCH --job-name=convert
#SBATCH --time=10:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=100GB
#SBATCH --gpus=1
#SBATCH --partition=gpu-h200-141g-ellis

python verl/scripts/model_merger.py merge   \
--backend fsdp  \
--local_dir checkpoints/quantum/quantum-fsdp-agent-linuzj_quantum-circuit-qubo-3b-grpo-n16-b128-t1.0-lr1e-6debug/global_step_250/actor    \
--target_dir Benyucong/quantum_3b