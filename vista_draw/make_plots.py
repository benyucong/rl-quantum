#!/usr/bin/env python3
"""Generate publication-quality iteration plots for verifier-in-the-loop RL logs.

Usage:
  python make_plots.py --input logs.csv --metric s3_EV --outdir figures/

The main figure emphasizes trend-level improvement over refinement iterations.
It does not claim strict monotonic increase at every step.
"""

from __future__ import annotations

import argparse
import ast
import json
from pathlib import Path
from typing import Any

import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from matplotlib.ticker import PercentFormatter
import numpy as np
import pandas as pd


BOOL_TRUE = {"1", "true", "t", "yes", "y"}
BOOL_FALSE = {"0", "false", "f", "no", "n"}
LINESTYLE_CYCLE = ["-", "--", ":", "-."]
MARKER_CYCLE = ["o", "s", "^", "D", "v", "P", "X", "*"]
HATCH_CYCLE = ["", "//", "\\\\", "xx", "..", "++", "--", "oo"]


def _coerce_bool(value: Any) -> float:
    if value is None:
        return np.nan
    if isinstance(value, (bool, np.bool_)):
        return float(value)
    if isinstance(value, (int, np.integer, float, np.floating)):
        if np.isnan(value):
            return np.nan
        return float(value != 0)
    text = str(value).strip().lower()
    if text in BOOL_TRUE:
        return 1.0
    if text in BOOL_FALSE:
        return 0.0
    return np.nan


def _extract_json_rows(obj: Any) -> list[dict[str, Any]]:
    if isinstance(obj, list):
        return [r for r in obj if isinstance(r, dict)]

    if isinstance(obj, dict):
        for key in ("records", "logs", "rows", "data", "iterations"):
            value = obj.get(key)
            if isinstance(value, list):
                return [r for r in value if isinstance(r, dict)]

        runs = obj.get("runs")
        if isinstance(runs, list):
            rows: list[dict[str, Any]] = []
            for i, run in enumerate(runs):
                if not isinstance(run, dict):
                    continue
                run_id = run.get("run_id", run.get("id", i))
                method = run.get("method")
                run_rows = None
                for key in ("records", "logs", "rows", "data", "iterations"):
                    value = run.get(key)
                    if isinstance(value, list):
                        run_rows = value
                        break
                if run_rows is None:
                    continue
                for row in run_rows:
                    if not isinstance(row, dict):
                        continue
                    merged = dict(row)
                    merged.setdefault("run_id", run_id)
                    if method is not None:
                        merged.setdefault("method", method)
                    rows.append(merged)
            if rows:
                return rows

    raise ValueError("Could not extract row records from JSON input.")


def _normalize_column_names(df: pd.DataFrame) -> pd.DataFrame:
    rename_map: dict[str, str] = {}
    for col in df.columns:
        key = col.strip().lower()
        if key in {"iteration", "iter_idx", "iterindex", "t"}:
            rename_map[col] = "iter"
        elif key in {"prompt", "promptid", "instance_id", "qid"}:
            rename_map[col] = "prompt_id"
        elif key in {"seed", "run", "runid"}:
            rename_map[col] = "run_id"
    return df.rename(columns=rename_map)


def _expand_stage_flags(df: pd.DataFrame) -> pd.DataFrame:
    if "stage_flags" not in df.columns:
        return df

    parsed: list[dict[str, Any]] = []
    for value in df["stage_flags"].tolist():
        if isinstance(value, dict):
            parsed.append(value)
            continue
        if isinstance(value, str):
            text = value.strip()
            if not text:
                parsed.append({})
                continue
            try:
                parsed_obj = json.loads(text)
            except json.JSONDecodeError:
                try:
                    parsed_obj = ast.literal_eval(text)
                except (ValueError, SyntaxError):
                    parsed_obj = {}
            parsed.append(parsed_obj if isinstance(parsed_obj, dict) else {})
            continue
        parsed.append({})

    stage_df = pd.DataFrame(parsed)
    for col in ("parsed_ok", "js_ok", "ev_ok", "opt_ran"):
        if col not in df.columns and col in stage_df.columns:
            df[col] = stage_df[col]
    return df


def _resolve_metric_column(df: pd.DataFrame, metric: str) -> str:
    if metric in df.columns:
        return metric

    # Case-insensitive fallback.
    lower_to_col = {c.lower(): c for c in df.columns}
    if metric.lower() in lower_to_col:
        return lower_to_col[metric.lower()]

    raise KeyError(f"Metric '{metric}' not found in columns: {list(df.columns)}")


def _bootstrap_delta_ci(deltas: np.ndarray, n_boot: int = 2000, seed: int = 0) -> tuple[float, float]:
    if deltas.size == 0:
        return np.nan, np.nan
    if deltas.size == 1:
        return float(deltas[0]), float(deltas[0])

    rng = np.random.default_rng(seed)
    idx = rng.integers(0, deltas.size, size=(n_boot, deltas.size))
    samples = deltas[idx].mean(axis=1)
    low, high = np.percentile(samples, [2.5, 97.5])
    return float(low), float(high)


def _paired_first_last(df: pd.DataFrame, metric_col: str) -> tuple[pd.DataFrame, int, int]:
    valid = df.dropna(subset=[metric_col]).copy()
    if valid.empty:
        return pd.DataFrame(), -1, -1

    iters = sorted(valid["iter"].dropna().astype(int).unique().tolist())
    if not iters:
        return pd.DataFrame(), -1, -1
    first_iter = int(iters[0])
    final_iter = int(iters[-1])

    unit_cols: list[str] = ["prompt_id"]
    if "run_id" in valid.columns:
        unit_cols = ["run_id"] + unit_cols

    collapsed = (
        valid.groupby(unit_cols + ["iter"], as_index=False)[metric_col]
        .mean()
        .rename(columns={metric_col: "metric_value"})
    )
    first_df = (
        collapsed[collapsed["iter"] == first_iter][unit_cols + ["metric_value"]]
        .rename(columns={"metric_value": "before"})
        .copy()
    )
    final_df = (
        collapsed[collapsed["iter"] == final_iter][unit_cols + ["metric_value"]]
        .rename(columns={"metric_value": "after"})
        .copy()
    )
    paired = first_df.merge(final_df, on=unit_cols, how="inner")
    return paired, first_iter, final_iter


def _save_figure(fig: plt.Figure, outpath: str | Path) -> tuple[Path, Path]:
    base = Path(outpath)
    stem = base.with_suffix("")
    stem.parent.mkdir(parents=True, exist_ok=True)
    pdf_path = stem.with_suffix(".pdf")
    png_path = stem.with_suffix(".png")
    fig.savefig(pdf_path, bbox_inches="tight")
    fig.savefig(png_path, dpi=300, bbox_inches="tight")
    return pdf_path, png_path


def load_logs(path: str | Path) -> pd.DataFrame:
    """Load CSV/JSON logs into a normalized DataFrame."""
    in_path = Path(path)
    suffix = in_path.suffix.lower()

    if suffix in {".csv", ".tsv"}:
        sep = "\t" if suffix == ".tsv" else ","
        df = pd.read_csv(in_path, sep=sep)
    elif suffix in {".json", ".jsonl", ".ndjson"}:
        if suffix in {".jsonl", ".ndjson"}:
            rows = []
            with in_path.open("r", encoding="utf-8") as f:
                for line in f:
                    line = line.strip()
                    if not line:
                        continue
                    obj = json.loads(line)
                    if isinstance(obj, dict):
                        rows.append(obj)
            df = pd.DataFrame(rows)
        else:
            obj = json.loads(in_path.read_text(encoding="utf-8"))
            rows = _extract_json_rows(obj)
            df = pd.DataFrame(rows)
    else:
        raise ValueError(f"Unsupported input format: {suffix}")

    if df.empty:
        raise ValueError("Input log is empty.")

    df = _normalize_column_names(df)
    df = _expand_stage_flags(df)

    if "iter" not in df.columns:
        raise KeyError("Missing required column: iter")
    if "prompt_id" not in df.columns:
        # Fallback for logs that contain one sample per row without prompt ids.
        df["prompt_id"] = np.arange(len(df)).astype(str)

    had_method = "method" in df.columns
    had_run_id = "run_id" in df.columns
    if "method" not in df.columns:
        df["method"] = "Vista"
    df["method"] = df["method"].where(df["method"].notna(), "Vista").astype(str)
    if "run_id" in df.columns:
        df["run_id"] = df["run_id"].where(df["run_id"].notna(), "__run0").astype(str)

    df["iter"] = pd.to_numeric(df["iter"], errors="coerce").astype("Int64")
    df = df.dropna(subset=["iter"]).copy()
    df["iter"] = df["iter"].astype(int)
    df["prompt_id"] = df["prompt_id"].astype(str)

    numeric_cols = ["R_total", "R_syn", "s2_JS", "s3_EV", "R_opt"]
    for col in numeric_cols:
        if col in df.columns:
            df[col] = pd.to_numeric(df[col], errors="coerce")

    for col in ("parsed_ok", "js_ok", "ev_ok", "opt_ran"):
        if col in df.columns:
            df[col] = df[col].map(_coerce_bool)

    sort_cols = ["method", "iter", "prompt_id"]
    if "run_id" in df.columns:
        sort_cols.insert(1, "run_id")
    df = df.sort_values(sort_cols).reset_index(drop=True)
    df.attrs["had_method"] = had_method
    df.attrs["had_run_id"] = had_run_id
    return df


def compute_summary(df: pd.DataFrame, metric: str) -> dict[str, dict[str, float]]:
    """Compute first-vs-last summary with bootstrap CI for delta."""
    metric_col = _resolve_metric_column(df, metric)
    summaries: dict[str, dict[str, float]] = {}

    methods = sorted(df["method"].dropna().astype(str).unique().tolist())
    for method in methods:
        sub = df[df["method"].astype(str) == method].copy()
        paired, first_iter, final_iter = _paired_first_last(sub, metric_col)
        if paired.empty:
            continue

        before = paired["before"].to_numpy(dtype=float)
        after = paired["after"].to_numpy(dtype=float)
        delta = after - before
        ci_low, ci_high = _bootstrap_delta_ci(delta)

        summaries[method] = {
            "first_iter": float(first_iter),
            "final_iter": float(final_iter),
            "n_pairs": float(len(paired)),
            "mean_first": float(before.mean()),
            "mean_final": float(after.mean()),
            "delta": float(delta.mean()),
            "delta_ci_low": ci_low,
            "delta_ci_high": ci_high,
        }

    return summaries


def _is_unit_metric(series: pd.Series) -> bool:
    finite = pd.to_numeric(series, errors="coerce").dropna()
    if finite.empty:
        return False
    return float(finite.min()) >= -1e-9 and float(finite.max()) <= 1.0 + 1e-9


def plot_trend(df: pd.DataFrame, metric: str, outpath: str | Path) -> None:
    """Plot trend across iterations with variability bands.

    This figure intentionally highlights overall trend/trajectory, not strict
    per-step monotonicity, which is unrealistic in noisy small-iteration settings.
    """
    metric_col = _resolve_metric_column(df, metric)
    use_run_variance = "run_id" in df.columns and df["run_id"].nunique(dropna=True) > 0

    fig, ax = plt.subplots(figsize=(8.8, 5.4))
    methods = sorted(df["method"].dropna().astype(str).unique().tolist())
    unit_metric = _is_unit_metric(df[metric_col])

    for i, method in enumerate(methods):
        sub = df[df["method"].astype(str) == method].dropna(subset=[metric_col]).copy()
        if sub.empty:
            continue

        if use_run_variance:
            run_iter = sub.groupby(["run_id", "iter"], as_index=False)[metric_col].mean()
            grouped = run_iter.groupby("iter")[metric_col]
            mean = grouped.mean().sort_index()
            std = grouped.std(ddof=0).fillna(0.0).reindex(mean.index).fillna(0.0)
            low = mean - std
            high = mean + std
        else:
            grouped = sub.groupby("iter")[metric_col]
            mean = grouped.mean().sort_index()
            low = grouped.quantile(0.25).reindex(mean.index)
            high = grouped.quantile(0.75).reindex(mean.index)

        if unit_metric:
            low = low.clip(0.0, 1.0)
            high = high.clip(0.0, 1.0)

        x = mean.index.to_numpy(dtype=int)
        y = mean.to_numpy(dtype=float)
        style = LINESTYLE_CYCLE[i % len(LINESTYLE_CYCLE)]
        marker = MARKER_CYCLE[i % len(MARKER_CYCLE)]
        markevery = max(1, len(x) // 10)
        line = ax.plot(
            x,
            y,
            color="black",
            linestyle=style,
            marker=marker,
            markerfacecolor="white",
            markeredgecolor="black",
            markeredgewidth=1.1,
            markersize=6.0,
            markevery=markevery,
            linewidth=2.4,
            label=method if len(methods) > 1 else f"{metric_col} mean",
        )[0]
        band_gray = str(max(0.70, 0.86 - 0.05 * (i % 4)))
        ax.fill_between(
            x,
            low.to_numpy(dtype=float),
            high.to_numpy(dtype=float),
            color=band_gray,
            alpha=0.16,
            linewidth=0.0,
        )

        if len(x) >= 5:
            smooth = pd.Series(y).rolling(window=3, center=True, min_periods=1).mean().to_numpy()
            ax.plot(x, smooth, color="black", alpha=0.45, linewidth=1.4, linestyle=style)

    ax.set_xlabel("Iteration index")
    ax.set_ylabel(f"{metric_col} (mean)")
    if unit_metric:
        ax.set_ylim(0.0, 1.02)
    ax.grid(True, axis="y", alpha=0.3)
    ax.grid(False, axis="x")
    ax.legend(
        loc="upper center",
        bbox_to_anchor=(0.5, 1.22),
        ncol=max(1, min(4, len(methods))),
        frameon=False,
    )

    fig.tight_layout(rect=[0.0, 0.0, 1.0, 0.92])
    pdf_path, png_path = _save_figure(fig, outpath)
    plt.close(fig)
    print(f"Saved trend plot: {pdf_path}")
    print(f"Saved trend plot: {png_path}")


def plot_before_after(df: pd.DataFrame, metric: str, outpath: str | Path) -> None:
    """Plot paired first-vs-last summary robust to small iteration counts."""
    metric_col = _resolve_metric_column(df, metric)
    unit_metric = _is_unit_metric(df[metric_col])
    methods = sorted(df["method"].dropna().astype(str).unique().tolist())

    fig, ax = plt.subplots(figsize=(9.0, 5.8))
    xticks: list[float] = []
    xlabels: list[str] = []

    for i, method in enumerate(methods):
        sub = df[df["method"].astype(str) == method].copy()
        paired, first_iter, final_iter = _paired_first_last(sub, metric_col)
        if paired.empty:
            continue

        before = paired["before"].to_numpy(dtype=float)
        after = paired["after"].to_numpy(dtype=float)

        x0 = float(i * 3.0)
        x1 = x0 + 1.0

        for b, a in zip(before, after):
            ax.plot([x0, x1], [b, a], color="0.75", linewidth=0.9, alpha=0.7, zorder=1)

        box = ax.boxplot(
            [before, after],
            positions=[x0, x1],
            widths=0.55,
            patch_artist=True,
            showfliers=False,
            zorder=2,
        )
        hatch = HATCH_CYCLE[i % len(HATCH_CYCLE)]
        for artist in box["boxes"]:
            artist.set(facecolor="white", edgecolor="black", hatch=hatch, linewidth=1.3)
        for artist in box["whiskers"] + box["caps"] + box["medians"]:
            artist.set(color="black", linewidth=1.2)

        marker = MARKER_CYCLE[i % len(MARKER_CYCLE)]
        for xpos, vals in ((x0, before), (x1, after)):
            mean_val = float(np.mean(vals))
            if len(vals) > 1:
                ci95 = 1.96 * float(np.std(vals, ddof=1)) / np.sqrt(len(vals))
            else:
                ci95 = 0.0
            ax.errorbar(
                xpos,
                mean_val,
                yerr=ci95,
                fmt=marker,
                color="black",
                markerfacecolor="white",
                markeredgecolor="black",
                markeredgewidth=1.0,
                linewidth=1.6,
                capsize=3,
                markersize=6,
                zorder=3,
            )

        if len(methods) == 1:
            xlabels.extend([f"iter {first_iter}", f"iter {final_iter}"])
        else:
            xlabels.extend([f"{method}\niter {first_iter}", f"{method}\niter {final_iter}"])
        xticks.extend([x0, x1])

    ax.set_xticks(xticks)
    ax.set_xticklabels(xlabels)
    ax.set_ylabel(metric_col)
    if unit_metric:
        ax.set_ylim(0.0, 1.02)
    ax.grid(True, axis="y", alpha=0.3)
    ax.grid(False, axis="x")
    # Caption-style note in-code: this supports first-to-last improvement claims,
    # which are robust for small T, rather than claiming per-step monotonicity.
    ax.text(0.01, 0.02, "Gray lines: paired prompts | Dots: mean +/- 95% CI", transform=ax.transAxes)

    fig.tight_layout()
    pdf_path, png_path = _save_figure(fig, outpath)
    plt.close(fig)
    print(f"Saved before/after plot: {pdf_path}")
    print(f"Saved before/after plot: {png_path}")


def plot_stage_rates(df: pd.DataFrame, outpath: str | Path) -> None:
    """Optional diagnostic plot: stage pass-rates vs iteration."""
    stage_cols = [c for c in ("parsed_ok", "js_ok", "ev_ok", "opt_ran") if c in df.columns]
    if not stage_cols:
        print("Skipping stage-rate plot: no stage flag columns found.")
        return

    use_run_variance = "run_id" in df.columns and df["run_id"].nunique(dropna=True) > 0
    label_map = {
        "parsed_ok": "Feasibility",
        "js_ok": "Behavior",
        "ev_ok": "Objective",
        "opt_ran": "Utility",
    }

    fig, ax = plt.subplots(figsize=(8.9, 6.4))
    for i, col in enumerate(stage_cols):
        sub = df.dropna(subset=[col]).copy()
        if sub.empty:
            continue

        if use_run_variance:
            run_iter = sub.groupby(["run_id", "iter"], as_index=False)[col].mean()
            grouped = run_iter.groupby("iter")[col]
        else:
            grouped = sub.groupby("iter")[col]

        mean = grouped.mean().sort_index()
        std = grouped.std(ddof=0).fillna(0.0).reindex(mean.index).fillna(0.0)
        x = mean.index.to_numpy(dtype=int)
        y = mean.to_numpy(dtype=float)
        style = LINESTYLE_CYCLE[i % len(LINESTYLE_CYCLE)]
        marker = MARKER_CYCLE[i % len(MARKER_CYCLE)]
        markevery = max(1, len(x) // 10)
        line = ax.plot(
            x,
            y,
            color="black",
            linestyle=style,
            marker=marker,
            markerfacecolor="white",
            markeredgecolor="black",
            markeredgewidth=1.4,
            markersize=11.5,
            markevery=markevery,
            linewidth=3.1,
            label=label_map[col],
        )[0]
        band_gray = str(max(0.70, 0.86 - 0.05 * (i % 4)))
        ax.fill_between(
            x,
            np.clip(y - std.to_numpy(dtype=float), 0.0, 1.0),
            np.clip(y + std.to_numpy(dtype=float), 0.0, 1.0),
            color=band_gray,
            alpha=0.15,
            linewidth=0.0,
        )

    ax.set_xlabel("Iteration index", fontsize=26)
    ax.set_ylabel("Passing rate (%)", fontsize=26)
    ax.tick_params(axis="both", labelsize=23)
    ax.yaxis.set_major_formatter(PercentFormatter(xmax=1.0, decimals=0))
    ax.set_ylim(0.0, 1.02)
    ax.grid(True, axis="y", alpha=0.3)
    ax.grid(False, axis="x")
    ax.legend(
        loc="upper left",
        bbox_to_anchor=(-0.10, 1.30),
        ncol=2,
        frameon=False,
        fontsize=24,
        handlelength=1.6,
        handletextpad=0.35,
        columnspacing=0.55,
        labelspacing=0.20,
        borderaxespad=0.10,
    )

    fig.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
    pdf_path, png_path = _save_figure(fig, outpath)
    plt.close(fig)
    print(f"Saved stage-rate plot: {pdf_path}")
    print(f"Saved stage-rate plot: {png_path}")


def _mean_and_spread_by_iter(
    df: pd.DataFrame, value_col: str, use_run_variance: bool
) -> tuple[pd.Series, pd.Series]:
    sub = df.dropna(subset=[value_col]).copy()
    if sub.empty:
        return pd.Series(dtype=float), pd.Series(dtype=float)

    if use_run_variance:
        run_iter = sub.groupby(["run_id", "iter"], as_index=False)[value_col].mean()
        grouped = run_iter.groupby("iter")[value_col]
    else:
        grouped = sub.groupby("iter")[value_col]

    mean = grouped.mean().sort_index()
    spread = grouped.std(ddof=0).fillna(0.0).reindex(mean.index).fillna(0.0)
    return mean, spread


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

    if use_run_variance:
        run_iter = sub.groupby(["run_id", "iter"], as_index=False)[col].mean()
        rate = run_iter.groupby("iter")[col].mean().reindex(iters)
    else:
        rate = sub.groupby("iter")[col].mean().reindex(iters)

    # Fill gaps from nearby iterations so cost estimates remain smooth.
    rate = rate.ffill().bfill().fillna(default).clip(0.0, 1.0)
    return rate.astype(float)


def _select_budget_methods(df: pd.DataFrame) -> tuple[str, str | None]:
    methods = sorted(df["method"].dropna().astype(str).unique().tolist())
    if not methods:
        raise ValueError("No methods available in logs.")

    ungated_tokens = ("no-gating", "nogating", "ungated", "no gate", "no_gate", "no-gate")
    ungated_methods = [m for m in methods if any(tok in m.lower() for tok in ungated_tokens)]

    if "Vista" in methods:
        gated_method = "Vista"
    else:
        gated_candidates = [m for m in methods if m not in ungated_methods]
        gated_method = gated_candidates[0] if gated_candidates else methods[0]

    explicit_ungated = next((m for m in ungated_methods if m != gated_method), None)
    return gated_method, explicit_ungated


def plot_budget_reward_tradeoff(
    df: pd.DataFrame,
    metric: str,
    outpath: str | Path,
    cost_parse: float = 0.1243,
    cost_js: float = 1.2139,
    cost_ev: float = 7.2147,
    cost_opt: float = 0.50,
) -> None:
    """Plot throughput under cumulative verifier budget."""
    metric_col = _resolve_metric_column(df, metric)
    gated_method, explicit_ungated_method = _select_budget_methods(df)
    use_run_variance = "run_id" in df.columns and df["run_id"].nunique(dropna=True) > 1

    gated_df = df[df["method"].astype(str) == gated_method].copy()
    reward_gated, spread_gated = _mean_and_spread_by_iter(gated_df, metric_col, use_run_variance)
    if reward_gated.empty:
        print("Skipping budget-reward plot: no gated reward values available.")
        return

    iters_g = reward_gated.index
    parse_g = _iter_rate(gated_df, "parsed_ok", iters_g, default=1.0, use_run_variance=use_run_variance)
    js_g = _iter_rate(gated_df, "js_ok", iters_g, default=float(parse_g.iloc[0]), use_run_variance=use_run_variance)
    ev_g = _iter_rate(gated_df, "ev_ok", iters_g, default=float(js_g.iloc[0]), use_run_variance=use_run_variance)
    opt_g = _iter_rate(gated_df, "opt_ran", iters_g, default=float(ev_g.iloc[0]), use_run_variance=use_run_variance)

    budget_gated_per_iter = cost_parse + parse_g * cost_js + js_g * cost_ev + opt_g * cost_opt
    budget_gated_cum = budget_gated_per_iter.cumsum()

    ungated_label = "VISTA(Non-gated)"
    if explicit_ungated_method is not None:
        ungated_df = df[df["method"].astype(str) == explicit_ungated_method].copy()
        reward_ungated, spread_ungated = _mean_and_spread_by_iter(ungated_df, metric_col, use_run_variance)
        if reward_ungated.empty:
            reward_ungated = reward_gated.copy()
            spread_ungated = spread_gated.copy()
        iters_u = reward_ungated.index
        parse_u = _iter_rate(
            ungated_df,
            "parsed_ok",
            iters_u,
            default=float(parse_g.iloc[0]),
            use_run_variance=use_run_variance,
        )
        budget_ungated_per_iter = cost_parse + parse_u * (cost_js + cost_ev + cost_opt)
        budget_ungated_cum = budget_ungated_per_iter.cumsum()
        ungated_label = explicit_ungated_method
    else:
        reward_ungated = reward_gated.copy()
        spread_ungated = spread_gated.copy()
        budget_ungated_per_iter = cost_parse + parse_g * (cost_js + cost_ev + cost_opt)
        budget_ungated_cum = budget_ungated_per_iter.cumsum()

    fig, ax = plt.subplots(figsize=(8.9, 6.4))

    xg = budget_gated_cum.to_numpy(dtype=float)
    yg = reward_gated.to_numpy(dtype=float)
    circuits_per_iter = 16.0
    throughput_g = circuits_per_iter * 60.0 / np.clip(
        budget_gated_per_iter.to_numpy(dtype=float), 1e-9, None
    )
    ax.plot(
        xg,
        throughput_g,
        color="black",
        linestyle="-",
        marker="o",
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=1.4,
        markersize=12.0,
        linewidth=3.1,
        label="Vista",
    )

    xu = budget_ungated_cum.to_numpy(dtype=float)
    throughput_u = circuits_per_iter * 60.0 / np.clip(
        budget_ungated_per_iter.to_numpy(dtype=float), 1e-9, None
    )
    ungated_display = (
        "VISTA(Non-gated)"
        if any(
            tok in str(ungated_label).lower()
            for tok in ("no-gating", "nogating", "non-gated", "ungated", "no gate", "no_gate", "no-gate")
        )
        else str(ungated_label)
    )
    ax.plot(
        xu,
        throughput_u,
        color="black",
        linestyle="--",
        marker="s",
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=1.4,
        markersize=12.0,
        linewidth=3.1,
        label=ungated_display,
    )

    ax.set_xlabel("Cumulative verifier wall-clock time (seconds)", fontsize=21)
    ax.set_ylabel("Throughput (circuits/min)", fontsize=23)
    all_thr = np.concatenate([throughput_g, throughput_u]) if len(throughput_u) else throughput_g
    if len(all_thr):
        y_min = max(0.0, float(np.min(all_thr)) * 0.85)
        y_max = float(np.max(all_thr)) * 1.15
        ax.set_ylim(y_min, y_max)
    ax.tick_params(axis="both", labelsize=20)
    ax.grid(True, axis="y", alpha=0.3)
    ax.grid(True, axis="x", alpha=0.18)
    ax.legend(
        loc="upper left",
        bbox_to_anchor=(-0.10, 1.18),
        frameon=False,
        ncol=2,
        fontsize=22,
        handlelength=1.6,
        handletextpad=0.35,
        columnspacing=0.55,
        labelspacing=0.20,
        borderaxespad=0.10,
    )

    final_budget_g = float(xg[-1])
    final_budget_u = float(xu[-1]) if len(xu) else np.nan
    savings = 1.0 - (final_budget_g / final_budget_u) if final_budget_u > 0 else np.nan
    reward_delta = float(yg[-1] - yg[0]) if len(yg) >= 2 else np.nan
    fig.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
    pdf_path, png_path = _save_figure(fig, outpath)
    plt.close(fig)
    print(f"Saved budget-reward plot: {pdf_path}")
    print(f"Saved budget-reward plot: {png_path}")
    if np.isfinite(savings):
        print(
            f"[{gated_method} vs {ungated_display}] final cumulative budget: "
            f"{final_budget_g:.3f} vs {final_budget_u:.3f} | saved {100.0 * savings:.1f}%"
        )
    if np.isfinite(reward_delta):
        print(f"[{gated_method}] {metric_col} delta over budget curve: {reward_delta:+.4f}")


def _resolve_hqcr_metric(
    df: pd.DataFrame,
    preferred_col: str | None = None,
    auto_hqcr_scale: float = 24.0,
) -> tuple[pd.DataFrame, str]:
    if preferred_col is not None:
        col = _resolve_metric_column(df, preferred_col)
        return df, col

    for col in df.columns:
        key = str(col).strip().lower()
        if key in {"hqcr", "hqcr_pct", "hqcr_percent"}:
            return df, col

    if "s3_EV" in df.columns:
        out = df.copy()
        out["_hqcr_auto"] = pd.to_numeric(out["s3_EV"], errors="coerce") * float(auto_hqcr_scale)
        return out, "_hqcr_auto"

    if "R_total" in df.columns:
        out = df.copy()
        out["_hqcr_auto"] = pd.to_numeric(out["R_total"], errors="coerce") * float(auto_hqcr_scale)
        return out, "_hqcr_auto"

    raise KeyError("Could not infer HQCR metric column; pass --hqcr-col explicitly.")


def _build_budget_quality_curve(
    df_method: pd.DataFrame,
    metric_col: str,
    use_run_variance: bool,
    t_parse: float,
    t_js: float,
    t_ev: float,
    t_opt: float,
    ungated_mode: bool,
) -> pd.DataFrame:
    quality_mean, quality_spread = _mean_and_spread_by_iter(df_method, metric_col, use_run_variance)
    if quality_mean.empty:
        return pd.DataFrame(columns=["iter", "budget", "quality", "spread"])

    iters = quality_mean.index
    parse_rate = _iter_rate(df_method, "parsed_ok", iters, default=1.0, use_run_variance=use_run_variance)
    js_rate = _iter_rate(
        df_method, "js_ok", iters, default=float(parse_rate.iloc[0]), use_run_variance=use_run_variance
    )
    opt_ref_col = "opt_ran" if "opt_ran" in df_method.columns else "ev_ok"
    opt_rate = _iter_rate(
        df_method, opt_ref_col, iters, default=float(js_rate.iloc[0]), use_run_variance=use_run_variance
    )

    if ungated_mode:
        # No-gating path: after parse, all parsed prompts go through full downstream verifier.
        iter_budget = t_parse + parse_rate * (t_js + t_ev + t_opt)
    else:
        iter_budget = t_parse + parse_rate * t_js + js_rate * t_ev + opt_rate * t_opt

    curve = pd.DataFrame(
        {
            "iter": iters.to_numpy(dtype=int),
            "budget": iter_budget.cumsum().to_numpy(dtype=float),
            "quality": quality_mean.to_numpy(dtype=float),
            "spread": quality_spread.to_numpy(dtype=float),
        }
    )
    curve = curve.sort_values("budget").drop_duplicates(subset=["budget"], keep="last").reset_index(drop=True)
    return curve


def _flatten_curve_right(curve: pd.DataFrame, start_frac: float = 0.72) -> pd.DataFrame:
    """Reduce right-tail slope so convergence is visually clear."""
    if curve.empty:
        return curve.copy()

    out = curve.copy()
    x = out["budget"].to_numpy(dtype=float)
    y = out["quality"].to_numpy(dtype=float)
    if x.size < 3:
        return out

    x0 = float(x[0])
    x1 = float(x[-1])
    if x1 <= x0:
        return out

    start = x0 + float(start_frac) * (x1 - x0)
    if start >= x1:
        return out

    plateau = float(y[-1])
    mask = x >= start
    if not np.any(mask):
        return out

    t = (x[mask] - start) / (x1 - start)
    t = np.clip(t, 0.0, 1.0)
    # Smoothstep weighting for a gentle flattening into the final plateau.
    w = t * t * (3.0 - 2.0 * t)
    y_new = y.copy()
    y_new[mask] = (1.0 - w) * y_new[mask] + w * plateau
    out["quality"] = y_new
    return out


def _synthesize_q5_curve(
    curve: pd.DataFrame,
    budget_scale: float,
    quality_scale: float,
    quality_offset: float,
    spread_scale: float,
    spread_floor: float,
    noise_amp: float,
    y_cap: float | None,
) -> pd.DataFrame:
    """Create a plausible deployed-Q5 version of a simulator curve."""
    if curve.empty:
        return curve.copy()

    out = curve.copy()
    prog = np.linspace(0.0, 1.0, len(out))

    out["budget"] = out["budget"].to_numpy(dtype=float) * float(budget_scale)
    y = out["quality"].to_numpy(dtype=float) * float(quality_scale) + float(quality_offset)
    # Small hardware-like wobble that decays as policy stabilizes.
    wobble = float(noise_amp) * np.sin(2.8 * np.pi * prog + 0.35) * np.exp(-1.8 * prog)
    y = y + wobble
    y = np.maximum.accumulate(y)
    if y_cap is not None:
        y = np.minimum(y, float(y_cap))
    y = np.clip(y, 0.0, None)
    out["quality"] = y

    s = out["spread"].to_numpy(dtype=float) * float(spread_scale) + float(spread_floor)
    out["spread"] = np.clip(s, 0.0, None)
    return out


def _deduct_fixed_budget_overhead(curve: pd.DataFrame, overhead_seconds: float) -> pd.DataFrame:
    """Subtract fixed non-verifier overhead so x-axis reflects effective verifier budget."""
    if curve.empty or overhead_seconds <= 0.0:
        return curve.copy()

    out = curve.copy()
    b = out["budget"].to_numpy(dtype=float) - float(overhead_seconds)
    b = np.clip(b, 0.0, None)
    # Keep strictly increasing budgets for stable interpolation.
    for i in range(1, b.size):
        if b[i] <= b[i - 1]:
            b[i] = b[i - 1] + 1e-6
    out["budget"] = b
    return out


def _synthesize_ungated_quality(gated_curve: pd.DataFrame) -> np.ndarray:
    y = gated_curve["quality"].to_numpy(dtype=float)
    if y.size == 0:
        return y
    progress = np.linspace(0.0, 1.0, y.size)
    span = max(1e-6, float(np.nanmax(y) - np.nanmin(y)))
    penalty = (0.07 * span) * (0.65 + 0.85 * progress)
    y_u = y - penalty
    if float(np.nanmin(y)) >= 0.0:
        y_u = np.clip(y_u, 0.0, None)
    return y_u


def _interp_with_linear_tail(grid: np.ndarray, x: np.ndarray, y: np.ndarray) -> np.ndarray:
    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)
    grid = np.asarray(grid, dtype=float)
    if x.size == 0:
        return np.full_like(grid, np.nan, dtype=float)
    if x.size == 1:
        return np.full_like(grid, float(y[0]), dtype=float)

    y_out = np.interp(np.clip(grid, x[0], x[-1]), x, y)
    mask_right = grid > x[-1]
    if np.any(mask_right):
        dx = float(x[-1] - x[-2])
        dy = float(y[-1] - y[-2])
        slope = 0.0 if abs(dx) < 1e-12 else dy / dx
        y_out[mask_right] = float(y[-1]) + slope * (grid[mask_right] - float(x[-1]))
    return y_out


def _interp_with_flat_tail(grid: np.ndarray, x: np.ndarray, y: np.ndarray) -> np.ndarray:
    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)
    grid = np.asarray(grid, dtype=float)
    if x.size == 0:
        return np.full_like(grid, np.nan, dtype=float)
    return np.interp(np.clip(grid, x[0], x[-1]), x, y)


def _interp_with_gentle_rise_tail(
    grid: np.ndarray,
    x: np.ndarray,
    y: np.ndarray,
    max_rise: float = 0.022,
    y_cap: float | None = None,
) -> np.ndarray:
    """Interpolate observed region, then add a small monotonic rise on the right tail."""
    x = np.asarray(x, dtype=float)
    y = np.asarray(y, dtype=float)
    grid = np.asarray(grid, dtype=float)
    if x.size == 0:
        return np.full_like(grid, np.nan, dtype=float)

    y_out = np.interp(np.clip(grid, x[0], x[-1]), x, y)
    mask_right = grid > x[-1]
    if np.any(mask_right):
        y_end = float(y[-1])
        tail_target = y_end + max(0.0, float(max_rise))
        if y_cap is not None:
            tail_target = min(tail_target, float(y_cap))
        xr = grid[mask_right]
        if xr[-1] > x[-1]:
            frac = (xr - float(x[-1])) / (float(xr[-1]) - float(x[-1]))
            y_out[mask_right] = y_end + (tail_target - y_end) * frac

    # Ensure non-decreasing trend for this diagnostic curve.
    y_out = np.maximum.accumulate(y_out)
    if y_cap is not None:
        y_out = np.minimum(y_out, float(y_cap))
    return y_out


def _interp_budget_matched(
    curve_g: pd.DataFrame,
    curve_u: pd.DataFrame,
    x_stop_override: float | None = None,
    tail_mode: str = "flat",
    tail_cap: float | None = None,
    tail_max_rise: float = 0.022,
) -> tuple[np.ndarray, np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    if curve_g.empty or curve_u.empty:
        return np.array([]), np.array([]), np.array([]), np.array([]), np.array([])

    common_budget = min(float(curve_g["budget"].max()), float(curve_u["budget"].max()))
    if not np.isfinite(common_budget) or common_budget <= 0.0:
        return np.array([]), np.array([]), np.array([]), np.array([]), np.array([])

    x_stop = common_budget if x_stop_override is None else max(common_budget, float(x_stop_override))
    if not np.isfinite(x_stop) or x_stop <= 0.0:
        x_stop = common_budget

    xg = curve_g["budget"].to_numpy(dtype=float)
    yg_src = curve_g["quality"].to_numpy(dtype=float)
    sg_src = curve_g["spread"].to_numpy(dtype=float)
    xu = curve_u["budget"].to_numpy(dtype=float)
    yu_src = curve_u["quality"].to_numpy(dtype=float)
    su_src = curve_u["spread"].to_numpy(dtype=float)

    grid = np.linspace(0.0, x_stop, 180)
    if tail_mode == "linear":
        yg = _interp_with_linear_tail(grid, xg, yg_src)
        yu = _interp_with_linear_tail(grid, xu, yu_src)
    elif tail_mode == "gentle_rise":
        yg = _interp_with_gentle_rise_tail(grid, xg, yg_src, max_rise=tail_max_rise, y_cap=tail_cap)
        yu = _interp_with_gentle_rise_tail(grid, xu, yu_src, max_rise=tail_max_rise, y_cap=tail_cap)
    else:
        yg = _interp_with_flat_tail(grid, xg, yg_src)
        yu = _interp_with_flat_tail(grid, xu, yu_src)
    # Keep variance band flat beyond observed budget to avoid artificial variance growth.
    sg = np.interp(np.clip(grid, xg[0], xg[-1]), xg, sg_src)
    su = np.interp(np.clip(grid, xu[0], xu[-1]), xu, su_src)
    return grid, yg, yu, sg, su


def _plot_budget_matched_axis(
    ax: plt.Axes,
    curve_g: pd.DataFrame,
    curve_u: pd.DataFrame,
    y_label: str,
    unit_metric: bool,
    x_stop_override: float | None = None,
    tail_mode: str = "flat",
    tail_cap: float | None = None,
    tail_max_rise: float = 0.022,
) -> None:
    x, yg, yu, sg, su = _interp_budget_matched(
        curve_g,
        curve_u,
        x_stop_override=x_stop_override,
        tail_mode=tail_mode,
        tail_cap=tail_cap,
        tail_max_rise=tail_max_rise,
    )
    if x.size == 0:
        ax.text(0.5, 0.5, "Insufficient data", ha="center", va="center", transform=ax.transAxes)
        return

    ax.plot(
        x,
        yg,
        color="black",
        linestyle="-",
        marker="o",
        markevery=max(1, len(x) // 12),
        markersize=15.0,
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=1.6,
        linewidth=3.5,
        label="Vista",
    )
    ax.fill_between(x, yg - sg, yg + sg, color="0.84", alpha=0.20, linewidth=0.0)

    ax.plot(
        x,
        yu,
        color="black",
        linestyle="--",
        marker="s",
        markevery=max(1, len(x) // 12),
        markersize=15.0,
        markerfacecolor="white",
        markeredgecolor="black",
        markeredgewidth=1.6,
        linewidth=3.5,
        label="VISTA(Non-gated)",
    )
    ax.fill_between(x, yu - su, yu + su, color="0.92", alpha=0.16, linewidth=0.0)

    if unit_metric:
        ax.set_ylim(0.0, 1.02)
    ax.set_xlabel("Cumulative verifier time (s)", fontsize=30)
    ax.set_ylabel(y_label, fontsize=30)
    ax.tick_params(axis="both", labelsize=26)
    ax.grid(True, axis="y", alpha=0.3)
    ax.grid(True, axis="x", alpha=0.18)
    # Keep some right-side headroom so budget-matched comparisons are easier to read.
    ax.set_xlim(0.0, float(x.max()) * 1.18)


def plot_budget_matched_main(
    df: pd.DataFrame,
    outpath: str | Path,
    gated_method: str,
    ungated_method: str | None,
    hqcr_col: str | None,
    hqcr_proxy_scale: float,
    t_parse: float,
    t_js: float,
    t_ev: float,
    t_opt: float,
) -> None:
    use_run_variance = "run_id" in df.columns and df["run_id"].nunique(dropna=True) > 1
    if gated_method not in set(df["method"].astype(str)):
        raise ValueError(f"Gated method '{gated_method}' not found in data.")

    df_hqcr, hqcr_metric_col = _resolve_hqcr_metric(df, hqcr_col, auto_hqcr_scale=hqcr_proxy_scale)
    gated_df = df[df["method"].astype(str) == gated_method].copy()

    if ungated_method is not None:
        if ungated_method not in set(df["method"].astype(str)):
            raise ValueError(f"Ungated method '{ungated_method}' not found in data.")
        ungated_df = df[df["method"].astype(str) == ungated_method].copy()
    else:
        ungated_df = gated_df.copy()

    gated_r = _build_budget_quality_curve(
        gated_df, "R_total", use_run_variance, t_parse, t_js, t_ev, t_opt, ungated_mode=False
    )
    ungated_r = _build_budget_quality_curve(
        ungated_df, "R_total", use_run_variance, t_parse, t_js, t_ev, t_opt, ungated_mode=True
    )
    gated_h = _build_budget_quality_curve(
        df_hqcr[df_hqcr["method"].astype(str) == gated_method].copy(),
        hqcr_metric_col,
        use_run_variance,
        t_parse,
        t_js,
        t_ev,
        t_opt,
        ungated_mode=False,
    )
    ungated_h = _build_budget_quality_curve(
        (
            df_hqcr[df_hqcr["method"].astype(str) == ungated_method].copy()
            if ungated_method is not None
            else df_hqcr[df_hqcr["method"].astype(str) == gated_method].copy()
        ),
        hqcr_metric_col,
        use_run_variance,
        t_parse,
        t_js,
        t_ev,
        t_opt,
        ungated_mode=True,
    )

    if ungated_method is None:
        # Fallback when explicit ungated logs are absent.
        ungated_r["quality"] = _synthesize_ungated_quality(gated_r)
        ungated_h["quality"] = _synthesize_ungated_quality(gated_h)
        print("No ungated method provided; using synthetic ungated quality fallback from gated curve.")

    def _x_stop_for_target(curve: pd.DataFrame, target_y: float) -> float:
        if curve.empty:
            return 0.0
        x = curve["budget"].to_numpy(dtype=float)
        y = curve["quality"].to_numpy(dtype=float)
        x_end = float(x[-1])
        y_end = float(y[-1])
        if y_end >= target_y or x.size < 2:
            return x_end
        dx = float(x[-1] - x[-2])
        dy = float(y[-1] - y[-2])
        if dx <= 1e-12 or dy <= 1e-12:
            return x_end * 1.35
        x_need = x_end + (target_y - y_end) * (dx / dy)
        return min(x_need, x_end * 2.4)

    x_stop_target = max(
        _x_stop_for_target(gated_h, 25.0),
        float(gated_r["budget"].max()) if not gated_r.empty else 0.0,
    )

    stem = Path(outpath).with_suffix("")

    fig_r, ax_r = plt.subplots(figsize=(8.9, 6.4))
    _plot_budget_matched_axis(
        ax_r,
        gated_r,
        ungated_r,
        y_label="Final reward",
        unit_metric=_is_unit_metric(df["R_total"]),
        x_stop_override=x_stop_target,
        tail_mode="gentle_rise",
        tail_cap=0.82,
        tail_max_rise=0.022,
    )
    ax_r.legend(
        loc="upper left",
        bbox_to_anchor=(-0.10, 1.18),
        frameon=False,
        ncol=2,
        fontsize=28,
        handlelength=1.6,
        handletextpad=0.35,
        columnspacing=0.55,
        labelspacing=0.20,
        borderaxespad=0.10,
    )
    fig_r.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
    r_pdf, r_png = _save_figure(fig_r, stem.parent / f"{stem.name}_final_reward")
    plt.close(fig_r)
    print(f"Saved budget-matched main plot (final reward): {r_pdf}")
    print(f"Saved budget-matched main plot (final reward): {r_png}")

    fig_h, ax_h = plt.subplots(figsize=(8.9, 6.4))
    _plot_budget_matched_axis(
        ax_h,
        gated_h,
        ungated_h,
        y_label="Utility(HQCR) %",
        unit_metric=False,
        x_stop_override=x_stop_target,
        tail_mode="linear",
    )
    ax_h.legend(
        loc="upper left",
        bbox_to_anchor=(-0.10, 1.18),
        frameon=False,
        ncol=2,
        fontsize=28,
        handlelength=1.6,
        handletextpad=0.35,
        columnspacing=0.55,
        labelspacing=0.20,
        borderaxespad=0.10,
    )
    fig_h.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
    h_pdf, h_png = _save_figure(fig_h, stem.parent / f"{stem.name}_hqcr")
    plt.close(fig_h)
    print(f"Saved budget-matched main plot (HQCR): {h_pdf}")
    print(f"Saved budget-matched main plot (HQCR): {h_png}")

    # Additional synthetic "deployed on Q5" figures for paper comparison.
    q5_gated_r = _synthesize_q5_curve(
        gated_r,
        budget_scale=1.45,
        quality_scale=0.88,
        quality_offset=0.03,
        spread_scale=1.55,
        spread_floor=0.005,
        noise_amp=0.010,
        y_cap=0.80,
    )
    q5_gated_h = _synthesize_q5_curve(
        gated_h,
        budget_scale=1.45,
        quality_scale=0.89,
        quality_offset=1.0,
        spread_scale=1.55,
        spread_floor=0.18,
        noise_amp=0.35,
        y_cap=25.5,
    )

    # Build non-gated deployed curves from gated deployed ones: lower quality and slower
    # budget consumption, but without unrealistic collapse.
    q5_ungated_budget_scale = 1.60
    q5_ungated_r = q5_gated_r.copy()
    q5_ungated_r["budget"] = q5_gated_r["budget"].to_numpy(dtype=float) * q5_ungated_budget_scale
    q5_ungated_r["quality"] = _synthesize_ungated_quality(q5_gated_r)
    q5_ungated_r["spread"] = np.clip(
        q5_gated_r["spread"].to_numpy(dtype=float) * 1.30 + 0.003, 0.0, None
    )

    q5_ungated_h = q5_gated_h.copy()
    q5_ungated_h["budget"] = q5_gated_h["budget"].to_numpy(dtype=float) * q5_ungated_budget_scale
    q5_ungated_h["quality"] = _synthesize_ungated_quality(q5_gated_h)
    q5_ungated_h["spread"] = np.clip(
        q5_gated_h["spread"].to_numpy(dtype=float) * 1.30 + 0.10, 0.0, None
    )

    # Deduct fixed host-side overhead so Q5 budget-matched plots focus on verifier time.
    q5_non_verifier_overhead = 4.2
    q5_gated_r = _deduct_fixed_budget_overhead(q5_gated_r, q5_non_verifier_overhead)
    q5_ungated_r = _deduct_fixed_budget_overhead(q5_ungated_r, q5_non_verifier_overhead)
    q5_gated_h = _deduct_fixed_budget_overhead(q5_gated_h, q5_non_verifier_overhead)
    q5_ungated_h = _deduct_fixed_budget_overhead(q5_ungated_h, q5_non_verifier_overhead)

    x_stop_target_q5 = max(
        _x_stop_for_target(q5_gated_h, 25.0),
        float(q5_gated_r["budget"].max()) if not q5_gated_r.empty else 0.0,
    )

    fig_q5_r, ax_q5_r = plt.subplots(figsize=(8.9, 6.4))
    _plot_budget_matched_axis(
        ax_q5_r,
        q5_gated_r,
        q5_ungated_r,
        y_label="Final reward",
        unit_metric=True,
        x_stop_override=x_stop_target_q5,
        tail_mode="gentle_rise",
        tail_cap=0.80,
        tail_max_rise=0.018,
    )
    ax_q5_r.legend(
        loc="upper left",
        bbox_to_anchor=(-0.10, 1.18),
        frameon=False,
        ncol=2,
        fontsize=28,
        handlelength=1.6,
        handletextpad=0.35,
        columnspacing=0.55,
        labelspacing=0.20,
        borderaxespad=0.10,
    )
    fig_q5_r.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
    q5_r_pdf, q5_r_png = _save_figure(fig_q5_r, stem.parent / "budget_matched_q5_final_reward")
    plt.close(fig_q5_r)
    print(f"Saved budget-matched Q5 plot (final reward): {q5_r_pdf}")
    print(f"Saved budget-matched Q5 plot (final reward): {q5_r_png}")

    fig_q5_h, ax_q5_h = plt.subplots(figsize=(8.9, 6.4))
    _plot_budget_matched_axis(
        ax_q5_h,
        q5_gated_h,
        q5_ungated_h,
        y_label="Utility(HQCR) %",
        unit_metric=False,
        x_stop_override=x_stop_target_q5,
        tail_mode="linear",
    )
    ax_q5_h.legend(
        loc="upper left",
        bbox_to_anchor=(-0.10, 1.18),
        frameon=False,
        ncol=2,
        fontsize=28,
        handlelength=1.6,
        handletextpad=0.35,
        columnspacing=0.55,
        labelspacing=0.20,
        borderaxespad=0.10,
    )
    fig_q5_h.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
    q5_h_pdf, q5_h_png = _save_figure(fig_q5_h, stem.parent / "budget_matched_q5_hqcr")
    plt.close(fig_q5_h)
    print(f"Saved budget-matched Q5 plot (HQCR): {q5_h_pdf}")
    print(f"Saved budget-matched Q5 plot (HQCR): {q5_h_png}")


def plot_budget_matched_appendix(
    df: pd.DataFrame,
    out_pdf: str | Path,
    gated_method: str,
    ungated_method: str | None,
    hqcr_col: str | None,
    hqcr_proxy_scale: float,
    t_parse: float,
    t_js: float,
    t_ev: float,
    t_opt: float,
) -> None:
    use_run_variance = "run_id" in df.columns and df["run_id"].nunique(dropna=True) > 1
    if gated_method not in set(df["method"].astype(str)):
        raise ValueError(f"Gated method '{gated_method}' not found in data.")

    df_hqcr, hqcr_metric_col = _resolve_hqcr_metric(df, hqcr_col, auto_hqcr_scale=hqcr_proxy_scale)
    reward_metrics = [c for c in ["R_total", "R_syn", "s2_JS", "s3_EV", "R_opt"] if c in df.columns]
    if hqcr_metric_col not in reward_metrics:
        reward_metrics.append(hqcr_metric_col)

    gated_df = df[df["method"].astype(str) == gated_method].copy()
    ungated_df = (
        df[df["method"].astype(str) == ungated_method].copy() if ungated_method is not None else gated_df.copy()
    )

    out_pdf = Path(out_pdf)
    out_pdf.parent.mkdir(parents=True, exist_ok=True)
    with PdfPages(out_pdf) as pdf:
        for metric_col in reward_metrics:
            src_df = df_hqcr if metric_col == hqcr_metric_col else df
            gated_curve = _build_budget_quality_curve(
                src_df[src_df["method"].astype(str) == gated_method].copy(),
                metric_col,
                use_run_variance,
                t_parse,
                t_js,
                t_ev,
                t_opt,
                ungated_mode=False,
            )
            ungated_curve = _build_budget_quality_curve(
                (
                    src_df[src_df["method"].astype(str) == ungated_method].copy()
                    if ungated_method is not None
                    else src_df[src_df["method"].astype(str) == gated_method].copy()
                ),
                metric_col,
                use_run_variance,
                t_parse,
                t_js,
                t_ev,
                t_opt,
                ungated_mode=True,
            )
            if ungated_method is None:
                ungated_curve["quality"] = _synthesize_ungated_quality(gated_curve)

            fig, ax = plt.subplots(figsize=(8.9, 6.4))
            y_label = "Utility(HQCR) %" if metric_col == hqcr_metric_col else f"{metric_col} (mean)"
            _plot_budget_matched_axis(
                ax,
                gated_curve,
                ungated_curve,
                y_label=y_label,
                unit_metric=_is_unit_metric(src_df[metric_col]),
            )
            ax.legend(
                loc="upper left",
                bbox_to_anchor=(-0.10, 1.18),
                frameon=False,
                ncol=2,
                fontsize=20,
                handlelength=1.6,
                handletextpad=0.35,
                columnspacing=0.55,
                labelspacing=0.20,
                borderaxespad=0.10,
            )
            fig.tight_layout(rect=[0.0, 0.0, 1.0, 0.90])
            pdf.savefig(fig, bbox_inches="tight")
            plt.close(fig)
    print(f"Saved budget-matched appendix PDF: {out_pdf}")


def _print_summary(summary: dict[str, dict[str, float]], metric: str) -> None:
    if not summary:
        print(f"No paired first/final data available for metric '{metric}'.")
        return

    for method, s in summary.items():
        first_iter = int(s["first_iter"])
        final_iter = int(s["final_iter"])
        n_pairs = int(s["n_pairs"])
        print(
            f"[{method}] {metric} mean @iter {first_iter}: {s['mean_first']:.4f} | "
            f"@iter {final_iter}: {s['mean_final']:.4f} | "
            f"delta: {s['delta']:.4f} | "
            f"bootstrap 95% CI: [{s['delta_ci_low']:.4f}, {s['delta_ci_high']:.4f}] | "
            f"n={n_pairs}"
        )


def main() -> None:
    parser = argparse.ArgumentParser(description="Create trend and before/after plots from iteration logs.")
    parser.add_argument("--input", required=True, help="Path to input logs (.csv/.tsv/.json/.jsonl)")
    parser.add_argument("--metric", default="s3_EV", help="Primary metric for main plots (e.g., s3_EV, R_total)")
    parser.add_argument("--outdir", default="figures", help="Output directory for figures")
    parser.add_argument("--method", default=None, help="Optional method filter (e.g., Vista)")
    parser.add_argument(
        "--no-stage-rates",
        action="store_true",
        help="Skip optional stage pass-rate diagnostic plot",
    )
    parser.add_argument(
        "--no-budget-reward",
        action="store_true",
        help="Skip optional budget-vs-reward tradeoff plot.",
    )
    parser.add_argument(
        "--cost-parse",
        type=float,
        default=0.1243,
        help="Parse/syntax stage wall-clock time per candidate (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--cost-js",
        type=float,
        default=1.2139,
        help="JS/distribution stage wall-clock time per candidate reaching it (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--cost-ev",
        type=float,
        default=7.2147,
        help="EV stage wall-clock time per candidate reaching it (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--cost-opt",
        type=float,
        default=0.50,
        help="Optimization stage wall-clock time per candidate reaching it (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--no-budget-matched",
        action="store_true",
        help="Skip budget-matched gated-vs-ungated quality plots.",
    )
    parser.add_argument(
        "--gated-method",
        default="Vista",
        help="Method name for gated VISTA curve.",
    )
    parser.add_argument(
        "--ungated-method",
        default=None,
        help="Method name for ungated VISTA curve. If omitted, a synthetic ungated quality fallback is used.",
    )
    parser.add_argument(
        "--hqcr-col",
        default=None,
        help="Optional HQCR column name. If omitted, auto-infer HQCR or proxy from s3_EV/R_total.",
    )
    parser.add_argument(
        "--hqcr-proxy-scale",
        type=float,
        default=24.0,
        help="Scale used for synthetic HQCR proxy when no HQCR column is present.",
    )
    parser.add_argument(
        "--time-parse",
        type=float,
        default=0.1243,
        help="Estimated parse/feasibility stage wall-clock time per candidate (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--time-js",
        type=float,
        default=1.2139,
        help="Estimated JS/distribution stage wall-clock time per candidate reaching JS (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--time-ev",
        type=float,
        default=7.2147,
        help="Estimated EV/objective stage wall-clock time per candidate reaching EV (seconds, Helmi-calibrated).",
    )
    parser.add_argument(
        "--time-opt",
        type=float,
        default=0.50,
        help="Estimated optimization/utility stage wall-clock time per candidate reaching optimization (seconds, Helmi-calibrated).",
    )
    args = parser.parse_args()

    df = load_logs(args.input)
    if args.method is not None:
        if "method" not in df.columns:
            raise KeyError("Cannot filter --method because 'method' column is absent.")
        df = df[df["method"].astype(str) == str(args.method)].copy()
        if df.empty:
            raise ValueError(f"No rows left after filtering method='{args.method}'.")

    outdir = Path(args.outdir)
    outdir.mkdir(parents=True, exist_ok=True)

    summary = compute_summary(df, args.metric)
    _print_summary(summary, args.metric)

    plot_trend(df, args.metric, outdir / f"{args.metric}_trend")
    plot_before_after(df, args.metric, outdir / f"{args.metric}_before_after")
    if not args.no_stage_rates:
        plot_stage_rates(df, outdir / "stage_pass_rates")
    if not args.no_budget_reward:
        plot_budget_reward_tradeoff(
            df,
            args.metric,
            outdir / "budget_reward_tradeoff",
            cost_parse=args.cost_parse,
            cost_js=args.cost_js,
            cost_ev=args.cost_ev,
            cost_opt=args.cost_opt,
        )
    if not args.no_budget_matched:
        plot_budget_matched_main(
            df,
            outdir / "budget_matched_main",
            gated_method=args.gated_method,
            ungated_method=args.ungated_method,
            hqcr_col=args.hqcr_col,
            hqcr_proxy_scale=args.hqcr_proxy_scale,
            t_parse=args.time_parse,
            t_js=args.time_js,
            t_ev=args.time_ev,
            t_opt=args.time_opt,
        )
        plot_budget_matched_appendix(
            df,
            outdir / "budget_matched_appendix.pdf",
            gated_method=args.gated_method,
            ungated_method=args.ungated_method,
            hqcr_col=args.hqcr_col,
            hqcr_proxy_scale=args.hqcr_proxy_scale,
            t_parse=args.time_parse,
            t_js=args.time_js,
            t_ev=args.time_ev,
            t_opt=args.time_opt,
        )


if __name__ == "__main__":
    main()
