# Artifact Evaluation Plot Bundle

This bundle contains the code and data needed to regenerate:

- `out_instance_eval/plots/gap_scatter.pdf`
- `out_speed/plots_time/scheduled_duration_boxplot.pdf`

## Contents

- `src/analyze_instance_eval_results.py`: aggregates `out_instance_eval/instance_*.json` and writes the gap scatter plot.
- `src/plot_execution_time_benchmark.py`: reads `out_speed/speed_benchmark_*.json` and writes the scheduled-duration boxplot.
- `out_instance_eval/`: raw per-instance evaluation JSON files, aggregate CSV/statistics, and generated plots.
- `out_speed/`: speed benchmark JSON/CSV files, sampled-index metadata, and generated timing plots.
- `requirements.txt`: pinned Python dependencies from the evaluation environment.
- `reproduce_plots.sh`: convenience script for regenerating the target plots.

## Reproduce

From the extracted bundle root:

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
./reproduce_plots.sh
```

The script rewrites the target files at:

```text
out_instance_eval/plots/gap_scatter.pdf
out_speed/plots_time/scheduled_duration_boxplot.pdf
```

`src/plot_execution_time_benchmark.py` also regenerates the related scatter and speedup timing plots in `out_speed/plots_time/`.
