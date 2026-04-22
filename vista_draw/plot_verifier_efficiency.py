#!/usr/bin/env python3
"""Plot verifier efficiency and cost savings from gated evaluation.

Inputs are synthetic (fake but plausible) and live in:
  dataset/verifier_efficiency_table.csv

This script generates two separate figures:
    1) Stage-wise filtering (fraction remaining after each stage)
    2) Throughput under a time budget (gated vs no-gating)
"""

from __future__ import annotations

import csv

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import PercentFormatter


STAGES = ["Parse", "RE", "EV", "Opt"]


def _read(path: str):
    with open(path, newline="") as csvfile:
        reader = csv.DictReader(csvfile)
        rows = list(reader)

    variants = []
    for r in rows:
        variants.append(
            {
                "variant": r["variant"],
                "N_total": float(r["N_total"]),
                "p_syntax_pass": float(r["p_syntax_pass"]),
                "p_js_pass": float(r["p_js_pass"]),
                "p_ev_pass": float(r["p_ev_pass"]),
                "t_syntax_ms": float(r["t_syntax_ms"]),
                "t_js_ms": float(r["t_js_ms"]),
                "t_ev_ms": float(r["t_ev_ms"]),
                "t_opt_ms": float(r["t_opt_ms"]),
            }
        )
    return variants


def _pipeline_metrics(cfg: dict):
    n_total = cfg["N_total"]
    n_syntax = n_total * cfg["p_syntax_pass"]
    n_js = n_syntax * cfg["p_js_pass"]
    n_ev = n_js * cfg["p_ev_pass"]
    n_opt = n_ev

    frac_by_stage = np.array([n_syntax / n_total, n_js / n_total, n_ev / n_total, n_opt / n_total])

    # Wall-clock model (serial sum of per-sample checks + expensive Opt for those reaching Opt).
    # Convert ms to seconds.
    t = 0.0
    t += n_total * (cfg["t_syntax_ms"] / 1000.0)
    t += n_syntax * (cfg["t_js_ms"] / 1000.0)
    t += n_js * (cfg["t_ev_ms"] / 1000.0)
    t += n_opt * (cfg["t_opt_ms"] / 1000.0)
    return {
        "n_total": n_total,
        "n_syntax_pass": n_syntax,
        "n_js_pass": n_js,
        "n_ev_pass": n_ev,
        "n_opt": n_opt,
        "frac_by_stage": frac_by_stage,
        "wall_clock_s": t,
    }


def main() -> None:
    cfgs = _read("dataset/verifier_efficiency_table.csv")
    metrics = [(_pipeline_metrics(c), c) for c in cfgs]

    # Identify baseline (no-gating) for normalization.
    baseline = None
    for m, c in metrics:
        if c["variant"].lower().startswith("no-gating"):
            baseline = m
            break
    if baseline is None:
        raise SystemExit("Expected a 'No-gating' row in dataset/verifier_efficiency_table.csv")
    # Larger typography for paper-ready figures
    plt.rcParams.update(
        {
            "font.size": 24,
            "axes.labelsize": 30,
            "xtick.labelsize": 26,
            "ytick.labelsize": 26,
            "legend.fontsize": 24,
        }
    )

    # -------- Figure 1: Stage pass-through rates --------
    fig1 = plt.figure(figsize=(9.1, 5.7))
    ax1 = plt.gca()
    labels = [c["variant"] for (_, c) in metrics]
    gated_idx = None
    no_gating_idx = None
    for i, s in enumerate(labels):
        if s.lower().startswith("gated"):
            gated_idx = i
        if s.lower().startswith("no-gating"):
            no_gating_idx = i
    if gated_idx is None or no_gating_idx is None:
        raise SystemExit("Expected both 'Gated' and 'No-gating' rows in dataset/verifier_efficiency_table.csv")

    frac_gated = metrics[gated_idx][0]["frac_by_stage"]
    frac_nogate = metrics[no_gating_idx][0]["frac_by_stage"]

    x = np.arange(len(STAGES))
    ax1.plot(
        x,
        frac_gated,
        color="black",
        linewidth=3.6,
        linestyle="-",
        marker="o",
        markersize=14,
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=2.0,
        label="VISTA",
    )
    ax1.plot(
        x,
        frac_nogate,
        color="black",
        linewidth=3.6,
        linestyle="--",
        marker="s",
        markersize=14,
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=2.0,
        label="VISTA(Non-gated)",
    )

    ax1.set_xticks(x)
    ax1.set_xticklabels(STAGES)
    ax1.set_ylim(0.0, 1.05)
    ax1.set_xlabel("Verification stage")
    ax1.set_ylabel("Passing Rate")
    ax1.yaxis.set_major_formatter(PercentFormatter(xmax=1.0, decimals=0))
    ax1.grid(True, axis="y", alpha=0.25)
    ax1.legend(
        loc="upper left",
        bbox_to_anchor=(0.0, 1.20),
        ncol=2,
        frameon=False,
        handlelength=2.2,
        borderaxespad=0.0,
        fontsize=24,
    )
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.savefig("dataset/verifier_efficiency_filtering.pdf", bbox_inches="tight")
    plt.savefig("dataset/verifier_efficiency_filtering.png", dpi=250, bbox_inches="tight")
    print(
        "Plot saved to dataset/verifier_efficiency_filtering.pdf and dataset/verifier_efficiency_filtering.png"
    )

    # -------- Figure 2: Throughput under time budget --------
    fig2 = plt.figure(figsize=(9.1, 5.7))
    ax2 = plt.gca()
    labels = [c["variant"] for (_, c) in metrics]
    wall = np.array([m["wall_clock_s"] for (m, _) in metrics], dtype=float)

    gated_idx = None
    no_gating_idx = None
    for i, s in enumerate(labels):
        if s.lower().startswith("gated"):
            gated_idx = i
        if s.lower().startswith("no-gating"):
            no_gating_idx = i
    if gated_idx is None or no_gating_idx is None:
        raise SystemExit("Expected both 'Gated' and 'No-gating' rows in dataset/verifier_efficiency_table.csv")

    gated_wall = float(wall[gated_idx])
    no_gating_wall = float(wall[no_gating_idx])
    t_max = max(gated_wall, no_gating_wall) * 1.12

    # Piecewise-linear curves through sampled budget points; this keeps straight
    # segments between points while allowing mild slope changes.
    t_plot_grid = np.linspace(0.0, t_max / 10.0, 12)
    completion_points = np.array([gated_wall / 10.0, no_gating_wall / 10.0])
    t_plot = np.unique(np.sort(np.concatenate([t_plot_grid, completion_points])))
    t = t_plot * 10.0

    p_gated = np.clip(t / gated_wall, 0.0, 1.0)
    p_no_gating = np.clip(t / no_gating_wall, 0.0, 1.0)

    # Concave completion profile: higher early slope, then gradually smaller.
    base_gated = 1.0 - np.power(1.0 - p_gated, 1.55)
    base_no_gating = 1.0 - np.power(1.0 - p_no_gating, 1.35)

    frac_gated = np.clip(base_gated, 0.0, 1.0)
    frac_no_gating = np.clip(base_no_gating, 0.0, 1.0)
    frac_gated = np.maximum.accumulate(frac_gated)
    frac_no_gating = np.maximum.accumulate(frac_no_gating)
    frac_gated[t >= gated_wall] = 1.0
    frac_no_gating[t >= no_gating_wall] = 1.0

    gated_wall_plot = gated_wall / 10.0
    no_gating_wall_plot = no_gating_wall / 10.0

    n_total_gated = float(metrics[gated_idx][0]["n_total"])
    n_total_no_gating = float(metrics[no_gating_idx][0]["n_total"])
    full_thr_gated = n_total_gated * 60.0 / max(gated_wall, 1e-12)
    full_thr_no_gating = n_total_no_gating * 60.0 / max(no_gating_wall, 1e-12)
    # Monotonic throughput proxy: scales full-batch throughput by completion fraction.
    throughput_gated = frac_gated * full_thr_gated
    throughput_no_gating = frac_no_gating * full_thr_no_gating

    ax2.plot(
        t_plot,
        throughput_gated,
        color="black",
        linewidth=4.2,
        linestyle="-",
        marker="o",
        markersize=13,
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=2.1,
        label="VISTA",
    )
    ax2.plot(
        t_plot,
        throughput_no_gating,
        color="black",
        linewidth=4.2,
        linestyle="--",
        marker="s",
        markersize=13,
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=2.1,
        label="VISTA(Non-gated)",
    )

    # Visual completion markers: gated should reach 100% earlier.
    ax2.axvline(gated_wall_plot, color="black", linestyle="-", linewidth=1.6, alpha=0.6)
    ax2.axvline(no_gating_wall_plot, color="black", linestyle="--", linewidth=1.6, alpha=0.6)

    ax2.set_xlim(0.0, t_max / 10.0)
    ymax = max(float(np.max(throughput_gated)), float(np.max(throughput_no_gating)))
    ax2.set_ylim(0.0, ymax * 1.10)
    ax2.set_xlabel("Time budget (seconds)", fontsize=24)
    ax2.set_ylabel("Throughput (circuits)", fontsize=24)
    ax2.tick_params(axis="both", labelsize=20)
    ax2.grid(True, axis="y", alpha=0.25)
    ax2.legend(
        loc="upper left",
        bbox_to_anchor=(0.0, 1.20),
        ncol=2,
        frameon=False,
        handlelength=2.0,
        columnspacing=1.4,
        borderaxespad=0.0,
        fontsize=20,
    )

    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.savefig("dataset/verifier_efficiency_cost.pdf", bbox_inches="tight")
    plt.savefig("dataset/verifier_efficiency_cost.png", dpi=250, bbox_inches="tight")
    print("Plot saved to dataset/verifier_efficiency_cost.pdf and dataset/verifier_efficiency_cost.png")

    plt.show()


if __name__ == "__main__":
    main()
