#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Hierarchical reward for QASM circuits.

Stage 1 (gate):    syntax bonus/penalty.
Stage 2:           distribution similarity = 1 - JS_distance(p_llm, p_gt).
Stage 3 (optional):expectation-value refinement (needs --gt-json).
Stage 4 (optional):parameter optimization refinement (needs --enable-opt, --gt-json).

Reward is clamped to a fixed range for stable RL.

CLI
  Basic (legacy-compatible: stages 1-2):
    python quantum_syntax_reward.py <response_qasm> <ground_truth_qasm>

  With expectation-value refinement (adds stage 3):
    python quantum_syntax_reward.py <response_qasm> <ground_truth_qasm> \
        --gt-json path/to/instance_ground_truth.json \
        --sim-threshold 0.6 \
        --w-ev 0.3

  With optimization refinement (adds stage 4; gated & slower):
    python quantum_syntax_reward.py <response_qasm> <ground_truth_qasm> \
        --gt-json path/to/instance_ground_truth.json \
        --enable-opt --opt-sim-threshold 0.75 --w-opt 0.2 --opt-max-iters 50
"""

import sys
import math
import json
import time
import argparse
import warnings
from typing import Dict, Optional, Tuple

import numpy as np
from qiskit.quantum_info import Statevector
from qiskit_qasm3_import import parse

# Optional: construct_qiskit_hamiltonian helper from your codebase
try:
    # Should build a Qiskit Operator/SparsePauliOp from a spec dict
    from util import construct_qiskit_hamiltonian  # type: ignore
except Exception:  # pragma: no cover
    construct_qiskit_hamiltonian = None

# Aer import across Qiskit variants (for sampling fallback only)
try:
    from qiskit_aer import AerSimulator  # Qiskit >= 1.0
except Exception:  # pragma: no cover
    try:
        from qiskit.providers.aer import AerSimulator  # older
    except Exception:
        AerSimulator = None  # will error nicely if used

try:
    from qiskit import ClassicalRegister, transpile
except Exception:  # pragma: no cover
    ClassicalRegister = None
    transpile = None

# Optional optimizer
try:
    from scipy.optimize import minimize  # optional dependency
except Exception:
    minimize = None

# --------------------------- Tunables ---------------------------

SYNTAX_OK_BONUS = 0.2     # light shaping for valid QASM
SYNTAX_BAD_PENALTY = -0.2
EPS = 1e-12               # smoothing for KL/JS

# Exact simulation guard (set to an int like 18 to force sampling above that size)
MAX_SAFE_QUBITS = None

# Sampling knobs (used only if n_qubits > MAX_SAFE_QUBITS)
SAMPLE_SHOTS = 32768
SAMPLE_SEED = 1234
DENSE_PROB_MAX_QUBITS = 22  # if sampling + n small, build dense vectors

# Clamp final reward
CLAMP_TO_RANGE = (-1.0, 1.0)

# --------------------------- Helpers ----------------------------

def normalize_qasm(qasm_str: str) -> str:
    """
    Normalize a QASM string that might contain literal escape sequences.
    Convert literal '\\n' to newlines, then collapse newlines to spaces.
    """
    decoded = qasm_str.encode("utf-8").decode("unicode_escape")
    return decoded.replace("\n", " ").strip()

def _remove_final_measurements(circ):
    """Compatibility-safe final-measurement removal."""
    new = circ.copy()
    if hasattr(new, "remove_final_measurements"):
        try:
            new.remove_final_measurements()
        except TypeError:
            new.remove_final_measurements(inplace=True)
        return new
    # Fallback: strip trailing measure ops
    while new.data and new.data[-1][0].name == "measure":
        new.data.pop()
    return new

def _probabilities_full(circuit) -> np.ndarray:
    """
    Return length-2**n computational-basis probabilities from exact statevector.
    Ensures final measurements are removed before simulation.
    """
    circ = _remove_final_measurements(circuit)
    n = circ.num_qubits
    if MAX_SAFE_QUBITS is not None and n > MAX_SAFE_QUBITS:
        raise MemoryError(
            f"Circuit has {n} qubits; exceeds MAX_SAFE_QUBITS={MAX_SAFE_QUBITS} for exact simulation."
        )
    sv = Statevector.from_instruction(circ)
    probs = sv.probabilities()
    probs = np.clip(probs, 0.0, 1.0)
    s = probs.sum()
    if not np.isfinite(s) or s <= 0:
        raise ValueError("Invalid probability vector (sum is non-positive or non-finite).")
    return probs / s

def _kl(a: np.ndarray, b: np.ndarray) -> float:
    """KL(a||b) with ε-smoothing and safe renormalization (natural log)."""
    a = np.asarray(a, dtype=float) + EPS
    b = np.asarray(b, dtype=float) + EPS
    a = a / a.sum()
    b = b / b.sum()
    return float(np.sum(a * (np.log(a) - np.log(b))))

def js_distance(p: np.ndarray, q: np.ndarray) -> float:
    """Jensen–Shannon distance in [0,1]. Natural log internally, scaled by log(2)."""
    if p.shape != q.shape:
        return 1.0
    m = 0.5 * (p + q)
    js_div = 0.5 * _kl(p, m) + 0.5 * _kl(q, m)
    return float(np.sqrt(js_div / np.log(2.0)))

# ---- Sampling helpers (used only if n > MAX_SAFE_QUBITS) ----

def _ensure_final_measure_all(circ):
    """Return a copy with a fresh classical register measuring all qubits at the end."""
    if ClassicalRegister is None:
        raise RuntimeError("qiskit is missing ClassicalRegister; cannot add final measurements.")
    new = circ.copy()
    n = new.num_qubits
    if n == 0:
        return new
    cr = ClassicalRegister(n, "zz_final")
    new.add_register(cr)
    new.measure(list(range(n)), cr)
    return new

def _run_aer_counts(circ, shots: int, seed: int) -> Dict[str, int]:
    """Run qasm sampling and return raw counts (keys may include spaces for multiple registers)."""
    if AerSimulator is None or transpile is None:
        raise RuntimeError(
            "qiskit-aer or transpile not available; cannot use sampling fallback. "
            "Install qiskit-aer or lower MAX_SAFE_QUBITS."
        )
    sim = AerSimulator()
    tcirc = transpile(circ, sim, optimization_level=1, seed_transpiler=seed)
    result = sim.run(tcirc, shots=shots, seed_simulator=seed).result()
    return result.get_counts()

def _aggregate_suffix_counts(raw_counts: Dict[str, int], suffix_bits: int) -> Dict[str, int]:
    """
    Reduce counts to only the final measurement register we added.
    Qiskit encodes multiple registers with spaces; we strip spaces.
    Our added register is last -> take the last `suffix_bits` from each key.
    """
    agg: Dict[str, int] = {}
    for bitstr, c in raw_counts.items():
        s = bitstr.replace(" ", "")
        sfx = s[-suffix_bits:]
        agg[sfx] = agg.get(sfx, 0) + c
    return agg

def _counts_to_dense_probs(agg_counts: Dict[str, int], n: int, shots: int) -> np.ndarray:
    """
    Convert suffix-only counts to a dense length 2**n vector in little-endian order
    (reverse bitstrings to map to Qiskit computational indexing).
    """
    size = 1 << n
    probs = np.zeros(size, dtype=float)
    for sfx, c in agg_counts.items():
        idx = int(sfx[::-1], 2)
        probs[idx] += c
    return probs / float(shots)

def _js_distance_sparse_from_counts(
    counts_p: Dict[str, int], counts_q: Dict[str, int],
    n: int, shots_p: int, shots_q: int
) -> float:
    """
    JS distance on a sparse support = union of observed outcomes + residual bucket.
    """
    keys = set(counts_p.keys()) | set(counts_q.keys())

    p_map = {k: counts_p.get(k, 0) / float(shots_p) for k in keys}
    q_map = {k: counts_q.get(k, 0) / float(shots_q) for k in keys}

    rkey = "__RES__"
    p_map[rkey] = max(0.0, 1.0 - sum(p_map.values()))
    q_map[rkey] = max(0.0, 1.0 - sum(q_map.values()))

    def _smooth_norm(d: Dict[str, float]) -> Dict[str, float]:
        out = {k: v + EPS for k, v in d.items()}
        z = sum(out.values())
        return {k: v / z for k, v in out.items()}

    p = _smooth_norm(p_map)
    q = _smooth_norm(q_map)

    keys2 = p.keys()
    def _kl_sparse(a: Dict[str, float], b: Dict[str, float]) -> float:
        return float(sum(a[k] * (math.log(a[k]) - math.log(b[k])) for k in keys2))

    js_div = 0.5 * _kl_sparse(p, {k: 0.5 * (p[k] + q[k]) for k in keys2}) \
           + 0.5 * _kl_sparse(q, {k: 0.5 * (p[k] + q[k]) for k in keys2})
    return float(math.sqrt(js_div / math.log(2.0)))

# --------------------------- Rewards ----------------------------

def syntax_reward(qasm_str: str) -> float:
    """+0.2 if parseable, -0.2 otherwise."""
    try:
        parse(qasm_str)
        return SYNTAX_OK_BONUS
    except Exception:
        return SYNTAX_BAD_PENALTY

def dist_reward(llm_qasm: str, gt_qasm: str) -> float:
    """
    Return distribution similarity = 1 - JS_distance.
    Uses exact statevector if within MAX_SAFE_QUBITS; otherwise sampling.
    """
    llm_circ = parse(llm_qasm)
    gt_circ  = parse(gt_qasm)

    n_llm = llm_circ.num_qubits
    n_gt  = gt_circ.num_qubits
    if n_llm != n_gt:
        return 0.0

    n = n_llm

    # Exact path if allowed
    if MAX_SAFE_QUBITS is None or n <= MAX_SAFE_QUBITS:
        p = _probabilities_full(llm_circ)
        q = _probabilities_full(gt_circ)
        d = js_distance(p, q)
        return 1.0 - d

    # Approximate path via sampling
    warnings.warn(
        f"Falling back to sampling for n={n} (> MAX_SAFE_QUBITS={MAX_SAFE_QUBITS}). shots={SAMPLE_SHOTS}",
        RuntimeWarning,
    )
    llm_meas = _ensure_final_measure_all(llm_circ)
    gt_meas  = _ensure_final_measure_all(gt_circ)

    raw_p = _run_aer_counts(llm_meas, shots=SAMPLE_SHOTS, seed=SAMPLE_SEED)
    raw_q = _run_aer_counts(gt_meas,  shots=SAMPLE_SHOTS, seed=SAMPLE_SEED)

    agg_p = _aggregate_suffix_counts(raw_p, suffix_bits=n)
    agg_q = _aggregate_suffix_counts(raw_q, suffix_bits=n)

    if n <= DENSE_PROB_MAX_QUBITS:
        p = _counts_to_dense_probs(agg_p, n, shots=SAMPLE_SHOTS)
        q = _counts_to_dense_probs(agg_q, n, shots=SAMPLE_SHOTS)
        d = js_distance(p, q)
        return 1.0 - d

    d = _js_distance_sparse_from_counts(agg_p, agg_q, n, SAMPLE_SHOTS, SAMPLE_SHOTS)
    return 1.0 - d

def expectation_value_reward(circuit_string: str, gt: dict) -> float:
    """
    Expectation-value closeness reward:
      1 - |<psi|H|psi> - λ*| / max(|λ*|, 1)
    """
    if construct_qiskit_hamiltonian is None:
        raise RuntimeError("construct_qiskit_hamiltonian not available; cannot compute expectation-value reward.")

    circ = parse(circuit_string)
    circ = _remove_final_measurements(circ)
    sv = Statevector.from_instruction(circ)

    H = construct_qiskit_hamiltonian(gt["cost_hamiltonian"])
    exact = gt.get("exact_solution")
    if isinstance(exact, str):
        exact = json.loads(exact)
    lambda_star = float(exact["smallest_eigenvalues"][0])

    exp_val = float(np.real(sv.expectation_value(H)))
    denom = max(abs(lambda_star), 1.0)
    normalized_gap = abs(exp_val - lambda_star) / denom
    r = 1.0 - normalized_gap  # higher is better
    return float(r)

# ------------- Stage 4: optimization refinement (optional) -------------

def _expectation_value_for_params(circ_template, params, values, H) -> float:
    bound = circ_template.bind_parameters(dict(zip(params, values)))
    bound = _remove_final_measurements(bound)
    sv = Statevector.from_instruction(bound)
    return float(np.real(sv.expectation_value(H)))

def optimization_refinement_reward(
    circuit_string: str,
    gt: dict,
    *,
    max_iters: int = 50,
    patience: int = 15,
    random_fallback_trials: int = 40,
) -> Tuple[float, int, float]:
    """
    Try to improve a parameterized circuit's energy against H with a tiny optimization.
    Returns (reward, evaluations_used, final_energy).

    Reward = 0 if circuit is not parameterized.
    Otherwise:
      cost_reward = 1 - |E_final - λ*| / denom
      efficiency  = 1 / (1 + evals)
      total       = 0.8*cost_reward + 0.2*efficiency
    """
    if construct_qiskit_hamiltonian is None:
        raise RuntimeError("construct_qiskit_hamiltonian not available; cannot optimize.")

    circ_template = parse(circuit_string)
    params = list(circ_template.parameters)
    if len(params) == 0:
        return 0.0, 0, float("inf")  # nothing to optimize

    H = construct_qiskit_hamiltonian(gt["cost_hamiltonian"])
    exact = gt.get("exact_solution")
    if isinstance(exact, str):
        exact = json.loads(exact)
    lambda_star = float(exact["smallest_eigenvalues"][0])
    denom = max(abs(lambda_star), 1.0)

    # Initial guess
    x0 = np.zeros(len(params), dtype=float)
    evals = 0
    best_val = None

    def obj(x):
        nonlocal evals, best_val
        evals += 1
        val = _expectation_value_for_params(circ_template, params, x, H)
        if best_val is None or val < best_val:
            best_val = val
        return val

    # Prefer SciPy if present
    if minimize is not None:
        res = minimize(
            obj, x0,
            method="Nelder-Mead",
            options=dict(maxiter=max_iters, xatol=1e-4, fatol=1e-6, adaptive=True)
        )
        final_E = float(res.fun)
    else:
        # Tiny random-restart hill-climb fallback (no SciPy)
        rng = np.random.default_rng(123)
        x = x0.copy()
        best_E = obj(x)
        no_improve = 0
        for _ in range(random_fallback_trials):
            step = rng.normal(scale=0.2, size=len(params))
            cand = x + step
            E = obj(cand)
            if E < best_E - 1e-6:
                x = cand
                best_E = E
                no_improve = 0
            else:
                no_improve += 1
                if no_improve >= patience:
                    break
        final_E = float(best_E)

    # Convert to reward components
    cost_reward = 1.0 - abs(final_E - lambda_star) / denom
    efficiency = 1.0 / (1.0 + float(evals))
    total = 0.8 * cost_reward + 0.2 * efficiency
    return float(total), int(evals), float(final_E)

# -------------------- Hierarchical combiner ---------------------

def hierarchical_reward(
    circuit_string: str,
    gt_qasm: str,
    *,
    gt_json: Optional[dict] = None,
    sim_threshold: float = 0.6,
    w_ev: float = 0.3,
    enable_opt: bool = False,
    w_opt: float = 0.2,
    opt_sim_threshold: float = 0.75,
    opt_max_iters: int = 50,
) -> float:
    """
    Stage 1: syntax gate
    Stage 2: distribution similarity
    Stage 3 (conditional): expectation value refinement if sim ≥ sim_threshold
    Stage 4 (conditional): tiny parameter optimization if enabled AND sim ≥ opt_sim_threshold

    Final score = clamp(syntax + sim [+ w_ev * ev] [+ w_opt * opt])
    """
    # Stage 1
    s = syntax_reward(circuit_string)
    if s < 0:
        lo, hi = CLAMP_TO_RANGE
        return max(lo, min(hi, s))

    # Stage 2
    sim = dist_reward(circuit_string, gt_qasm)

    # Stage 3 (optional, gated)
    add_ev = 0.0
    if gt_json is not None and sim >= sim_threshold:
        try:
            evr = expectation_value_reward(circuit_string, gt_json)
            add_ev = w_ev * evr
        except Exception as e:
            warnings.warn(f"Expectation-value stage failed: {e}", RuntimeWarning)

    # Stage 4 (optional, gated tighter)
    add_opt = 0.0
    if enable_opt and gt_json is not None and sim >= opt_sim_threshold:
        try:
            optr, evals, final_E = optimization_refinement_reward(
                circuit_string, gt_json, max_iters=opt_max_iters
            )
            add_opt = w_opt * optr
        except Exception as e:
            warnings.warn(f"Optimization stage skipped: {e}", RuntimeWarning)

    lo, hi = CLAMP_TO_RANGE
    return max(lo, min(hi, s + sim + add_ev + add_opt))

# --------------------------- CLI ----------------------------

def main(argv=None) -> float:
    p = argparse.ArgumentParser(description="Hierarchical reward for QASM circuits.")
    p.add_argument("response_file_path", type=str, help="Path to model response .qasm (or text with QASM).")
    p.add_argument("ground_truth_file_path", type=str, help="Path to ground-truth .qasm (or text with QASM).")
    p.add_argument("--gt-json", type=str, default=None,
                   help="Optional: path to JSON providing cost_hamiltonian and exact_solution for EV/OPT stages.")
    p.add_argument("--sim-threshold", type=float, default=0.6, help="Similarity threshold to trigger EV stage.")
    p.add_argument("--w-ev", type=float, default=0.3, help="Weight for expectation-value reward when triggered.")

    # Optimization stage flags
    p.add_argument("--enable-opt", action="store_true", help="Enable Stage 4 optimization refinement.")
    p.add_argument("--w-opt", type=float, default=0.2, help="Weight for optimization refinement reward.")
    p.add_argument("--opt-sim-threshold", type=float, default=0.75,
                   help="Similarity threshold to trigger optimization stage.")
    p.add_argument("--opt-max-iters", type=int, default=50,
                   help="Max iterations for the optimizer (if SciPy is available).")

    args = p.parse_args(argv)

    with open(args.response_file_path, "r", encoding="utf-8") as f:
        response_qasm = normalize_qasm(f.read())
    with open(args.ground_truth_file_path, "r", encoding="utf-8") as f:
        gt_qasm = normalize_qasm(f.read())

    gt_json = None
    if args.gt_json:
        with open(args.gt_json, "r", encoding="utf-8") as f:
            gt_json = json.load(f)

    score = hierarchical_reward(
        response_qasm,
        gt_qasm,
        gt_json=gt_json,
        sim_threshold=args.sim_threshold,
        w_ev=args.w_ev,
        enable_opt=args.enable_opt,
        w_opt=args.w_opt,
        opt_sim_threshold=args.opt_sim_threshold,
        opt_max_iters=args.opt_max_iters,
    )
    print(f"Reward: {score}")
    return score

if __name__ == "__main__":
    try:
        main()
        sys.exit(0)
    except SystemExit as e:
        raise
    except Exception as e:
        print(f"Error computing reward: {e}")
        sys.exit(2)
