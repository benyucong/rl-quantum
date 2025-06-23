#!/bin/bash
#SBATCH --job-name=install_flash_attn
#SBATCH --partition=gpu-h200-141g-short
#SBATCH --cpus-per-task=48
#SBATCH --time=10:00:00
#SBATCH --mem=50G
#SBATCH --gres=gpu:1

export UV_CACHE_DIR=$$WRKDIR/.cache/uv

module load gcc cuda cmake openmpi
module load scicomp-python-env/2024-01
module load scicomp-llm-env

source .venv/bin/activate
# uv pip install -e verl
# uv pip install vllm==0.8.4
MAX_JOBS=4 uv pip install flash-attn==2.5.8 --no-build-isolation
# uv pip install -e ".[acecoder,torl]"
# uv pip install dill==0.4.0 fsspec==2025.3.2 protobuf==5.29.4