#!/usr/bin/env python3
"""Render Vista figures from a supplied plot-data directory.

The original plotting scripts in ``vista_draw`` assume this layout:

  <workdir>/dataset/*.csv
  <workdir>/dataset/*.json
  <workdir>/logs.csv

This wrapper creates that layout in a temporary working directory, runs the
selected plotting scripts in headless mode, and copies generated figures to a
reviewer-facing output directory.
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import shutil
import subprocess
import sys
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


@dataclass(frozen=True)
class PlotTask:
    name: str
    script: str
    required: tuple[str, ...]
    args: tuple[str, ...] = ()


TASKS: tuple[PlotTask, ...] = (
    PlotTask("box", "plot_box.py", ("dataset/box.csv",)),
    PlotTask("compilability", "plot_compilability.py", ("dataset/compilability_table.csv",)),
    PlotTask("relative_entropy", "plot_relative_entropy.py", ("dataset/relative_entropy_table.csv",)),
    PlotTask("scalability_qubits", "plot_scalability.py", ("dataset/scalability_table_0.3.csv",)),
    PlotTask(
        "scalability_gates_depth",
        "plot_scalability_gates_depth.py",
        ("dataset/scalability_table_gates.csv", "dataset/scalability_table_depth.csv"),
    ),
    PlotTask("per_primitive", "plot_per_primitive_breakdown.py", ("dataset/per_primitive_hqcr.csv",)),
    PlotTask("training_dynamics", "plot_training_dynamics.py", ("dataset/training_dynamics_table.csv",)),
    PlotTask("verifier_efficiency", "plot_verifier_efficiency.py", ("dataset/verifier_efficiency_table.csv",)),
    PlotTask("training_logs", "make_plots.py", ("logs.csv",), ("--input", "logs.csv", "--outdir", "figures")),
    PlotTask(
        "stage_cost",
        "plot_verifier_stage_cost_breakdown.py",
        ("logs.csv",),
        ("--input", "logs.csv", "--out", "dataset/verifier_stage_cost_breakdown"),
    ),
)


def repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def copy_inputs(input_dir: Path, workdir: Path) -> None:
    candidates = [
        input_dir,
        input_dir / "plot_data",
    ]
    dataset_src = None
    for candidate in candidates:
        if (candidate / "dataset").is_dir():
            dataset_src = candidate / "dataset"
            break
    if dataset_src is None and input_dir.name == "dataset" and input_dir.is_dir():
        dataset_src = input_dir

    if dataset_src is not None:
        shutil.copytree(dataset_src, workdir / "dataset", dirs_exist_ok=True)
    else:
        (workdir / "dataset").mkdir(parents=True, exist_ok=True)

    for candidate in candidates:
        logs_src = candidate / "logs.csv"
        if logs_src.is_file():
            shutil.copy2(logs_src, workdir / "logs.csv")
            break


def canonical_model_label(name: str) -> str:
    key = name.strip()
    low = key.lower()
    if "rl_quantum_4b" in low or "quasar" in low or "vista" in low:
        return "VISTA"
    if "sft_quantum_circuit_gen_4b" in low or low in {"sft", "sft_response"}:
        return "Agent-Q"
    if "gpt-4o" in low or "gpt4o" in low:
        return "GPT-4o"
    if "gpt-5" in low or "gpt5" in low:
        return "GPT-5"
    if "deepseek" in low:
        return "DeepSeek-V3"
    return key


def evaluation_model_name(path: Path) -> str:
    stem = path.stem
    prefix = "summary_"
    suffix = "_raw_data"
    if stem.startswith(prefix):
        stem = stem[len(prefix) :]
    if stem.endswith(suffix):
        stem = stem[: -len(suffix)]
    return stem


def parse_thresholds(raw: str) -> list[float]:
    values: list[float] = []
    for item in raw.split(","):
        item = item.strip()
        if not item:
            continue
        values.append(float(item))
    if not values:
        raise SystemExit("At least one threshold is required.")
    return values


def total_samples_for(evaluation_dir: Path, raw_model_name: str) -> int | None:
    candidates = [
        evaluation_dir / f"summary_stats_{raw_model_name}.json",
        evaluation_dir / f"summary_stats_{canonical_model_label(raw_model_name)}.json",
    ]
    for path in candidates:
        if not path.exists():
            continue
        with path.open("r", encoding="utf-8") as f:
            data = json.load(f)
        total = data.get("total_samples")
        if isinstance(total, int) and total > 0:
            return total
    return None


def write_plot_data_from_evaluation(evaluation_dir: Path, workdir: Path, thresholds: list[float]) -> None:
    raw_csvs = sorted(evaluation_dir.glob("summary_*_raw_data.csv"))
    if not raw_csvs:
        raise SystemExit(f"No summary_*_raw_data.csv files found in {evaluation_dir}")

    dataset_dir = workdir / "dataset"
    dataset_dir.mkdir(parents=True, exist_ok=True)

    box_rows: list[dict[str, str]] = []
    entropy_rows: list[dict[str, str]] = []
    manifest: list[dict[str, object]] = []

    for raw_csv in raw_csvs:
        raw_model = evaluation_model_name(raw_csv)
        model = canonical_model_label(raw_model)
        rel_entropies: list[float] = []
        abs_deltas: list[float] = []

        with raw_csv.open("r", encoding="utf-8", newline="") as f:
            reader = csv.DictReader(f)
            for row in reader:
                try:
                    rel_entropies.append(float(row["Relative Entropy"]))
                except (KeyError, TypeError, ValueError):
                    pass
                try:
                    abs_deltas.append(abs(float(row["Expectation Value Difference"])))
                except (KeyError, TypeError, ValueError):
                    pass

        for value in abs_deltas:
            box_rows.append({"model": model, "abs_delta_expectation_value": f"{value:.12g}"})

        denominator = total_samples_for(evaluation_dir, raw_model) or len(rel_entropies)
        entropy_row = {"model": model}
        for threshold in thresholds:
            passed = sum(1 for value in rel_entropies if value <= threshold)
            entropy_row[f"{threshold:g}"] = f"{(passed / denominator) if denominator else 0.0:.12g}"
        entropy_rows.append(entropy_row)

        manifest.append(
            {
                "model": model,
                "source": str(raw_csv),
                "relative_entropy_samples": len(rel_entropies),
                "objective_gap_samples": len(abs_deltas),
                "denominator": denominator,
            }
        )

    with (dataset_dir / "box.csv").open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["model", "abs_delta_expectation_value"])
        writer.writeheader()
        writer.writerows(box_rows)

    threshold_headers = [f"{threshold:g}" for threshold in thresholds]
    with (dataset_dir / "relative_entropy_table.csv").open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=["model", *threshold_headers])
        writer.writeheader()
        writer.writerows(entropy_rows)

    (dataset_dir / "generated_plot_data_manifest.json").write_text(
        json.dumps(manifest, indent=2),
        encoding="utf-8",
    )
    print(f"[data] Wrote plot tables from evaluation outputs in {evaluation_dir}")


def available_report(workdir: Path) -> Path | None:
    reports = sorted((workdir / "dataset").glob("helmi_deploy_report*.json"))
    return reports[0] if reports else None


def dynamic_tasks(workdir: Path) -> list[PlotTask]:
    tasks = list(TASKS)
    report = available_report(workdir)
    if report is not None:
        report_arg = str(report.relative_to(workdir))
        tasks.extend(
            [
                PlotTask(
                    "latency_breakdown",
                    "plot_latency_breakdown.py",
                    (report_arg,),
                    ("--input", report_arg),
                ),
                PlotTask(
                    "helmi_reward_stability",
                    "plot_helmi_reward_stability.py",
                    (report_arg,),
                    ("--input", report_arg),
                ),
                PlotTask(
                    "real_device_tradeoff",
                    "plot_real_device_quality_efficiency_tradeoff.py",
                    (report_arg,),
                    ("--input", report_arg, "--out", "dataset/real_device_quality_efficiency_tradeoff"),
                ),
            ]
        )
    return tasks


def selected_tasks(all_tasks: Iterable[PlotTask], only: str) -> list[PlotTask]:
    tasks = list(all_tasks)
    if only == "all":
        return tasks
    requested = {item.strip() for item in only.split(",") if item.strip()}
    known = {task.name for task in tasks}
    unknown = requested.difference(known)
    if unknown:
        raise SystemExit(f"Unknown plot task(s): {sorted(unknown)}. Known: {sorted(known)}")
    return [task for task in tasks if task.name in requested]


def missing_requirements(workdir: Path, task: PlotTask) -> list[str]:
    return [path for path in task.required if not (workdir / path).exists()]


def run_task(plot_source: Path, workdir: Path, task: PlotTask, strict: bool) -> dict[str, object]:
    missing = missing_requirements(workdir, task)
    if missing:
        message = f"missing required input(s): {', '.join(missing)}"
        if strict:
            raise SystemExit(f"{task.name} failed: {message}")
        print(f"[skip] {task.name}: {message}")
        return {"task": task.name, "status": "skipped", "reason": message}

    script_path = plot_source / task.script
    if not script_path.exists():
        message = f"missing script: {script_path}"
        if strict:
            raise SystemExit(message)
        print(f"[skip] {task.name}: {message}")
        return {"task": task.name, "status": "skipped", "reason": message}

    cmd = [sys.executable, str(script_path), *task.args]
    env = os.environ.copy()
    env["MPLBACKEND"] = "Agg"
    mpl_config_dir = workdir / ".matplotlib"
    mpl_config_dir.mkdir(parents=True, exist_ok=True)
    xdg_cache_dir = workdir / ".cache"
    xdg_cache_dir.mkdir(parents=True, exist_ok=True)
    env["MPLCONFIGDIR"] = str(mpl_config_dir)
    env["XDG_CACHE_HOME"] = str(xdg_cache_dir)
    env["PYTHONUNBUFFERED"] = "1"
    print(f"[run] {task.name}: {' '.join(cmd)}")
    result = subprocess.run(
        cmd,
        cwd=workdir,
        env=env,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    if result.stdout:
        print(result.stdout.rstrip())

    if result.returncode != 0:
        message = f"exit code {result.returncode}"
        if strict:
            raise SystemExit(f"{task.name} failed with {message}")
        print(f"[fail] {task.name}: {message}")
        return {"task": task.name, "status": "failed", "reason": message}

    return {"task": task.name, "status": "ok"}


def copy_outputs(workdir: Path, output_dir: Path) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)
    for subdir in ("dataset", "figures"):
        src_dir = workdir / subdir
        if not src_dir.exists():
            continue
        dst_dir = output_dir / subdir
        dst_dir.mkdir(parents=True, exist_ok=True)
        for path in src_dir.rglob("*"):
            if not path.is_file():
                continue
            rel = path.relative_to(src_dir)
            dst = dst_dir / rel
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(path, dst)


def main() -> None:
    parser = argparse.ArgumentParser(description="Render Vista figures from plot-data inputs.")
    parser.add_argument(
        "--plot-source",
        type=Path,
        default=repo_root() / "vista_draw",
        help="Directory containing the vista_draw plotting scripts.",
    )
    parser.add_argument(
        "--input-dir",
        type=Path,
        default=repo_root() / "vista_draw",
        help="Directory containing dataset/ and optionally logs.csv.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=repo_root() / "artifact_runs" / "vista_figures",
        help="Directory where rendered figures and plot data will be copied.",
    )
    parser.add_argument(
        "--evaluation-dir",
        type=Path,
        help=(
            "Directory containing summary_<model>_raw_data.csv files from "
            "evaluate_samples.py. When set, box.csv and relative_entropy_table.csv "
            "are regenerated from these new outputs before plotting."
        ),
    )
    parser.add_argument(
        "--thresholds",
        default="0.1,0.3,0.5,0.7,0.9",
        help="Comma-separated relative-entropy thresholds for --evaluation-dir plot tables.",
    )
    parser.add_argument(
        "--only",
        default="all",
        help="Comma-separated task names, or 'all'.",
    )
    parser.add_argument("--strict", action="store_true", help="Fail on the first missing input or script error.")
    parser.add_argument("--keep-workdir", action="store_true", help="Keep the temporary workdir for debugging.")
    args = parser.parse_args()

    plot_source = args.plot_source.resolve()
    input_dir = args.input_dir.resolve()
    output_dir = args.output_dir.resolve()
    evaluation_dir = args.evaluation_dir.resolve() if args.evaluation_dir else None
    if not plot_source.is_dir():
        raise SystemExit(f"Plot source directory not found: {plot_source}")
    if not input_dir.exists():
        raise SystemExit(f"Input directory not found: {input_dir}")
    if evaluation_dir is not None and not evaluation_dir.is_dir():
        raise SystemExit(f"Evaluation directory not found: {evaluation_dir}")

    with tempfile.TemporaryDirectory(prefix="vista_draw_") as tmp:
        workdir = Path(tmp)
        copy_inputs(input_dir, workdir)
        if evaluation_dir is not None:
            write_plot_data_from_evaluation(evaluation_dir, workdir, parse_thresholds(args.thresholds))
        tasks = selected_tasks(dynamic_tasks(workdir), args.only)
        statuses = [run_task(plot_source, workdir, task, strict=args.strict) for task in tasks]
        copy_outputs(workdir, output_dir)
        (output_dir / "plot_status.json").write_text(json.dumps(statuses, indent=2), encoding="utf-8")

        if args.keep_workdir:
            kept = output_dir / "_workdir"
            if kept.exists():
                shutil.rmtree(kept)
            shutil.copytree(workdir, kept)
            print(f"Kept temporary workdir copy: {kept}")

    ok = sum(1 for item in statuses if item["status"] == "ok")
    skipped = sum(1 for item in statuses if item["status"] == "skipped")
    failed = sum(1 for item in statuses if item["status"] == "failed")
    print(f"Rendered figure tasks: ok={ok}, skipped={skipped}, failed={failed}")
    print(f"Output directory: {output_dir}")
    if failed and args.strict:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
