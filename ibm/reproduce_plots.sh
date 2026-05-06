#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"

PYTHON_BIN="${PYTHON:-python3}"

"$PYTHON_BIN" - <<'PY'
import importlib.util
import sys

missing = [name for name in ("numpy", "matplotlib") if importlib.util.find_spec(name) is None]
if missing:
    sys.exit(
        "Missing Python packages: "
        + ", ".join(missing)
        + ". Install dependencies first, for example: python3 -m pip install -r requirements.txt"
    )
PY

"$PYTHON_BIN" src/analyze_instance_eval_results.py \
  --in-dir out_instance_eval \
  --out-csv out_instance_eval/instance_eval_aggregate.csv \
  --out-stats out_instance_eval/instance_eval_stats.json \
  --plots-dir out_instance_eval/plots \
  --plot-format pdf

"$PYTHON_BIN" src/plot_execution_time_benchmark.py \
  --inputs out_speed/speed_benchmark_*.json \
  --out-dir out_speed/plots_time

printf 'Regenerated:\n'
printf '  %s\n' 'out_instance_eval/plots/gap_scatter.pdf'
printf '  %s\n' 'out_speed/plots_time/scheduled_duration_boxplot.pdf'
