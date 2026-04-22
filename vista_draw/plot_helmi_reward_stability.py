#!/usr/bin/env python3
"""Plot staged reward-learning dynamics for the Q5 Helmi classical-quantum loop.

The x-axis is iteration index (one full generate->transpile->submit->result loop).
The y-axis is normalized reward value in [0, 1].

Curves:
- Syntactic validity
- JS/distributional alignment score (qubit-budget alignment proxy)
- Expectation-value (EV) score from QPU counts
- Optimization-progress reward (latency proxy when explicit reward is absent)
- Final aggregated scalar reward

Each curve is shown as rolling mean +/- 1 std over a small moving window.
"""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path
from typing import Any, Dict, List, Tuple

import matplotlib.pyplot as plt
import numpy as np


def _hamming_weight(bitstring: str) -> int:
    return sum(1 for ch in bitstring if ch == "1")


def _safe_float(value: Any) -> float | None:
    if value is None:
        return None
    try:
        return float(value)
    except (TypeError, ValueError):
        return None


def _rolling_mean_std(y: np.ndarray, window: int) -> Tuple[np.ndarray, np.ndarray]:
    if window < 1:
        raise ValueError("window must be >= 1")
    n = y.size
    mean = np.zeros(n, dtype=float)
    std = np.zeros(n, dtype=float)
    half = window // 2
    for i in range(n):
        lo = max(0, i - half)
        hi = min(n, i + half + 1)
        seg = y[lo:hi]
        mean[i] = float(seg.mean())
        std[i] = float(seg.std(ddof=0))
    return mean, std


def _build_component_rows(report: Dict[str, Any]) -> List[Dict[str, Any]]:
    deployments = sorted(
        report.get("deployments", []),
        key=lambda d: int(d.get("sample_index", 0)),
    )
    max_qubits = float(report.get("meta", {}).get("max_qubits") or 5.0)

    rows: List[Dict[str, Any]] = []
    raw_opt_latency = np.full(len(deployments), np.nan, dtype=float)

    for i, dep in enumerate(deployments):
        status = str(dep.get("status", ""))
        sample_index = int(dep.get("sample_index") or 0)
        num_qubits = max(0, int(dep.get("num_qubits") or 0))

        # 1) Syntax reward: parse success indicator
        syntax_validity = 0.0 if status == "parse_failed" else 1.0

        # 2) JS/alignment reward: normalized hardware-budget alignment proxy
        #    (explicit JS score is not present in this report schema).
        if syntax_validity <= 0.0 or num_qubits <= 0:
            js_alignment = 0.0
        else:
            over = max(0.0, float(num_qubits) - max_qubits)
            js_alignment = float(np.clip(1.0 - over / max_qubits, 0.0, 1.0))

        # 3) EV reward from QPU counts: s_EV = 1 - (E_qpu - E_min)/(E_max - E_min),
        #    with E_min=0 and E_max=num_qubits.
        ev_score = 0.0
        e_qpu = None
        shots = 0.0
        counts = dep.get("counts")
        if (
            status == "submitted_ok"
            and isinstance(counts, dict)
            and counts
            and num_qubits > 0
        ):
            shots = float(sum(float(v) for v in counts.values()))
            if shots > 0.0:
                e_qpu_val = 0.0
                for bitstring, c in counts.items():
                    e_qpu_val += (float(c) / shots) * _hamming_weight(str(bitstring))
                e_qpu = float(e_qpu_val)
                ev_score = float(np.clip(1.0 - e_qpu / float(num_qubits), 0.0, 1.0))

        # 4) Optimization-progress proxy: inverse normalized submit+wait latency.
        #    (explicit optimization reward is not present in this report schema).
        lat = dep.get("latency_seconds") or {}
        submit = _safe_float(lat.get("submit_overhead"))
        wait = _safe_float(lat.get("result_wait"))
        if status == "submitted_ok" and submit is not None and wait is not None:
            raw_opt_latency[i] = submit + wait

        rows.append(
            {
                "iteration": i + 1,
                "sample_index": sample_index,
                "status": status,
                "num_qubits": num_qubits,
                "shots": shots,
                "E_qpu": e_qpu,
                "syntax_validity": syntax_validity,
                "js_alignment": js_alignment,
                "ev_score": ev_score,
                "opt_progress": 0.0,  # filled after latency normalization
                "final_reward": 0.0,  # filled after all components are available
            }
        )

    valid = np.isfinite(raw_opt_latency)
    if valid.any():
        lo = float(np.nanpercentile(raw_opt_latency, 5))
        hi = float(np.nanpercentile(raw_opt_latency, 95))
        if hi <= lo:
            hi = lo + 1e-9
        opt = np.zeros(raw_opt_latency.size, dtype=float)
        opt[valid] = 1.0 - (np.clip(raw_opt_latency[valid], lo, hi) - lo) / (hi - lo)
        opt = np.clip(opt, 0.0, 1.0)
    else:
        opt = np.zeros(raw_opt_latency.size, dtype=float)

    # Hierarchical aggregate: later semantic stages carry more weight.
    w_syntax = 0.15
    w_js = 0.20
    w_ev = 0.40
    w_opt = 0.25
    for i, row in enumerate(rows):
        row["opt_progress"] = float(opt[i])
        row["final_reward"] = float(
            np.clip(
                w_syntax * row["syntax_validity"]
                + w_js * row["js_alignment"]
                + w_ev * row["ev_score"]
                + w_opt * row["opt_progress"],
                0.0,
                1.0,
            )
        )

    return rows


def _write_csv(rows: List[Dict[str, Any]], out_csv: Path) -> None:
    out_csv.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "iteration",
        "sample_index",
        "status",
        "num_qubits",
        "shots",
        "E_qpu",
        "syntax_validity",
        "js_alignment",
        "ev_score",
        "opt_progress",
        "final_reward",
    ]
    with out_csv.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fields)
        writer.writeheader()
        for r in rows:
            writer.writerow(
                {
                    "iteration": r["iteration"],
                    "sample_index": r["sample_index"],
                    "status": r["status"],
                    "num_qubits": r["num_qubits"],
                    "shots": int(r["shots"]),
                    "E_qpu": "" if r["E_qpu"] is None else f"{float(r['E_qpu']):.6f}",
                    "syntax_validity": f"{float(r['syntax_validity']):.6f}",
                    "js_alignment": f"{float(r['js_alignment']):.6f}",
                    "ev_score": f"{float(r['ev_score']):.6f}",
                    "opt_progress": f"{float(r['opt_progress']):.6f}",
                    "final_reward": f"{float(r['final_reward']):.6f}",
                }
            )


def _plot(
    rows: List[Dict[str, Any]],
    out_pdf: Path,
    out_png: Path,
    smooth_window: int,
) -> None:
    if not rows:
        raise SystemExit("No deployments found in input report.")

    x = np.array([float(r["iteration"]) for r in rows], dtype=float)
    curves = {
        "Syntactic validity": np.array([float(r["syntax_validity"]) for r in rows], dtype=float),
        "JS/alignment score": np.array([float(r["js_alignment"]) for r in rows], dtype=float),
        "EV score (QPU counts)": np.array([float(r["ev_score"]) for r in rows], dtype=float),
        "Optimization progress": np.array([float(r["opt_progress"]) for r in rows], dtype=float),
        "Final aggregate reward": np.array([float(r["final_reward"]) for r in rows], dtype=float),
    }

    colors = {
        "Syntactic validity": "#1B9E77",
        "JS/alignment score": "#D95F02",
        "EV score (QPU counts)": "#7570B3",
        "Optimization progress": "#E7298A",
        "Final aggregate reward": "#222222",
    }
    with_band = {
        "EV score (QPU counts)",
        "Optimization progress",
        "Final aggregate reward",
    }

    plt.rcParams.update(
        {
            "font.size": 15,
            "axes.labelsize": 18,
            "xtick.labelsize": 14,
            "ytick.labelsize": 14,
            "legend.fontsize": 13,
        }
    )

    plt.figure(figsize=(13.8, 5.8))
    ax = plt.gca()

    for label, y in curves.items():
        mean, std = _rolling_mean_std(y, smooth_window)
        ax.plot(
            x,
            mean,
            label=label,
            color=colors[label],
            linewidth=3.2 if label == "Final aggregate reward" else 2.2,
        )
        if label in with_band:
            ax.fill_between(
                x,
                np.clip(mean - std, 0.0, 1.0),
                np.clip(mean + std, 0.0, 1.0),
                color=colors[label],
                alpha=0.07 if label == "Final aggregate reward" else 0.09,
                linewidth=0.0,
            )

    ax.set_xlim(1, len(rows))
    ax.set_ylim(0.0, 1.02)
    ax.set_xlabel("Iteration (generate->transpile->submit->result loop)")
    ax.set_ylabel("Reward value (normalized)")
    ax.yaxis.set_major_locator(plt.MaxNLocator(6))
    ax.xaxis.set_major_locator(plt.MaxNLocator(12))
    ax.grid(True, axis="y", alpha=0.25)
    ax.grid(False, axis="x")

    ax.legend(
        loc="center left",
        bbox_to_anchor=(1.01, 0.5),
        frameon=False,
        borderaxespad=0.0,
    )

    plt.tight_layout(rect=[0.0, 0.0, 0.80, 1.0])
    out_pdf.parent.mkdir(parents=True, exist_ok=True)
    plt.savefig(out_pdf, bbox_inches="tight")
    plt.savefig(out_png, dpi=250, bbox_inches="tight")
    print(f"Saved: {out_pdf}")
    print(f"Saved: {out_png}")
    plt.show()


def main() -> None:
    parser = argparse.ArgumentParser(description="Plot staged reward-learning dynamics for Q5 Helmi.")
    parser.add_argument(
        "--input",
        default="dataset/helmi_deploy_report_quantum_circuits_output_rl_quantum_4b_Q5_maxq5_20260218_172211.json",
        help="Path to helmi_deploy_report_*.json",
    )
    parser.add_argument("--out-pdf", default="dataset/helmi_reward_stability.pdf", help="Output PDF path")
    parser.add_argument("--out-png", default="dataset/helmi_reward_stability.png", help="Output PNG path")
    parser.add_argument(
        "--out-csv",
        default="dataset/helmi_reward_stability.csv",
        help="Output CSV path with per-iteration component rewards",
    )
    parser.add_argument(
        "--smooth-window",
        type=int,
        default=35,
        help="Rolling window size for moving-average mean/std bands",
    )
    args = parser.parse_args()

    report = json.loads(Path(args.input).read_text(encoding="utf-8"))
    rows = _build_component_rows(report)
    _write_csv(rows, Path(args.out_csv))
    _plot(rows, Path(args.out_pdf), Path(args.out_png), smooth_window=max(1, args.smooth_window))


if __name__ == "__main__":
    main()
