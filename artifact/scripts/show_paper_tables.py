#!/usr/bin/env python3
"""Print paper table CSVs as Markdown tables."""

from __future__ import annotations

import argparse
import csv
from pathlib import Path


TABLES = {
    "table1": {
        "path": "table1_passk_comparison.csv",
        "title": "Table 1: Pass@K Comparison",
    },
    "table2": {
        "path": "table2_reward_ablation.csv",
        "title": "Table 2: Reward Ablation",
    },
    "table3": {
        "path": "table3_training_settings.csv",
        "title": "Table 3: Training Settings",
    },
}


def default_table_dir() -> Path:
    return Path(__file__).resolve().parents[1] / "tables"


def format_cell(header: str, value: str) -> str:
    if value == "":
        return ""
    if header.endswith("_pct"):
        return f"{float(value):.2f}%"
    if header.endswith("_re"):
        return f"{float(value):.2f}"
    return value


def pretty_header(header: str) -> str:
    replacements = {
        "pass1": "Pass@1",
        "pass10": "Pass@10",
        "scr": "SCR",
        "srev": "SREV",
        "hqcr": "HQCR",
        "re": "RE",
        "pct": "%",
    }
    parts = header.split("_")
    return " ".join(replacements.get(part, part.title()) for part in parts)


def load_csv(path: Path) -> tuple[list[str], list[dict[str, str]]]:
    with path.open("r", encoding="utf-8", newline="") as f:
        reader = csv.DictReader(f)
        rows = list(reader)
        headers = list(reader.fieldnames or [])
    if not headers:
        raise SystemExit(f"No headers found in {path}")
    return headers, rows


def print_markdown(path: Path, title: str) -> None:
    headers, rows = load_csv(path)
    display_headers = [pretty_header(header) for header in headers]

    print(f"## {title}")
    print()
    print("| " + " | ".join(display_headers) + " |")
    print("| " + " | ".join(["---"] * len(headers)) + " |")
    for row in rows:
        print("| " + " | ".join(format_cell(header, row.get(header, "")) for header in headers) + " |")
    print()


def main() -> None:
    parser = argparse.ArgumentParser(description="Show extracted paper tables.")
    parser.add_argument(
        "table",
        nargs="?",
        default="all",
        choices=["all", *TABLES.keys()],
        help="Which table to print.",
    )
    parser.add_argument(
        "--table-dir",
        type=Path,
        default=default_table_dir(),
        help="Directory containing extracted table CSVs.",
    )
    args = parser.parse_args()

    selected = TABLES.keys() if args.table == "all" else [args.table]
    for table_name in selected:
        spec = TABLES[table_name]
        print_markdown(args.table_dir / spec["path"], spec["title"])


if __name__ == "__main__":
    main()
