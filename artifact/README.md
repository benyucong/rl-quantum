# CAIS 2026 Artifact Evaluation Notes for Paper #217

Paper: "Vista: Verifier-in-the-Loop Agentic RL for Semantic Program Synthesis in Quantum Computing"

This document is the evaluator-facing README for the artifact. It is written to match the CAIS 2026 artifact evaluation expectations: describe the components, the environment, the major paper claims, a minimal working example, and the full reproduction workflow.

## Badge Target and Artifact URL

For a GitHub-only submission, request Functional + Results Reproduced only if the repository includes the raw generation outputs and final evaluation/plot data needed to reproduce the paper results. If those raw outputs are absent and reviewers must regenerate them from the 4B checkpoint, the realistic GitHub-only target is Functional.

Use this repository as the artifact URL:

- `https://github.com/benyucong/rl-quantum`

CAIS's Available checklist requires a public archive with irrevocable versioning and long-term storage, "such as Zenodo but not GitHub." Therefore, if the artifact is submitted only as a GitHub repository, do not rely on receiving the Available badge. If you later create a Zenodo archive or another DOI-backed archive for the exact repository snapshot, then the target can be upgraded to Available + Functional + Results Reproduced.

The Vista checkpoint is public on Hugging Face, but including raw generated-circuit JSON files is still the recommended path for a low-friction Results Reproduced review.

## Submission Metadata

Use this information in the CAIS AE submission form.

- Artifact URL or package: `https://github.com/benyucong/rl-quantum`
- Requested badges: Functional + Results Reproduced, assuming the GitHub repository includes the public checkpoint/dataset links, raw generation outputs, and logs described below.
- Artifact appendix: `artifact/appendix.tex`
- Contact author availability: at least one contact author will monitor HotCRP during kick-the-tires and respond to AEC questions.
- Tracking/anonymity: the artifact archive and any hosting page should not include analytics or reviewer tracking during evaluation.
- Short description: This artifact contains the Vista verifier-in-the-loop RL implementation for OpenQASM 3.0 synthesis, including training scripts, the staged quantum verifier, generation scripts, evaluation scripts, and precomputed outputs/logs for reproducing the paper's semantic quality and verifier-efficiency claims.
- Special hardware: metric recomputation from raw generations is CPU-only. Regeneration from checkpoints requires GPU access. Full retraining requires a large GPU cluster and is provided for transparency, not as the kick-the-tires path. Real-QPU claims should be evaluated from archived hardware logs unless the AEC explicitly requests a live run.

## Artifact Contents

Core training and verifier-in-the-loop code:

- `examples/train/quantum/train_qwen_4B_quantum.sh`: main GRPO training script for the 4B quantum circuit model.
- `examples/train/quantum/train_hpc.sh`: Slurm wrapper for the 4B training script.
- `verl_tool/servers/tools/quantum_cpu.py`: quantum verifier tool invoked during agent rollouts.
- `verl_tool/servers/tools/utils/quantum_reward_cal.py`: staged reward computation over OpenQASM syntax, behavior, objective value, and utility optimization.
- `verl_tool/workers/reward_manager/quantum.py`: reward manager that consumes verifier observations and records per-step reward traces.

Generation and offline evaluation code:

- `quantum-code-generation/code/generation/generate_samples.py`: Hugging Face generation script for baseline and Vista checkpoints.
- `quantum-code-generation/code/generation/generate_samples_vllm.py`: vLLM generation script.
- `quantum-code-generation/code/evaluation/src/evaluate_samples.py`: QASM parsing, statevector simulation, relative entropy, expectation-value verification, and raw metric aggregation.
- `quantum-code-generation/code/evaluation/out/`: precomputed summary statistics included in this snapshot.
- `artifact/scripts/run_quantum_experiment.sh`: reviewer-facing wrapper that runs generation and evaluation, or evaluates an existing raw generation JSON.
- `artifact/scripts/draw_vista_figures.py`: reviewer-facing wrapper around `vista_draw/` that renders plots from plot-ready tables/logs and can regenerate objective-gap and relative-entropy plot inputs from fresh evaluation outputs.
- `artifact/scripts/show_paper_tables.py`: dependency-free script for displaying extracted paper table values.
- `artifact/requirements-figures.txt`: lightweight plotting dependencies for the `vista_draw/` figure scripts.
- `artifact/tables/`: extracted CSV values for Table 1, Table 2, and Table 3 from `acm-cais26-paper217.pdf`.
- `vista_draw/`: figure-generation scripts, plot-ready CSV/JSON inputs, and the current rendered paper figures.

Released model and public data dependencies:

- Vista RL checkpoint: `Benyucong/rl_quantum_4b` (`https://huggingface.co/Benyucong/rl_quantum_4b`).
- SFT initialization checkpoint: `Benyucong/sft_quantum_circuit_gen_4B` (`https://huggingface.co/Benyucong/sft_quantum_circuit_gen_4B`).
- RL/evaluation dataset: `Benyucong/graph-data-quantum-rl` (`https://huggingface.co/datasets/Benyucong/graph-data-quantum-rl`).

Dataset and preprocessing code:

- `examples/data_preprocess/quantum_full.py`: preprocessing used for RL-format quantum prompts.
- `quantum-code-generation/code/data_generation/`: graph optimization and QASM data generation utilities.
- `quantum-code-generation/code/data_generation/src/algorithms/*/*_data.pkl`: included graph/problem-instance inputs used by the data-generation factory for the supported graph optimization primitives.
- `quantum-code-generation/code/training/`: supervised fine-tuning and GRPO scripts from the quantum-code-generation project.

## Current Data Inventory

The current checkout now includes graph-generation resources under `quantum-code-generation/code/data_generation/src/algorithms/`, including pickle inputs for:

- `community_detection`
- `connected_components`
- `edge_cover`
- `graph_coloring`
- `graph_isomorphism`
- `hamiltonian_path`
- `hypermaxcut`
- `kcliques`
- `matching`
- `max_flow`
- `min_cut`
- `steiner_tree`
- `vertex_cover`

These files support the dataset-construction side of the artifact. They do not replace the raw model-generation JSON files consumed by `quantum-code-generation/code/evaluation/src/evaluate_samples.py`.

## Completeness Notes for Results Reproduced

The current checkout contains documentation, training code, evaluation code, extracted paper tables, graph-generation resources, and precomputed summary files. To support a full Results Reproduced review from GitHub, the package should also include:

- Raw generation JSON files under `quantum-code-generation/code/generation/out/`, one per model/run, matching the paper tables.
- Final metric summaries for Vista Pass@1 and Pass@10, plus baselines, matching Table 1 and Table 2 of the paper.
- Either local training parquet files expected by `examples/train/quantum/train_qwen_4B_quantum.sh`, or a documented download/preprocessing step from `Benyucong/graph-data-quantum-rl`:
  - `data/rl-qasm/graph-data-quantum-rl-linus/train.parquet`
  - `data/rl-qasm/graph-data-quantum-rl-linus/test.parquet`
- Any hardware/QPU logs needed for the real-QPU deployment claims, if those claims are included in the AE target.

Already present:

- Public Vista RL checkpoint: `Benyucong/rl_quantum_4b`.
- Public SFT checkpoint: `Benyucong/sft_quantum_circuit_gen_4B`.
- Public RL/evaluation dataset: `Benyucong/graph-data-quantum-rl`.
- Graph-generation pickle inputs under `quantum-code-generation/code/data_generation/src/algorithms/`.
- Precomputed evaluation summary JSON/CSV files under `quantum-code-generation/code/evaluation/out/` and `out_original/`.

## Hardware and Software Environment

Artifact development environment reported in the paper:

- Python: 3.10 or 3.11, depending on component.
- Training framework: VerlTool/verl-tool with Ray, FSDP, vLLM, and GRPO.
- Quantum stack: Qiskit 1.2.4, qiskit-aer 0.16.1, qiskit-qasm3-import 0.5.1.
- Main training hardware: 128 AMD GPUs with 1,024 CPU cores, reported as 48 hours for the full 4B GRPO run in the paper appendix.
- Local scripts in this repository also include single-node Slurm wrappers for 4 or 8 GPU runs; use those for sanity checks or smaller reproductions.

## Minimal Working Example

This path lets an evaluator verify that the artifact is accessible and that included metric files can be parsed without requiring GPUs.

```bash
cd /path/to/rl-quantum
python3 artifact/scripts/summarize_eval_outputs.py quantum-code-generation/code/evaluation/out
python3 artifact/scripts/show_paper_tables.py all
```

Expected behavior:

- The script prints a Markdown table summarizing the included `summary_stats_*.json` files.
- It reports sample count, syntax compilation rate, expectation verification success rate, average relative entropy, and the fraction of samples below the default relative-entropy threshold.
- The table script prints extracted paper Tables 1-3 as Markdown from `artifact/tables/*.csv`.
- The summaries currently included in this checkout are useful as a parser sanity check, but they do not cover all final paper results. Add the final raw generation files and final summary files before requesting Results Reproduced.

Optional verifier sanity check, after installing the evaluation dependencies:

```bash
python3 -m venv .venv-ae
source .venv-ae/bin/activate
pip install -r quantum-code-generation/code/evaluation/requirements.txt
python3 verl_tool/servers/tools/utils/quantum_reward_cal.py \
  'OPENQASM 3.0; include "stdgates.inc"; qubit[1] q; bit[1] c; h q[0]; c[0] = measure q[0];' \
  'OPENQASM 3.0; include "stdgates.inc"; qubit[1] q; bit[1] c; h q[0]; c[0] = measure q[0];' \
  '1.0 * Z(0)' \
  -1.0 \
  1.0
```

Expected behavior:

- The script prints `Reward: <float>`.
- This validates the QASM parser, statevector path, and reward CLI.

Optional figure-rendering smoke test, after installing the lightweight plotting dependencies:

```bash
python3 -m venv .venv-fig
source .venv-fig/bin/activate
pip install -r artifact/requirements-figures.txt

python3 artifact/scripts/draw_vista_figures.py \
  --input-dir vista_draw \
  --output-dir artifact_runs/figure_smoke \
  --only box,relative_entropy \
  --strict
```

Expected behavior:

- The wrapper runs the existing `vista_draw` scripts in headless mode.
- It writes regenerated figures and copied plot inputs under `artifact_runs/figure_smoke/`.
- It writes `artifact_runs/figure_smoke/plot_status.json` with the status of each requested plot task.

## Full Reproduction Workflow

The full workflow has three levels. Evaluators can stop at the level matching their hardware and assigned badge target.

### Automated Reviewer Path: Generate, Evaluate, Then Plot

This wrapper is the recommended path for reviewers with GPU access who want a single entry point for a fresh Vista run:

```bash
cd /path/to/rl-quantum
python3 -m venv .venv-ae
source .venv-ae/bin/activate
pip install -r quantum-code-generation/code/generation/requirements.txt
pip install -r quantum-code-generation/code/evaluation/requirements.txt
pip install -r artifact/requirements-figures.txt

bash artifact/scripts/run_quantum_experiment.sh \
  --n-samples 50 \
  --out-dir artifact_runs/reviewer_smoke

python3 artifact/scripts/summarize_eval_outputs.py \
  artifact_runs/reviewer_smoke/evaluation

python3 artifact/scripts/draw_vista_figures.py \
  --evaluation-dir artifact_runs/reviewer_smoke/evaluation \
  --only box,relative_entropy \
  --output-dir artifact_runs/reviewer_smoke/figures \
  --strict
```

Outputs:

- `artifact_runs/reviewer_smoke/generation/`: raw generated-circuit JSON.
- `artifact_runs/reviewer_smoke/evaluation/`: `summary_stats_VISTA.json` and `summary_VISTA_raw_data.csv`.
- `artifact_runs/reviewer_smoke/figures/`: regenerated objective-gap and relative-entropy plots based on the fresh evaluation output.

To redraw the full paper-figure set from plot-ready inputs, use:

```bash
python3 artifact/scripts/draw_vista_figures.py \
  --input-dir vista_draw \
  --output-dir artifact_runs/paper_figures \
  --strict
```

This single command is the all-packaged-plots entry point. It expects `vista_draw/dataset/*.csv`, `vista_draw/dataset/*.json`, optional `vista_draw/logs.csv`, and the plotting scripts in `vista_draw/*.py`. It writes regenerated figures and copied plot inputs under `artifact_runs/paper_figures/`, plus `artifact_runs/paper_figures/plot_status.json`.

The packaged all-plot workflow currently covers:

- `box`
- `compilability`
- `relative_entropy`
- `scalability_qubits`
- `scalability_gates_depth`
- `per_primitive`
- `training_dynamics`
- `verifier_efficiency`
- `training_logs`
- `stage_cost`
- `latency_breakdown`
- `helmi_reward_stability`
- `real_device_tradeoff`

If you regenerate plot-ready tables elsewhere, place them in an input directory with `dataset/*.csv` and optional `logs.csv`, then pass that directory with `--input-dir`. Fresh `evaluate_samples.py` output directly supports the objective-gap box plot and the relative-entropy threshold plot. The scalability, per-primitive, training-dynamics, verifier-efficiency, and hardware plots require their corresponding aggregate CSV/JSON tables or logs in the `vista_draw` layout.

### Level 1: Recompute Metrics From Raw Generations

Use this level for the main Results Reproduced target when raw generation JSONs are included.

```bash
cd quantum-code-generation/code/evaluation
python3 -m venv .venv-eval
source .venv-eval/bin/activate
pip install -r requirements.txt

mkdir -p out
python3 src/evaluate_samples.py \
  ../generation/out/quantum_circuits_output_<UID>_<MODEL>.json \
  out \
  <MODEL>
```

Outputs:

- `out/summary_stats_<MODEL>.json`
- `out/summary_<MODEL>_raw_data.csv`

Compare these files against the expected paper metrics listed in the claim table below.

### Level 2: Regenerate Model Outputs

Use this level if the evaluator has GPU access and the final checkpoint is available.

```bash
cd quantum-code-generation/code/generation
python3 -m venv .venv-gen
source .venv-gen/bin/activate
pip install -r requirements.txt

python3 generate_samples.py \
  --uid cais26 \
  --model_path Benyucong/rl_quantum_4b \
  --dataset Benyucong/graph-data-quantum-rl \
  --n_samples 200
```

Then run Level 1 on the generated JSON file.

Notes:

- Use the same sample count and random seed as the paper run for exact comparison.
- For Pass@10, provide either a script that samples 10 completions per prompt or include the raw Pass@10 generation files. The current `generate_samples.py` produces one completion per selected sample.

### Level 3: Retrain Vista

Use this level only if the evaluator has large-scale training resources.

```bash
cd /path/to/rl-quantum
source .venv/bin/activate
export HF_HOME=$(pwd)/data/huggingface
bash examples/train/quantum/train_qwen_4B_quantum.sh
```

Expected resources:

- Full paper-scale training: about 48 hours on 128 AMD GPUs, according to the paper appendix.
- Single-node sanity runs: 4 to 8 GPUs, with reduced batch size, rollout count, or epoch count.

Expected artifacts:

- Checkpoints under the configured verl output directory.
- Per-step reward records under `verl_step_records/<run_name>/`.
- Training logs in the configured console/W&B logger.

## Paper Claim Mapping

| Claim | Paper location | Artifact path | Reproduction command | Reported paper result |
| --- | --- | --- | --- | --- |
| Vista improves Pass@1 and Pass@10 feasibility, objective verification, behavior RE, and utility HQCR over LLM, quantum-specific, GRPO, and Verl-Tool baselines. | Table 1, Section 6.2 | `quantum-code-generation/code/evaluation/src/evaluate_samples.py`; raw generation JSONs; `quantum-code-generation/code/evaluation/out/` | Level 1 for each model and Pass@K setting | Reported Vista Table 1 values: Pass@1 SCR 99.31%, SREV 22.41%, RE 11.61, HQCR 17.24%; Pass@10 SCR 100%, SREV 33.10%, RE 8.48, HQCR 27.24%. |
| Hierarchical reward components matter; removing RE causes the largest degradation. | Table 2, Section 6.3 | `verl_tool/servers/tools/utils/quantum_reward_cal.py`; ablation checkpoints or generation JSONs | Level 1 over full, w/o EV, w/o RE, w/o Opt, and validity-only outputs | Full Vista should exceed ablations; w/o RE should show the largest drop. |
| Budget-aware gated evaluation reduces verifier cost while retaining semantic quality. | Figures 7-9, Section 6.4 | `quantum_reward_cal.py`; training logs; verifier timing logs | Recompute from included verifier timing logs or rerun training/evaluation with gating toggles | Average verifier time falls from 8.20s to 4.63s per iteration, a 1.77x speedup. |
| Vista scales across graph optimization tasks and qubit/gate complexity. | Figures 2, 4, 5 | Raw generation JSONs with task/qubit/gate metadata | Group Level 1 results by primitive, qubit count, or gate count | Vista should maintain higher utility than baselines across most primitives and 8-16 qubits. |
| Vista can be deployed on real QPU/hybrid systems. | Section 6.5, Figures 10-14 | Hardware execution logs, transpiled circuits, and postprocessed hardware results | Run the supplied hardware postprocessing script or inspect archived logs | Vista should preserve objective quality while reducing scheduled circuit duration. |

## Expected Active Evaluation Time

- Minimal working example: under 1 minute, no GPU.
- Verifier sanity check: 5-15 minutes including dependency installation, CPU only.
- Recompute metrics from raw generation outputs, once included: minutes to hours depending on sample count and CPU speed.
- Regenerate outputs for a 3B/4B model: GPU required; runtime depends on model, GPU memory, and sample count.
- Retrain Vista: large-scale cluster run, not expected for kick-the-tires.

## Known Limitations and Evaluator Notes

- Full training is expensive. The artifact should be evaluated primarily through the released checkpoint, raw generation outputs, evaluation scripts, and logs.
- Real QPU deployment results depend on external quantum hardware availability and queue conditions. Include archived hardware logs for reproducible inspection.
- The current checkout has graph-generation pickle inputs and precomputed summary JSON/CSV files, but it still does not include the raw generated-circuit JSONs under `quantum-code-generation/code/generation/out/`. Add those before requesting Results Reproduced.
- Because `Benyucong/rl_quantum_4b` is public, evaluators with a suitable GPU can regenerate raw outputs; including the raw JSON files is still strongly recommended for a low-friction CAIS review.
- The included summary files appear to be partial/older evaluation outputs and should not be presented as the final Table 1 reproduction until replaced with final paper-aligned outputs.
- Some scripts are cluster-specific. When adapting them, update paths, Slurm partitions, module names, and GPU counts in one place before running.
