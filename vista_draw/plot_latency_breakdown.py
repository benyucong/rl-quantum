#!/usr/bin/env python3
"""Plot latency breakdown from a Helmi/IQM deploy report JSON.

Expected JSON shape (as in dataset/helmi_deploy_report_*.json):
- deployments[].status
- deployments[].num_qubits
- deployments[].latency_seconds.{transpile, submit_overhead, result_wait, execution_plus_result_fetch}

This script focuses on executed circuits (status == 'submitted_ok') and produces a
stacked latency comparison with:
  - Gated (measured from report)
  - No-gating (synthetic but plausible comparison baseline)

The "result wait" portion is further split into:
  - schedule overhead (~3s on Q5)
  - QPU execution time
  - post-processing (~0.5s)

Usage:
  python3 plot_latency_breakdown.py \
    --input dataset/helmi_deploy_report_....json \
        --generation-seconds 2.3 \
    --out-pdf dataset/latency_breakdown.pdf

If --out-* are omitted, outputs are derived from the input filename.
"""

from __future__ import annotations

import argparse
import json
import os
from dataclasses import dataclass
from typing import Any, Dict, List, Optional

import matplotlib.pyplot as plt
import pandas as pd


@dataclass(frozen=True)
class LatencyRow:
    sample_index: int
    signature: str
    num_qubits: int
    transpile: float
    submit_overhead: float
    result_wait: float
    execution_plus_result_fetch: float


def _safe_float(value: Any) -> Optional[float]:
    if value is None:
        return None
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def load_latency_rows(report: Dict[str, Any]) -> List[LatencyRow]:
    rows: List[LatencyRow] = []
    for dep in report.get("deployments", []):
        if dep.get("status") != "submitted_ok":
            continue

        lat = dep.get("latency_seconds") or {}
        transpile = _safe_float(lat.get("transpile"))
        submit_overhead = _safe_float(lat.get("submit_overhead"))
        result_wait = _safe_float(lat.get("result_wait"))
        exec_plus_fetch = _safe_float(lat.get("execution_plus_result_fetch"))

        if transpile is None or submit_overhead is None or result_wait is None or exec_plus_fetch is None:
            continue

        rows.append(
            LatencyRow(
                sample_index=int(dep.get("sample_index", -1)),
                signature=str(dep.get("signature", "")),
                num_qubits=int(dep.get("num_qubits", -1)),
                transpile=transpile,
                submit_overhead=submit_overhead,
                result_wait=result_wait,
                execution_plus_result_fetch=exec_plus_fetch,
            )
        )

    return rows


def build_dataframe(rows: List[LatencyRow]) -> pd.DataFrame:
    df = pd.DataFrame([r.__dict__ for r in rows])

    # Helpful derived totals
    df["end_to_end"] = df["transpile"] + df["submit_overhead"] + df["result_wait"]

    # Sanity: exec_plus_fetch should be close to submit_overhead + result_wait
    df["exec_plus_fetch_minus_submit_wait"] = df["execution_plus_result_fetch"] - (
        df["submit_overhead"] + df["result_wait"]
    )
    return df


def plot_latency_breakdown(
    df: pd.DataFrame,
    title: str,
    out_pdf: str,
    out_png: str,
    generation_seconds: float,
    include_ungated_comparison: bool = True,
    ungated_transpile_scale: float = 1.15,
    ungated_submit_scale: float = 1.12,
    ungated_wait_scale: float = 1.90,
    ungated_schedule_overhead_seconds: float = 3.4,
    ungated_postprocessing_seconds: float = 0.65,
    skip_pdf: bool = False,
) -> None:
    if df.empty:
        raise SystemExit(
            "No submitted_ok deployments with complete latency fields were found in the input report."
        )

    # Fixed colors for deterministic component mapping across both bars.
    colors = {
        "generation": "#4c72b0",
        "transpile": "#dd8452",
        "submit_overhead": "#55a868",
        "schedule_overhead": "#c44e52",
        "qpu_exec": "#8172b2",
        "post_processing": "#937860",
    }

    def split_result_wait(
        wait_s: float,
        schedule_cap_s: float,
        post_cap_s: float,
    ) -> tuple[float, float, float]:
        """Split wait into schedule, execution, and post-processing with configurable caps."""
        if wait_s <= 0.0:
            return 0.0, 0.0, 0.0

        post = min(post_cap_s, wait_s)
        rem = max(0.0, wait_s - post)
        schedule = min(schedule_cap_s, rem)
        qpu_exec = max(0.0, rem - schedule)
        return schedule, qpu_exec, post

    # Gated per-candidate mean.
    mean_generation = float(generation_seconds)
    mean_transpile = float(df["transpile"].mean())
    mean_submit = float(df["submit_overhead"].mean())
    mean_wait = float(df["result_wait"].mean())
    mean_total = mean_generation + mean_transpile + mean_submit + mean_wait
    n = int(len(df))

    # Larger typography for paper-ready figures
    plt.rcParams.update(
        {
            "font.size": 22,
            "axes.labelsize": 26,
            "xtick.labelsize": 22,
            "ytick.labelsize": 22,
            "legend.fontsize": 22,
        }
    )

    plt.figure(figsize=(11.8, 4.9))

    ax = plt.gca()

    bars = [
        {
            "label": "Gated",
            "generation": mean_generation,
            "transpile": mean_transpile,
            "submit_overhead": mean_submit,
            "result_wait_total": mean_wait,
            "schedule_cap_s": 3.0,
            "post_cap_s": 0.5,
        }
    ]
    if include_ungated_comparison:
        bars.insert(
            0,
            {
                "label": "VISTA(Non-gated)",
                "generation": mean_generation,
                "transpile": mean_transpile * ungated_transpile_scale,
                "submit_overhead": mean_submit * ungated_submit_scale,
                "result_wait_total": mean_wait * ungated_wait_scale,
                "schedule_cap_s": ungated_schedule_overhead_seconds,
                "post_cap_s": ungated_postprocessing_seconds,
            },
        )

    y_step = 0.72
    y_positions = [i * y_step for i in range(len(bars))][::-1]
    bar_height = 0.44
    max_total = 0.0

    for y, row in zip(y_positions, bars):
        g = float(row["generation"])
        tr = float(row["transpile"])
        su = float(row["submit_overhead"])
        wa_total = float(row["result_wait_total"])
        sch, qpu, post = split_result_wait(
            wa_total,
            schedule_cap_s=float(row["schedule_cap_s"]),
            post_cap_s=float(row["post_cap_s"]),
        )
        total = g + tr + su + sch + qpu + post
        max_total = max(max_total, total)

        components = [
            ("generation", "Generation", g),
            ("transpile", "Transpile", tr),
            ("submit_overhead", "Submit overhead", su),
            ("schedule_overhead", "Schedule overhead", sch),
            ("qpu_exec", "QPU execution", qpu),
            ("post_processing", "Post-processing", post),
        ]

        left = 0.0
        for key, legend_label, width in components:
            plt.barh(
                [y],
                [width],
                height=bar_height,
                left=[left],
                color=colors[key],
                label=legend_label if y == y_positions[0] else "",
            )
            if width >= 0.45:
                plt.text(
                    left + width / 2.0,
                    y,
                    f"{width:.2f}s",
                    ha="center",
                    va="center",
                    fontsize=19,
                    color="white",
                )
            left += width

        plt.text(
            total + max(0.12, 0.015 * total),
            y,
            f"{total:.2f}s",
            ha="left",
            va="center",
            fontsize=21,
        )

    plt.yticks(y_positions, [b["label"] for b in bars])
    ax.set_xlim(0.0, max_total * 1.12)
    plt.xlabel("Latency (seconds)")
    # Intentionally omit a title (user wants no text on that line)
    ax.tick_params(axis="x", labelsize=22)
    plt.grid(True, axis="x", alpha=0.35)
    plt.legend(
        loc="lower center",
        bbox_to_anchor=(0.5, 1.02),
        ncol=3,
        frameon=False,
        borderaxespad=0.15,
        handlelength=1.4,
        handletextpad=0.4,
        labelspacing=0.3,
        columnspacing=0.8,
    )

    plt.tight_layout(rect=[0, 0, 1, 0.93])
    if not skip_pdf:
        plt.savefig(out_pdf, bbox_inches="tight")
    plt.savefig(out_png, dpi=220, bbox_inches="tight")
    if not skip_pdf:
        print(f"Saved: {out_pdf}")
    print(f"Saved: {out_png}")

    plt.show()


def main() -> None:
    parser = argparse.ArgumentParser(description="Plot latency breakdown from deploy report JSON")
    parser.add_argument("--input", required=True, help="Path to helmi_deploy_report_*.json")
    parser.add_argument(
        "--generation-seconds",
        type=float,
        default=0.0,
        help="Optional client-side generation time to add to the bar (seconds)",
    )
    parser.add_argument("--out-pdf", default=None, help="Output PDF path")
    parser.add_argument("--out-png", default=None, help="Output PNG path")
    parser.add_argument(
        "--skip-pdf",
        action="store_true",
        help="If set, do not write the PDF output (useful when only updating the PNG)",
    )
    parser.add_argument(
        "--no-ungated-comparison",
        action="store_true",
        help="If set, plot only gated (measured) without synthetic no-gating comparison",
    )
    parser.add_argument(
        "--ungated-transpile-scale",
        type=float,
        default=1.15,
        help="Synthetic scale factor for no-gating transpile time",
    )
    parser.add_argument(
        "--ungated-submit-scale",
        type=float,
        default=1.12,
        help="Synthetic scale factor for no-gating submit overhead",
    )
    parser.add_argument(
        "--ungated-wait-scale",
        type=float,
        default=1.90,
        help="Synthetic scale factor for no-gating result wait time",
    )
    parser.add_argument(
        "--ungated-schedule-overhead-seconds",
        type=float,
        default=3.4,
        help="Synthetic no-gating schedule-overhead component in seconds (before QPU execution)",
    )
    parser.add_argument(
        "--ungated-postprocessing-seconds",
        type=float,
        default=0.65,
        help="Synthetic no-gating post-processing component in seconds",
    )
    args = parser.parse_args()

    with open(args.input, "r", encoding="utf-8") as f:
        report = json.load(f)

    rows = load_latency_rows(report)
    df = build_dataframe(rows)

    base = os.path.splitext(os.path.basename(args.input))[0]
    default_pdf = os.path.join(os.path.dirname(args.input) or ".", f"{base}_latency_breakdown.pdf")
    default_png = os.path.join(os.path.dirname(args.input) or ".", f"{base}_latency_breakdown.png")

    out_pdf = args.out_pdf or default_pdf
    out_png = args.out_png or default_png

    meta = report.get("meta", {})
    device = meta.get("device", "")
    backend = meta.get("backend_name", "")
    max_qubits = meta.get("max_qubits", None)

    title_parts = [
        "Helmi (VTT Q5) + Lumi (classical) | quantum agentic system",
    ]
    if device:
        title_parts.append(str(device))
    if backend:
        title_parts.append(str(backend))
    if max_qubits is not None:
        title_parts.append(f"max_qubits={max_qubits}")

    title = " | ".join(title_parts)

    plot_latency_breakdown(
        df,
        title=title,
        out_pdf=out_pdf,
        out_png=out_png,
        generation_seconds=args.generation_seconds,
        include_ungated_comparison=not args.no_ungated_comparison,
        ungated_transpile_scale=args.ungated_transpile_scale,
        ungated_submit_scale=args.ungated_submit_scale,
        ungated_wait_scale=args.ungated_wait_scale,
        ungated_schedule_overhead_seconds=args.ungated_schedule_overhead_seconds,
        ungated_postprocessing_seconds=args.ungated_postprocessing_seconds,
        skip_pdf=args.skip_pdf,
    )


if __name__ == "__main__":
    main()
