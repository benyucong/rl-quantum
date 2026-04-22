#!/usr/bin/env python3
"""Summarize precomputed quantum evaluation JSON files.

This helper is intentionally dependency-free so CAIS evaluators can perform a
quick artifact sanity check before installing the heavier Qiskit environment.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


def pct(numerator: float | int | None, denominator: float | int | None) -> str:
    if numerator is None or denominator in (None, 0):
        return "n/a"
    return f"{100.0 * float(numerator) / float(denominator):.2f}%"


def fmt(value: Any, digits: int = 3) -> str:
    if value is None:
        return "n/a"
    if isinstance(value, float):
        return f"{value:.{digits}f}"
    return str(value)


def fmt_percent_value(value: Any, digits: int = 2) -> str:
    if value is None:
        return "n/a"
    try:
        return f"{float(value):.{digits}f}%"
    except (TypeError, ValueError):
        return str(value)


def model_name(path: Path) -> str:
    stem = path.stem
    prefix = "summary_stats_"
    return stem[len(prefix) :] if stem.startswith(prefix) else stem


def load_rows(out_dir: Path) -> list[dict[str, Any]]:
    rows: list[dict[str, Any]] = []
    for path in sorted(out_dir.glob("summary_stats_*.json")):
        with path.open("r", encoding="utf-8") as f:
            data = json.load(f)

        total = data.get("total_samples")
        compiled = data.get("compiled_successfully")
        below = data.get("samples_below_entropy_threshold", {}).get("count")

        rows.append(
            {
                "model": model_name(path),
                "total": total,
                "compiled": compiled,
                "scr": pct(compiled, total),
                "srev": fmt_percent_value(data.get("success_rate_expectation_value"), 2),
                "avg_re": fmt(data.get("average_relative_entropy"), 3),
                "re_below_threshold": pct(below, total),
                "json": str(path),
            }
        )
    return rows


def print_markdown(rows: list[dict[str, Any]]) -> None:
    if not rows:
        print("No summary_stats_*.json files found.")
        return

    headers = [
        "model",
        "samples",
        "compiled",
        "SCR",
        "SREV %",
        "avg RE",
        "RE<threshold",
    ]
    print("| " + " | ".join(headers) + " |")
    print("| " + " | ".join(["---"] * len(headers)) + " |")
    for row in rows:
        print(
            "| "
            + " | ".join(
                [
                    row["model"],
                    fmt(row["total"]),
                    fmt(row["compiled"]),
                    row["scr"],
                    row["srev"],
                    row["avg_re"],
                    row["re_below_threshold"],
                ]
            )
            + " |"
        )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Summarize CAIS artifact precomputed evaluation outputs."
    )
    parser.add_argument(
        "out_dir",
        type=Path,
        help="Directory containing summary_stats_*.json files.",
    )
    args = parser.parse_args()

    if not args.out_dir.exists():
        raise SystemExit(f"Output directory does not exist: {args.out_dir}")
    if not args.out_dir.is_dir():
        raise SystemExit(f"Path is not a directory: {args.out_dir}")

    print_markdown(load_rows(args.out_dir))


if __name__ == "__main__":
    main()
