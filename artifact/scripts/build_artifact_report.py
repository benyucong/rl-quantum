#!/usr/bin/env python3
"""Build one reviewer PDF from regenerated Vista plots and extracted tables."""

from __future__ import annotations

import argparse
import csv
import json
import os
import shutil
import subprocess
import textwrap
import tempfile
from pathlib import Path

cache_dir = Path(tempfile.gettempdir()) / "vista_artifact_report_cache"
(cache_dir / "mpl").mkdir(parents=True, exist_ok=True)
(cache_dir / "xdg").mkdir(parents=True, exist_ok=True)
os.environ.setdefault("MPLCONFIGDIR", str(cache_dir / "mpl"))
os.environ.setdefault("XDG_CACHE_HOME", str(cache_dir / "xdg"))

import matplotlib

matplotlib.use("Agg")
import matplotlib.image as mpimg
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages


TEXT_WIDTH = 108
PAGE_SIZE = (11.0, 8.5)


def repo_root() -> Path:
    return Path(__file__).resolve().parents[2]


def collect_files(figures_dir: Path, output: Path) -> tuple[list[Path], list[Path]]:
    output_resolved = output.resolve()
    pdfs = sorted(
        path
        for path in figures_dir.rglob("*.pdf")
        if path.is_file() and path.resolve() != output_resolved
    )
    pdf_stems = {path.with_suffix("").resolve() for path in pdfs}
    images = sorted(
        path
        for suffix in ("*.png", "*.jpg", "*.jpeg")
        for path in figures_dir.rglob(suffix)
        if path.is_file()
        and path.resolve() != output_resolved
        and path.with_suffix("").resolve() not in pdf_stems
    )
    return pdfs, images


def write_text_page(pdf: PdfPages, title: str, lines: list[str], fontsize: int = 8) -> None:
    fig = plt.figure(figsize=PAGE_SIZE)
    ax = fig.add_subplot(111)
    ax.axis("off")
    ax.text(0.03, 0.96, title, fontsize=16, fontweight="bold", va="top")
    wrapped: list[str] = []
    for line in lines:
        if not line:
            wrapped.append("")
            continue
        wrapped.extend(textwrap.wrap(line, width=TEXT_WIDTH, replace_whitespace=False) or [""])
    ax.text(0.03, 0.89, "\n".join(wrapped), fontsize=fontsize, family="monospace", va="top")
    pdf.savefig(fig, bbox_inches="tight")
    plt.close(fig)


def write_image_page(pdf: PdfPages, path: Path, root: Path) -> None:
    image = mpimg.imread(path)
    fig = plt.figure(figsize=PAGE_SIZE)
    ax = fig.add_subplot(111)
    ax.axis("off")
    ax.set_title(str(path.relative_to(root)), fontsize=11, pad=12)
    ax.imshow(image)
    pdf.savefig(fig, bbox_inches="tight")
    plt.close(fig)


def csv_preview(path: Path, max_rows: int = 30) -> list[str]:
    with path.open("r", encoding="utf-8", newline="") as f:
        rows = list(csv.reader(f))
    if not rows:
        return ["<empty csv>"]
    preview = rows[:max_rows]
    lines = [" | ".join(cell.strip() for cell in row) for row in preview]
    if len(rows) > max_rows:
        lines.append(f"... ({len(rows) - max_rows} more row(s))")
    return lines


def status_lines(status_path: Path) -> list[str]:
    if not status_path.exists():
        return ["No plot_status.json file found."]
    with status_path.open("r", encoding="utf-8") as f:
        data = json.load(f)
    if not isinstance(data, list):
        return [json.dumps(data, indent=2)]
    lines = []
    for item in data:
        if not isinstance(item, dict):
            lines.append(str(item))
            continue
        task = item.get("task", "<unknown>")
        status = item.get("status", "<unknown>")
        reason = item.get("reason")
        suffix = f" - {reason}" if reason else ""
        lines.append(f"{task}: {status}{suffix}")
    return lines or ["No plot task statuses recorded."]


def build_front_matter(
    front_pdf: Path,
    figures_dir: Path,
    tables_dir: Path,
    output: Path,
    plot_pdfs: list[Path],
    plot_images: list[Path],
) -> None:
    table_paths = sorted(tables_dir.glob("*.csv")) if tables_dir.exists() else []
    with PdfPages(front_pdf) as pdf:
        write_text_page(
            pdf,
            "Vista Artifact Report",
            [
                f"Figures directory: {figures_dir}",
                f"Tables directory: {tables_dir}",
                f"Output PDF: {output}",
                "",
                f"Extracted CSV tables included: {len(table_paths)}",
                f"Regenerated plot PDFs appended: {len(plot_pdfs)}",
                f"PNG/JPEG-only plots rendered: {len(plot_images)}",
                "",
                "This report is produced by artifact/scripts/build_artifact_report.py after running the figure reproduction script.",
            ],
        )
        write_text_page(pdf, "Plot Task Status", status_lines(figures_dir / "plot_status.json"))
        for table_path in table_paths:
            write_text_page(pdf, f"Extracted Table: {table_path.name}", csv_preview(table_path))
        for image_path in plot_images:
            write_image_page(pdf, image_path, figures_dir)


def merge_pdfs(output: Path, inputs: list[Path]) -> None:
    output.parent.mkdir(parents=True, exist_ok=True)
    try:
        from pypdf import PdfReader, PdfWriter

        writer = PdfWriter()
        for input_pdf in inputs:
            reader = PdfReader(str(input_pdf))
            for page in reader.pages:
                writer.add_page(page)
        with output.open("wb") as f:
            writer.write(f)
        return
    except ImportError:
        pdfunite = shutil.which("pdfunite")
        if pdfunite is None:
            raise SystemExit("Install pypdf or provide pdfunite to merge report PDF pages.")
        subprocess.run([pdfunite, *(str(path) for path in inputs), str(output)], check=True)


def main() -> None:
    parser = argparse.ArgumentParser(description="Build one PDF with Vista artifact plots and extracted tables.")
    parser.add_argument(
        "--figures-dir",
        type=Path,
        default=repo_root() / "artifact_runs" / "paper_figures",
        help="Directory produced by draw_vista_figures.py.",
    )
    parser.add_argument(
        "--tables-dir",
        type=Path,
        default=repo_root() / "artifact" / "tables",
        help="Directory containing extracted paper-table CSVs.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        help="Output PDF path. Defaults to <figures-dir>/all_figures_tables.pdf.",
    )
    args = parser.parse_args()

    figures_dir = args.figures_dir.resolve()
    tables_dir = args.tables_dir.resolve()
    output = (args.output or figures_dir / "all_figures_tables.pdf").resolve()
    if not figures_dir.exists():
        raise SystemExit(f"Figures directory not found: {figures_dir}")
    if not tables_dir.exists():
        raise SystemExit(f"Tables directory not found: {tables_dir}")

    plot_pdfs, plot_images = collect_files(figures_dir, output)
    with tempfile.TemporaryDirectory(prefix="vista_artifact_report_") as tmp:
        front_pdf = Path(tmp) / "front_matter.pdf"
        build_front_matter(front_pdf, figures_dir, tables_dir, output, plot_pdfs, plot_images)
        merge_pdfs(output, [front_pdf, *plot_pdfs])

    print(f"Wrote artifact report: {output}")
    print(f"Included {len(plot_pdfs)} plot PDF(s), {len(plot_images)} image plot(s), and CSV tables from {tables_dir}")


if __name__ == "__main__":
    main()
