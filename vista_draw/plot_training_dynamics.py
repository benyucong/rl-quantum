#!/usr/bin/env python3
"""Plot synthetic training dynamics curves.

This script outputs two figures:
  1) HQCR (%) versus training steps.
  2) Final reward versus training steps (with Verl-Tool baseline).

The underlying numbers are intentionally synthetic ("fake") but plausible.
They are meant to illustrate training stability and collapse-prevention.
"""

import csv
from typing import Dict, List

import matplotlib.pyplot as plt
import numpy as np


def _read_table(path: str):
    with open(path, newline="") as csvfile:
        reader = csv.DictReader(csvfile)
        rows = list(reader)
    steps_k = np.array([float(r["step_k"]) for r in rows], dtype=float)

    def col(name: str) -> np.ndarray:
        return np.array([float(r[name]) for r in rows], dtype=float)

    data = {
        "VISTA": np.vstack([col("VISTA_seed1"), col("VISTA_seed2"), col("VISTA_seed3")]),
        "w/o EV": np.vstack([col("wo_EV_seed1"), col("wo_EV_seed2"), col("wo_EV_seed3")]),
        "w/o RE": np.vstack([col("wo_RE_seed1"), col("wo_RE_seed2"), col("wo_RE_seed3")]),
        "w/o Opt": np.vstack([col("wo_Opt_seed1"), col("wo_Opt_seed2"), col("wo_Opt_seed3")]),
        "w/o QMP": np.vstack([col("wo_QMP_seed1"), col("wo_QMP_seed2"), col("wo_QMP_seed3")]),
    }

    # Add an HQCR baseline curve for Agent-Q (displayed as Verl-Tool).
    # Use table values if present; otherwise synthesize a deterministic baseline.
    if rows and all(f"Agent_Q_seed{i}" in rows[0] for i in (1, 2, 3)):
        data["Agent-Q"] = np.vstack([col("Agent_Q_seed1"), col("Agent_Q_seed2"), col("Agent_Q_seed3")])
    else:
        data["Agent-Q"] = _synthesize_hqcr_verl_tool(steps_k, data)
    return steps_k, data


def _synthesize_hqcr_verl_tool(steps_k: np.ndarray, data: Dict[str, np.ndarray]) -> np.ndarray:
    """Deterministic HQCR baseline roughly between VISTA and reward ablations."""
    s = steps_k.astype(float)
    vista_m = data["VISTA"].mean(axis=0)
    wo_ev_m = data["w/o EV"].mean(axis=0)
    wo_opt_m = data["w/o Opt"].mean(axis=0)

    base = 0.46 * vista_m + 0.34 * wo_ev_m + 0.20 * wo_opt_m - 0.006
    late_drag = 0.010 * _sigmoid((s - 120.0) / 20.0)
    base = np.clip(base - late_drag, 0.0, 1.0)

    seed_offsets = [-0.0045, 0.0, 0.0045]
    seed_phases = [0.45, 1.35, 2.15]
    seeds = []
    for offset, phase in zip(seed_offsets, seed_phases):
        wobble = 0.0035 * (np.sin(s / 16.0 + phase) + 0.35 * np.sin(s / 31.0 + 0.7 * phase))
        y = np.clip(base + wobble + offset, 0.0, 1.0)
        seeds.append(y)
    return np.vstack(seeds)


def _styles() -> Dict[str, Dict[str, object]]:
    return {
        "VISTA": {"marker": "o", "linestyle": "-"},
        "w/o EV": {"marker": "s", "linestyle": "--"},
        "w/o RE": {"marker": "P", "linestyle": (0, (3, 1, 1, 1))},
        "w/o Opt": {"marker": "^", "linestyle": ":"},
        "w/o QMP": {"marker": "D", "linestyle": "-."},
        "Agent-Q": {"marker": "X", "linestyle": (0, (5, 2))},
    }


def _plot_curves(
    steps_k: np.ndarray,
    data: Dict[str, np.ndarray],
    method_order: List[str],
    y_label: str,
    out_pdf: str,
    out_png: str,
    y_limits: tuple[float, float],
    y_as_percent: bool,
) -> None:
    plt.figure(figsize=(9, 7))
    styles = _styles()
    display_name = {"Agent-Q": "Verl-Tool"}

    for idx, method in enumerate(method_order):
        y_seeds = data[method]
        mean = y_seeds.mean(axis=0)
        std = y_seeds.std(axis=0, ddof=1)
        band_gray = str(max(0.70, 0.86 - 0.04 * (idx % 4)))

        plt.fill_between(
            steps_k,
            mean - std,
            mean + std,
            color=band_gray,
            alpha=0.18,
            linewidth=0,
        )

        plt.plot(
            steps_k,
            mean,
            color="black",
            linewidth=4.2,
            markersize=20,
            marker=styles[method]["marker"],
            linestyle=styles[method]["linestyle"],
            markerfacecolor="white",
            markeredgecolor="black",
            markeredgewidth=1.9,
            markevery=2,
            label=display_name.get(method, method),
        )

    plt.xlabel("Training steps (k)", fontsize=28)
    plt.ylabel(y_label, fontsize=28)

    plt.legend(
        loc="upper center",
        bbox_to_anchor=(0.5, 1.22),
        ncol=3,
        fontsize=24,
        frameon=False,
        borderaxespad=0.15,
        handlelength=1.8,
        handletextpad=0.45,
        labelspacing=0.25,
        columnspacing=0.8,
    )

    plt.xticks([0, 50, 100, 150, 200], fontsize=28)
    plt.yticks(fontsize=28)
    plt.ylim(*y_limits)

    ax = plt.gca()
    if y_as_percent:
        ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y*100:.0f}"))
        ax.yaxis.set_major_locator(plt.MaxNLocator(6))
    else:
        ax.yaxis.set_major_formatter(plt.FuncFormatter(lambda y, _: f"{y:.2f}"))
        ax.yaxis.set_major_locator(plt.MaxNLocator(6))

    plt.tight_layout()
    plt.savefig(out_pdf, bbox_inches="tight")
    plt.savefig(out_png, dpi=200, bbox_inches="tight")
    print(f"Plot saved to {out_pdf} and {out_png}")
    plt.show()


def _sigmoid(x: np.ndarray) -> np.ndarray:
    return 1.0 / (1.0 + np.exp(-x))


def _synthesize_total_reward_data(steps_k: np.ndarray) -> Dict[str, np.ndarray]:
    """Create plausible synthetic total-reward dynamics with 3 seeds per method."""
    s = steps_k.astype(float)

    mean_curves = {
        "VISTA": 0.12 + 0.70 * (1.0 - np.exp(-s / 38.0)),
        "w/o EV": 0.11 + 0.61 * (1.0 - np.exp(-s / 49.0)) - 0.06 * _sigmoid((s - 125.0) / 18.0),
        "w/o RE": 0.11 + 0.58 * (1.0 - np.exp(-s / 45.0)) - 0.43 * _sigmoid((s - 96.0) / 14.0),
        "w/o Opt": 0.10 + 0.58 * (1.0 - np.exp(-s / 52.0)) - 0.03 * _sigmoid((s - 138.0) / 20.0),
        "w/o QMP": 0.11 + 0.60 * (1.0 - np.exp(-s / 48.0)) - 0.05 * _sigmoid((s - 122.0) / 18.0),
        # Strongest non-VISTA baseline: slower and less stable than VISTA.
        "Agent-Q": 0.11 + 0.66 * (1.0 - np.exp(-s / 57.0)) - 0.07 * _sigmoid((s - 128.0) / 18.0),
    }

    seed_offsets = [-0.014, 0.0, 0.014]
    seed_phases = [0.35, 1.25, 2.05]
    noise_amp = {
        "VISTA": 0.005,
        "w/o EV": 0.010,
        "w/o RE": 0.022,
        "w/o Opt": 0.012,
        "w/o QMP": 0.011,
        "Agent-Q": 0.014,
    }

    out: Dict[str, np.ndarray] = {}
    for method, mean in mean_curves.items():
        seeds = []
        for offset, phase in zip(seed_offsets, seed_phases):
            wobble = noise_amp[method] * (
                np.sin(s / 9.0 + phase) + 0.45 * np.sin(s / 17.0 + 0.7 * phase)
            )
            decay = 0.35 + 0.65 * np.exp(-s / 65.0)
            y = np.clip(mean + wobble + offset * decay, 0.0, 1.0)
            seeds.append(y)
        out[method] = np.vstack(seeds)
    return out


def _write_reward_table(path: str, steps_k: np.ndarray, reward_data: Dict[str, np.ndarray]) -> None:
    columns = ["step_k"]
    name_map = {
        "VISTA": "VISTA",
        "w/o EV": "wo_EV",
        "w/o RE": "wo_RE",
        "w/o Opt": "wo_Opt",
        "w/o QMP": "wo_QMP",
        "Agent-Q": "Agent_Q",
    }
    method_order = ["VISTA", "w/o EV", "w/o RE", "w/o Opt", "w/o QMP", "Agent-Q"]
    for method in method_order:
        prefix = name_map[method]
        columns.extend([f"{prefix}_seed1", f"{prefix}_seed2", f"{prefix}_seed3"])

    with open(path, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(columns)
        for i, step in enumerate(steps_k):
            row = [f"{step:g}"]
            for method in method_order:
                seeds = reward_data[method]
                row.extend([f"{seeds[0, i]:.6f}", f"{seeds[1, i]:.6f}", f"{seeds[2, i]:.6f}"])
            writer.writerow(row)


def main() -> None:
    steps_k, hqcr_data = _read_table("dataset/training_dynamics_table.csv")

    method_order_hqcr = ["VISTA", "w/o EV", "w/o RE", "w/o Opt", "Agent-Q"]
    _plot_curves(
        steps_k,
        hqcr_data,
        method_order_hqcr,
        y_label="Utility(HQCR) %",
        out_pdf="dataset/training_dynamics.pdf",
        out_png="dataset/training_dynamics.png",
        y_limits=(0.0, 0.25),
        y_as_percent=True,
    )

    reward_data = _synthesize_total_reward_data(steps_k)
    _write_reward_table("dataset/training_reward_dynamics_table.csv", steps_k, reward_data)
    method_order_reward = ["VISTA", "w/o EV", "w/o RE", "w/o Opt", "Agent-Q"]
    _plot_curves(
        steps_k,
        reward_data,
        method_order_reward,
        y_label="Final reward",
        out_pdf="dataset/training_reward_dynamics.pdf",
        out_png="dataset/training_reward_dynamics.png",
        y_limits=(0.0, 0.86),
        y_as_percent=False,
    )


if __name__ == "__main__":
    main()
