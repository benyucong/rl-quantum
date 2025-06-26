#!/bin/bash
#SBATCH --job-name=demo-verl-tool
#SBATCH --time=04:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=400GB
#SBATCH --gpus=8
#SBATCH --partition=gpu-h200-141g-short

# Optionally redirect to background; but better to let SLURM manage it in foreground
HOST=0.0.0.0
PORT=5500
TOOL_TYPES="python_code"    # comma-separated e.g. python_code,bash
WORKERS=4


# python -m verl_tool.servers.serve \
#     --host $HOST \
#     --port $PORT \
#     --tool_type $TOOL_TYPES \
#     --workers_per_tool $WORKERS &

# SERVER_PID=$!

# sleep 10 # wait for server to start

bash examples/train/torl/train_qwen_1.5B_math_deep_math.sh

# Optional: stop server gracefully (if training finishes)
# kill $SERVER_PID