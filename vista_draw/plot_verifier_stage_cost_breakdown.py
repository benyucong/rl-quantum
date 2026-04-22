#!/usr/bin/env python3
"""Plot verifier stage-cost breakdown for gated vs ungated variants.

Goal:
Show where gating saves verifier budget by decomposing average verifier time
per sample into four stages:
  1) Feasibility / parse
  2) Behavior / distribution
  3) Objective / EV
  4) Utility / optimizer

Usage:
  python plot_verifier_stage_cost_breakdown.py \
    --input logs.csv \
    --gated-method Vista \
    --out dataset/verifier_stage_cost_breakdown
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def _extract_json_rows(obj: Any) -> list[dict[str, Any]]:
    if isinstance(obj, list):
        out: list[dict[str, Any]] = []
        for item in obj:
            out.extend(_extract_json_rows(item))
        return out
    if isinstance(obj, dict):
        if any(isinstance(v, (int, float, str, bool, type(None))) for v in obj.values()):
            return [obj]
        out = []
        for v in obj.values():
            out.extend(_extract_json_rows(v))
        return out
    return []


def load_logs(path: str | Path) -> pd.DataFrame:
    p = Path(path)
    if not p.exists():
        raise FileNotFoundError(f"Input not found: {p}")

    if p.suffix.lower() == ".csv":
        df = pd.read_csv(p)
    elif p.suffix.lower() == ".json":
        with open(p, "r", encoding="utf-8") as f:
            obj = json.load(f)
        rows = _extract_json_rows(obj)
        if not rows:
            raise ValueError(f"No row-like objects found in JSON: {p}")
        df = pd.DataFrame(rows)
    else:
        raise ValueError(f"Unsupported input format: {p.suffix}")

    required = {"parsed_ok", "js_ok", "ev_ok"}
    missing = required.difference(df.columns)
    if missing:
        raise KeyError(f"Missing required columns: {sorted(missing)}")
    return df


def _to_bool_series(s: pd.Series) -> pd.Series:
    if s.dtype == bool:
        return s
    s_str = s.astype(str).str.strip().str.lower()
    return s_str.isin({"1", "true", "t", "yes", "y"})


def _balanced_rate(df: pd.DataFrame, col: str, default: float) -> float:
    if col not in df.columns:
        return float(default)
    tmp = df.copy()
    tmp["_flag"] = _to_bool_series(tmp[col]).astype(float)
    group_cols: list[str] = []
    if "run_id" in tmp.columns:
        group_cols.append("run_id")
    if "iter" in tmp.columns:
        group_cols.append("iter")
    if group_cols:
        return float(tmp.groupby(group_cols)["_flag"].mean().mean())
    return float(tmp["_flag"].mean())


def _iter_rate(
    df: pd.DataFrame,
    col: str,
    iters: pd.Index,
    default: float,
    use_run_variance: bool,
) -> pd.Series:
    if col not in df.columns:
        return pd.Series(default, index=iters, dtype=float)

    sub = df.dropna(subset=[col]).copy()
    if sub.empty:
        return pd.Series(default, index=iters, dtype=float)

    sub[col] = _to_bool_series(sub[col]).astype(float)
    if use_run_variance and "run_id" in sub.columns:
        run_iter = sub.groupby(["run_id", "iter"], as_index=False)[col].mean()
        rate = run_iter.groupby("iter")[col].mean().reindex(iters)
    else:
        rate = sub.groupby("iter")[col].mean().reindex(iters)

    return rate.ffill().bfill().fillna(default).clip(0.0, 1.0).astype(float)


def _pick_ungated_method(df: pd.DataFrame, gated_method: str) -> str | None:
    if "method" not in df.columns:
        return None
    methods = [str(m) for m in df["method"].dropna().unique()]
    # Prefer explicit ungated names if present.
    for m in methods:
        l = m.lower()
        if "ungated" in l or "no-gating" in l or "nogating" in l:
            return m
    # Otherwise no explicit ungated baseline in logs.
    _ = gated_method
    return None


def _stage_times_from_rates(
    parse_rate: pd.Series,
    js_rate: pd.Series,
    opt_rate: pd.Series,
    t_parse: float,
    t_js: float,
    t_ev: float,
    t_opt: float,
    ungated: bool,
) -> dict[str, float]:
    # Parse is always executed once per sample.
    parse_time = float(t_parse)
    if ungated:
        # No stage gating: once parsing succeeds, all downstream stages run.
        behavior_time = float((parse_rate * float(t_js)).mean())
        objective_time = float((parse_rate * float(t_ev)).mean())
        utility_time = float((parse_rate * float(t_opt)).mean())
    else:
        # Hierarchical gating: deeper stages run on progressively filtered subsets.
        behavior_time = float((parse_rate * float(t_js)).mean())
        objective_time = float((js_rate * float(t_ev)).mean())
        utility_time = float((opt_rate * float(t_opt)).mean())
    return {
        "Feasibility / parse": parse_time,
        "Behavior / distribution": behavior_time,
        "Objective / EV": objective_time,
        "Utility / optimizer": utility_time,
    }


def compute_stage_breakdown(
    df: pd.DataFrame,
    gated_method: str,
    ungated_method: str | None,
    t_parse: float,
    t_js: float,
    t_ev: float,
    t_opt: float,
) -> tuple[dict[str, float], dict[str, float], str]:
    if "method" in df.columns:
        gated_df = df[df["method"].astype(str) == str(gated_method)].copy()
        if gated_df.empty:
            raise ValueError(f"Gated method '{gated_method}' not found in logs.")
    else:
        gated_df = df.copy()

    use_run_variance = "run_id" in gated_df.columns and gated_df["run_id"].nunique(dropna=True) > 1
    iters_g = pd.Index(sorted(gated_df["iter"].dropna().astype(int).unique().tolist()))
    if iters_g.empty:
        iters_g = pd.Index([0])

    parse_g = _iter_rate(gated_df, "parsed_ok", iters_g, default=1.0, use_run_variance=use_run_variance)
    js_g = _iter_rate(gated_df, "js_ok", iters_g, default=float(parse_g.iloc[0]), use_run_variance=use_run_variance)
    opt_ref = "opt_ran" if "opt_ran" in gated_df.columns else "ev_ok"
    opt_g = _iter_rate(gated_df, opt_ref, iters_g, default=float(js_g.iloc[0]), use_run_variance=use_run_variance)

    gated = _stage_times_from_rates(
        parse_rate=parse_g,
        js_rate=js_g,
        opt_rate=opt_g,
        t_parse=t_parse,
        t_js=t_js,
        t_ev=t_ev,
        t_opt=t_opt,
        ungated=False,
    )

    ungated_note = "synthetic"
    if ungated_method is None:
        ungated_method = _pick_ungated_method(df, gated_method)

    if ungated_method is not None and "method" in df.columns:
        u_df = df[df["method"].astype(str) == str(ungated_method)].copy()
        if not u_df.empty:
            iters_u = pd.Index(sorted(u_df["iter"].dropna().astype(int).unique().tolist()))
            if iters_u.empty:
                iters_u = iters_g
            parse_u = _iter_rate(
                u_df,
                "parsed_ok",
                iters_u,
                default=float(parse_g.iloc[0]),
                use_run_variance=use_run_variance,
            )
            ungated_note = str(ungated_method)
        else:
            parse_u = parse_g
    else:
        parse_u = parse_g

    ungated = _stage_times_from_rates(
        parse_rate=parse_u,
        js_rate=parse_u,
        opt_rate=parse_u,
        t_parse=t_parse,
        t_js=t_js,
        t_ev=t_ev,
        t_opt=t_opt,
        ungated=True,
    )

    return gated, ungated, ungated_note


def plot_stage_cost_breakdown(
    gated: dict[str, float],
    ungated: dict[str, float],
    out_stem: str | Path,
) -> tuple[Path, Path]:
    stage_defs = [
        ("Feasibility / parse", "Feasibility"),
        ("Behavior / distribution", "Behavior"),
        ("Objective / EV", "Objective"),
        ("Utility / optimizer", "Utility"),
    ]

    plt.rcParams.update(
        {
            "font.size": 17,
            "axes.labelsize": 22,
            "xtick.labelsize": 20,
            "ytick.labelsize": 19,
            "legend.fontsize": 17,
        }
    )

    fig, ax = plt.subplots(figsize=(9.2, 4.1))
    y = np.array([0.0, 0.38], dtype=float)
    labels = ["VISTA", "VISTA\n(Non-gated)"]

    # Grayscale + hatches keeps the plot publication-safe in black/white print.
    fills = ["0.90", "0.78", "0.66", "0.54"]
    hatches = ["", "//", "..", "xx"]

    left = np.zeros_like(y, dtype=float)
    for idx, (stage_key, stage_label) in enumerate(stage_defs):
        vals = np.array([gated[stage_key], ungated[stage_key]], dtype=float)
        ax.barh(
            y,
            vals,
            height=0.28,
            left=left,
            color=fills[idx],
            edgecolor="black",
            linewidth=1.5,
            hatch=hatches[idx],
            label=stage_label,
        )
        left += vals

    totals = np.array([sum(gated.values()), sum(ungated.values())], dtype=float)
    x_pad = max(0.02, 0.03 * float(totals.max()))
    for i, total in enumerate(totals):
        ax.text(total + x_pad, y[i], f"{total:.2f}s", ha="left", va="center", fontsize=18)

    ax.set_yticks(y)
    ax.set_yticklabels(labels)
    ax.set_xlabel("Verifier time (s/iter)")
    ax.grid(True, axis="x", alpha=0.28)
    ax.set_xlim(0.0, float(totals.max()) * 1.24)

    ax.legend(
        loc="upper left",
        bbox_to_anchor=(0.0, 0.915),
        bbox_transform=fig.transFigure,
        frameon=False,
        ncol=4,
        columnspacing=0.9,
        handlelength=1.7,
        handletextpad=0.45,
        labelspacing=0.25,
        borderaxespad=0.0,
    )

    fig.tight_layout(rect=[0.0, 0.0, 1.0, 0.86])
    out = Path(out_stem).with_suffix("")
    out.parent.mkdir(parents=True, exist_ok=True)
    out_pdf = out.with_suffix(".pdf")
    out_png = out.with_suffix(".png")
    fig.savefig(out_pdf, bbox_inches="tight")
    fig.savefig(out_png, dpi=300, bbox_inches="tight")
    plt.close(fig)
    return out_pdf, out_png


def _print_takeaway(gated: dict[str, float], ungated: dict[str, float], ungated_note: str) -> None:
    stage_order = [
        "Feasibility / parse",
        "Behavior / distribution",
        "Objective / EV",
        "Utility / optimizer",
    ]
    g = np.array([gated[s] for s in stage_order], dtype=float)
    u = np.array([ungated[s] for s in stage_order], dtype=float)
    savings = u - g
    total_g = float(g.sum())
    total_u = float(u.sum())
    total_saved = float(savings.sum())

    print(f"Gated total avg verifier time/iteration:   {total_g:.4f}s")
    print(f"Ungated total avg verifier time/iteration: {total_u:.4f}s ({ungated_note})")
    if total_u > 1e-12:
        print(f"Gated vs ungated reduction: {100.0 * (total_u - total_g) / total_u:.1f}%")
    if total_saved > 1e-12:
        print("Stage-wise contribution to saved verifier time:")
        for s, sv in sorted(zip(stage_order, savings), key=lambda x: x[1], reverse=True):
            share = 100.0 * sv / total_saved
            print(f"  - {s}: {sv:.4f}s ({share:.1f}%)")


def main() -> None:
    parser = argparse.ArgumentParser(description="Plot verifier stage-cost breakdown (gated vs ungated).")
    parser.add_argument("--input", required=True, help="Path to CSV/JSON logs.")
    parser.add_argument("--out", default="dataset/verifier_stage_cost_breakdown", help="Output file stem.")
    parser.add_argument("--gated-method", default="Vista", help="Method name for gated variant.")
    parser.add_argument(
        "--ungated-method",
        default=None,
        help="Method name for ungated variant. If absent, use explicit ungated method if available, else synthetic.",
    )
    parser.add_argument(
        "--time-parse",
        type=float,
        default=0.1243,
        help="Parse/feasibility stage time (s) per sample (Helmi-calibrated).",
    )
    parser.add_argument(
        "--time-js",
        type=float,
        default=1.2139,
        help="Behavior/distribution stage time (s) per sample (Helmi-calibrated).",
    )
    parser.add_argument(
        "--time-ev",
        type=float,
        default=7.2147,
        help="Objective/EV stage time (s) per sample (Helmi-calibrated).",
    )
    parser.add_argument(
        "--time-opt",
        type=float,
        default=0.50,
        help="Utility/optimizer stage time (s) per sample (Helmi-calibrated).",
    )
    args = parser.parse_args()

    df = load_logs(args.input)
    gated, ungated, ungated_note = compute_stage_breakdown(
        df=df,
        gated_method=args.gated_method,
        ungated_method=args.ungated_method,
        t_parse=args.time_parse,
        t_js=args.time_js,
        t_ev=args.time_ev,
        t_opt=args.time_opt,
    )
    out_pdf, out_png = plot_stage_cost_breakdown(gated, ungated, args.out)
    _print_takeaway(gated, ungated, ungated_note)
    print(f"Saved: {out_pdf}")
    print(f"Saved: {out_png}")


if __name__ == "__main__":
    main()
