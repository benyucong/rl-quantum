#!/usr/bin/env bash
# Run generation + evaluation for the Vista quantum artifact.
#
# This script is intentionally thin: it delegates model sampling to
# quantum-code-generation/code/generation/generate_samples.py and metric
# recomputation to quantum-code-generation/code/evaluation/src/evaluate_samples.py.

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  bash artifact/scripts/run_quantum_experiment.sh [options]

Options:
  --model MODEL             Hugging Face model or local checkpoint.
                            Default: Benyucong/rl_quantum_4b
  --dataset DATASET         Hugging Face dataset or local dataset path.
                            Default: Benyucong/graph-data-quantum-rl
  --n-samples N             Number of random test samples to generate.
                            Default: 200
  --uid UID                 Stable run id used in the generated JSON filename.
                            Default: cais26_<timestamp>
  --out-dir DIR             Output directory for raw generations/eval summaries.
                            Default: artifact_runs/<uid>
  --python PYTHON           Python executable. Default: python3
  --raw-json PATH           Skip generation and evaluate an existing raw generation JSON.
  --model-label LABEL       Label used in summary_stats_<LABEL>.json.
                            Default: inferred paper label, for example VISTA.
  --few-shot                Pass --few_shot_learning to generate_samples.py.
  --skip-eval               Only generate/copy raw JSON; do not run evaluate_samples.py.
  -h, --help                Show this help.

Examples:
  bash artifact/scripts/run_quantum_experiment.sh --n-samples 50 --out-dir artifact_runs/smoke

  bash artifact/scripts/run_quantum_experiment.sh \
    --raw-json quantum-code-generation/code/generation/out/quantum_circuits_output_run_rl_quantum_4b.json \
    --model-label rl_quantum_4b \
    --out-dir artifact_runs/eval_only
EOF
}

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/../.." && pwd)"

model="Benyucong/rl_quantum_4b"
dataset="Benyucong/graph-data-quantum-rl"
n_samples="200"
uid="cais26_$(date +%Y%m%d_%H%M%S)"
out_dir=""
python_bin="${PYTHON:-python3}"
raw_json=""
model_label=""
few_shot="0"
skip_eval="0"

infer_model_label() {
  local value="$1"
  local base
  base="$(basename "$value")"
  base="${base%.json}"
  base="${base#quantum_circuits_output_}"

  case "$base" in
    *rl_quantum_4b*|*quasar*|*QUASAR*|*vista*|*VISTA*)
      echo "VISTA"
      ;;
    *sft_quantum_circuit_gen_4B*|*sft_response*|*sft*)
      echo "Agent-Q"
      ;;
    *gpt4o*|*GPT-4o*)
      echo "GPT-4o"
      ;;
    *gpt5*|*GPT-5*)
      echo "GPT-5"
      ;;
    *deepseek*|*DeepSeek*)
      echo "DeepSeek-V3"
      ;;
    *)
      echo "$base"
      ;;
  esac
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --model)
      model="$2"
      shift 2
      ;;
    --dataset)
      dataset="$2"
      shift 2
      ;;
    --n-samples)
      n_samples="$2"
      shift 2
      ;;
    --uid)
      uid="$2"
      shift 2
      ;;
    --out-dir)
      out_dir="$2"
      shift 2
      ;;
    --python)
      python_bin="$2"
      shift 2
      ;;
    --raw-json)
      raw_json="$2"
      shift 2
      ;;
    --model-label)
      model_label="$2"
      shift 2
      ;;
    --few-shot)
      few_shot="1"
      shift
      ;;
    --skip-eval)
      skip_eval="1"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$out_dir" ]]; then
  out_dir="artifact_runs/${uid}"
fi

out_abs="$(cd "$repo_root" && mkdir -p "$out_dir" && cd "$out_dir" && pwd)"
gen_out="${out_abs}/generation"
eval_out="${out_abs}/evaluation"
mkdir -p "$gen_out" "$eval_out"

if [[ -z "$model_label" ]]; then
  if [[ -n "$raw_json" ]]; then
    model_label="$(infer_model_label "$raw_json")"
  else
    model_label="$(infer_model_label "$model")"
  fi
fi

if [[ -z "$raw_json" ]]; then
  gen_dir="${repo_root}/quantum-code-generation/code/generation"
  mkdir -p "${gen_dir}/out"
  gen_args=(
    "$python_bin" generate_samples.py
    --uid "$uid"
    --model_path "$model"
    --dataset "$dataset"
    --n_samples "$n_samples"
  )
  if [[ "$few_shot" == "1" ]]; then
    gen_args+=(--few_shot_learning)
  fi

  echo "[run] Generating samples with ${model} on ${dataset}"
  (
    cd "$gen_dir"
    "${gen_args[@]}"
  )

  model_name_out="${model##*/}"
  few_suffix=""
  if [[ "$few_shot" == "1" ]]; then
    few_suffix="_few_shot"
  fi
  generated_json="${gen_dir}/out/quantum_circuits_output_${uid}_${model_name_out}${few_suffix}.json"
  if [[ ! -f "$generated_json" ]]; then
    echo "Expected generated JSON not found: $generated_json" >&2
    exit 1
  fi
  cp "$generated_json" "$gen_out/"
  raw_json="${gen_out}/$(basename "$generated_json")"
else
  raw_abs="$(cd "$(dirname "$raw_json")" && pwd)/$(basename "$raw_json")"
  if [[ ! -f "$raw_abs" ]]; then
    echo "Raw generation JSON not found: $raw_json" >&2
    exit 1
  fi
  cp "$raw_abs" "$gen_out/"
  raw_json="${gen_out}/$(basename "$raw_abs")"
fi

cat > "${out_abs}/manifest.txt" <<EOF
uid=${uid}
model=${model}
dataset=${dataset}
n_samples=${n_samples}
few_shot=${few_shot}
raw_json=${raw_json}
model_label=${model_label}
EOF

if [[ "$skip_eval" == "0" ]]; then
  echo "[run] Evaluating raw generations"
  (
    cd "${repo_root}/quantum-code-generation/code/evaluation"
    "$python_bin" src/evaluate_samples.py "$raw_json" "$eval_out" "$model_label"
  )
fi

echo
echo "Experiment output: $out_abs"
echo "Raw generations:   $gen_out"
echo "Evaluations:       $eval_out"
echo
echo "Quick summary:"
echo "  python3 artifact/scripts/summarize_eval_outputs.py \"$eval_out\""
echo
echo "To render paper figures from a plot-data directory:"
echo "  python3 artifact/scripts/draw_vista_figures.py --input-dir vista_draw --output-dir \"$out_abs/figures\""
echo
if [[ "$skip_eval" == "0" ]]; then
  echo "To render objective-gap and relative-entropy plots from this run's new data:"
  echo "  python3 artifact/scripts/draw_vista_figures.py --evaluation-dir \"$eval_out\" --only box,relative_entropy --output-dir \"$out_abs/figures\" --strict"
else
  echo "Run evaluation first, then pass the evaluation directory to draw_vista_figures.py with --evaluation-dir."
fi
