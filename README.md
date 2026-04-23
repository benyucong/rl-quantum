# Vista: Verifier-in-the-Loop Agentic RL for Quantum Program Synthesis

This repository contains the code and artifact materials for:

**Vista: Verifier-in-the-Loop Agentic RL for Semantic Program Synthesis in Quantum Computing**  
ACM CAIS 2026 submission #217

Vista trains a language-model policy to generate OpenQASM 3.0 quantum circuits using staged verifier feedback. The verifier checks generated programs through progressively richer semantic stages: syntax/feasibility, behavior alignment, objective-value verification, and utility after downstream optimization. The repository includes the quantum training scripts, verifier/reward code, generation and evaluation scripts, table data, and figure-generation workflow.

The public artifact URL is:

```text
https://github.com/benyucong/rl-quantum
```

## Public Model and Data

- Vista RL checkpoint: [Benyucong/rl_quantum_4b](https://huggingface.co/Benyucong/rl_quantum_4b)
- SFT initialization checkpoint: [Benyucong/sft_quantum_circuit_gen_4B](https://huggingface.co/Benyucong/sft_quantum_circuit_gen_4B)
- RL/evaluation dataset: [Benyucong/graph-data-quantum-rl](https://huggingface.co/datasets/Benyucong/graph-data-quantum-rl)

## Repository Layout

| Path | Purpose |
| --- | --- |
| `artifact/` | CAIS artifact README, appendix PDF/TeX, extracted Tables, and reviewer-facing helper scripts. |
| `artifact/scripts/run_quantum_experiment.sh` | Runs model generation plus evaluation, or evaluates an existing raw generation JSON. |
| `artifact/scripts/draw_vista_figures.py` | Runs the `vista_draw/` plotting scripts in headless mode and can derive two plot tables from fresh evaluation output. |
| `artifact/scripts/show_paper_tables.py` | Prints extracted Tables 1-3 as Markdown. |
| `examples/train/quantum/` | Vista/quantum GRPO training scripts and Slurm launchers. |
| `verl_tool/servers/tools/quantum_cpu.py` | Quantum verifier tool used during rollouts. |
| `verl_tool/servers/tools/utils/quantum_reward_cal.py` | Staged quantum reward calculation. |
| `verl_tool/workers/reward_manager/quantum.py` | Reward manager for quantum verifier observations. |
| `quantum-code-generation/code/generation/` | Hugging Face/vLLM scripts for generating OpenQASM samples from checkpoints. |
| `quantum-code-generation/code/evaluation/` | QASM parsing, simulation, and metric recomputation scripts. |
| `quantum-code-generation/code/data_generation/` | Quantum graph-optimization data-generation utilities and included problem-instance inputs. |
| `vista_draw/` | Plot scripts and plot-ready CSV/JSON inputs for Figures. |

This repository is based on the VerlTool training framework, but the root README is intentionally focused on the Vista quantum artifact and reviewer workflow.

## Quick Artifact Check

These commands do not require a GPU.

```bash
git clone https://github.com/benyucong/rl-quantum.git
cd rl-quantum

python3 artifact/scripts/show_paper_tables.py all
python3 artifact/scripts/summarize_eval_outputs.py quantum-code-generation/code/evaluation/out
```

Expected behavior:

- `show_paper_tables.py` prints the extracted values for Tables 1-3.
- `summarize_eval_outputs.py` prints a compact Markdown summary of included `summary_stats_*.json` files.

The detailed artifact instructions are in [artifact/README.md](artifact/README.md). The compiled artifact appendix is [artifact/appendix.pdf](artifact/appendix.pdf).

## Extracted Tables and Figure Map

The Table values and figure-to-artifact map are stored as CSVs:

- [artifact/tables/table1_passk_comparison.csv](artifact/tables/table1_passk_comparison.csv)
- [artifact/tables/table2_reward_ablation.csv](artifact/tables/table2_reward_ablation.csv)
- [artifact/tables/table3_training_settings.csv](artifact/tables/table3_training_settings.csv)
- [artifact/tables/figure_artifact_map.csv](artifact/tables/figure_artifact_map.csv)

Display the extracted Tables as Markdown:

```bash
python3 artifact/scripts/show_paper_tables.py table1
python3 artifact/scripts/show_paper_tables.py table2
python3 artifact/scripts/show_paper_tables.py table3
```

## Recompute Metrics From Raw Generations

Evaluation from existing raw generation JSONs is CPU-only, although it can take time depending on sample count. Install the quantum evaluation dependencies:

```bash
python3 -m venv .venv-eval
source .venv-eval/bin/activate
pip install -r quantum-code-generation/code/evaluation/requirements.txt
```

Run the evaluator:

```bash
cd quantum-code-generation/code/evaluation
python3 src/evaluate_samples.py \
  ../generation/out/<RAW_GENERATION_JSON> \
  out \
  <MODEL_LABEL>
```

Expected outputs:

- `out/summary_stats_<MODEL_LABEL>.json`
- `out/summary_<MODEL_LABEL>_raw_data.csv`

For low-friction artifact review, the raw generation JSONs used for Table 1 and Table 2 should be included in the repository. Without those JSONs, reviewers need GPU access to regenerate model outputs.

## Generate New Model Outputs

New Table 1 data requires GPU inference because the 4B model must generate OpenQASM samples. The helper script uses the public Vista checkpoint by default:

```bash
python3 -m venv .venv-gen
source .venv-gen/bin/activate
pip install -r quantum-code-generation/code/generation/requirements.txt
pip install -r quantum-code-generation/code/evaluation/requirements.txt

bash artifact/scripts/run_quantum_experiment.sh \
  --model Benyucong/rl_quantum_4b \
  --dataset Benyucong/graph-data-quantum-rl \
  --n-samples 50 \
  --out-dir artifact_runs/reviewer_smoke
```

The script writes:

- `artifact_runs/reviewer_smoke/generation/`: raw generated-circuit JSON.
- `artifact_runs/reviewer_smoke/evaluation/`: summary JSON and raw metric CSV.
- `artifact_runs/reviewer_smoke/manifest.txt`: run metadata.

The default `generate_samples.py` script produces one completion per selected sample. Pass@10 reproduction requires archived Pass@10 raw generations or a generation script configured to sample ten completions per prompt.

## Draw Figures

Install lightweight plotting dependencies:

```bash
python3 -m venv .venv-fig
source .venv-fig/bin/activate
pip install -r artifact/requirements-figures.txt
```

### One Command for All Packaged Plots

Render the full packaged figure set from `vista_draw/` plot-ready data:

```bash
python3 artifact/scripts/draw_vista_figures.py \
  --input-dir vista_draw \
  --output-dir artifact_runs/paper_figures \
  --strict
```

The command expects:

- `vista_draw/dataset/*.csv`
- `vista_draw/dataset/*.json`
- `vista_draw/logs.csv`
- the plotting scripts in `vista_draw/*.py`

It writes:

- regenerated plot data and figures under `artifact_runs/paper_figures/dataset/`
- training/log-derived figures under `artifact_runs/paper_figures/figures/`
- `artifact_runs/paper_figures/plot_status.json`

The verified all-plot run covers these tasks:

`box`, `compilability`, `relative_entropy`, `scalability_qubits`, `scalability_gates_depth`, `per_primitive`, `training_dynamics`, `verifier_efficiency`, `training_logs`, `stage_cost`, `latency_breakdown`, `helmi_reward_stability`, and `real_device_tradeoff`.

### Plots From Fresh Evaluation Outputs

Render the objective-gap and relative-entropy plots from a fresh evaluation directory:

```bash
python3 artifact/scripts/draw_vista_figures.py \
  --evaluation-dir artifact_runs/reviewer_smoke/evaluation \
  --only box,relative_entropy \
  --output-dir artifact_runs/reviewer_smoke/figures \
  --strict
```

Fresh `evaluate_samples.py` output directly supports the objective-gap box plot and the relative-entropy threshold plot. The scalability, per-primitive, training-dynamics, verifier-efficiency, and hardware plots require their corresponding aggregate CSV/JSON tables or logs in the `vista_draw/` layout.

## Train Vista

Full training is expensive and is not expected for a quick artifact review. The paper-scale configuration fine-tunes a 4B model with GRPO and FSDP on 8 AMD MI250X GPUs or 8 NVIDIA H100 GPUs.

Training entry points:

```bash
bash examples/train/quantum/train_qwen_4B_quantum.sh
```

Cluster launchers and variants:

- `examples/train/quantum/train_hpc.sh`
- `examples/train/quantum/train_hpc_4gpus.sh`
- `examples/train/quantum/train_mn5.sh`

The staged verifier and reward implementation used by these scripts are in:

- `verl_tool/servers/tools/quantum_cpu.py`
- `verl_tool/servers/tools/utils/quantum_reward_cal.py`
- `verl_tool/workers/reward_manager/quantum.py`

## Hardware Expectations

| Task | GPU needed? | Notes |
| --- | --- | --- |
| Show extracted Tables | No | Uses only Python standard library. |
| Summarize included evaluation JSONs | No | Uses only Python standard library. |
| Recompute metrics from raw generation JSONs | No | Requires Qiskit/PennyLane evaluation dependencies. |
| Redraw figures from packaged plot data | No | Requires Matplotlib, NumPy, and Pandas. |
| Generate new OpenQASM outputs from `Benyucong/rl_quantum_4b` | Yes | Requires a GPU with enough memory for the 4B model. |
| Full GRPO training | Yes | Paper-scale run used 8 AMD MI250X GPUs or 8 NVIDIA H100 GPUs. |

## Artifact Badge Note

For a GitHub-only CAIS artifact submission, the practical target is **Functional + Results Reproduced** if raw generation outputs and final evaluation/plot data are included. CAIS's Available badge requires an archival, long-term, versioned storage target such as Zenodo rather than GitHub alone.

## License and Upstream Base

This repository retains the upstream framework code and license information from VerlTool where applicable. The Vista-specific artifact code, quantum verifier/reward integration, generation/evaluation wrappers, and table/figure utilities are provided for the CAIS 2026 artifact evaluation workflow.
