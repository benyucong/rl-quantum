#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Exact (statevector) reward for QASM circuits, with optional sampling fallback.

Reward = syntax_bonus + (1 - JS_distance(p_llm, p_gt))
- JS_distance ∈ [0, 1], symmetric, numerically stable with ε-smoothing.
- Probabilities come from full statevectors (length 2**n) in computational order.
- Syntax bonus is small to avoid dominating learning signals.

CLI:
  python quantum_syntax_reward.py <response_file_path> <ground_truth_file_path>
Prints:
  Reward: <float>
"""

import sys
import math
import re
import warnings
from typing import Dict

import numpy as np
from qiskit.quantum_info import Statevector
from qiskit_qasm3_import import parse

# Try Aer import across Qiskit variants (used only if we fallback to sampling)
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

# --------------------------- Tunables ---------------------------

SYNTAX_OK_BONUS = 0.2   # small positive shaping for valid QASM
SYNTAX_BAD_PENALTY = -0.2
EPS = 1e-12             # smoothing for KL/JS

# Guardrail (exact sim is exponential). Set None to disable (always exact).
# Set to a number like 18 to enable sampling fallback for larger circuits.
MAX_SAFE_QUBITS = None

# Sampling knobs (used only if n_qubits > MAX_SAFE_QUBITS)
SAMPLE_SHOTS = 32768
SAMPLE_SEED = 1234
# If we do sampling and n is not huge, we can safely build dense 2**n vectors:
DENSE_PROB_MAX_QUBITS = 22

# Clamp the final reward to a predictable range (useful for PPO/GRPO)
CLAMP_TO_RANGE = (-1.0, 1.0)

# --------------------------- Helpers ----------------------------

def normalize_qasm(qasm_str: str) -> str:
    """
    Normalize a QASM string that might contain literal escape sequences.
    We convert literal '\\n' to newlines, then collapse newlines to spaces.
    (Kept minimal to match your original behavior.)
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
    Return full length-2**n computational-basis probabilities from exact statevector.
    Ensures final measurements are removed before simulation.
    """
    circ = _remove_final_measurements(circuit)
    n = circ.num_qubits
    if MAX_SAFE_QUBITS is not None and n > MAX_SAFE_QUBITS:
        raise MemoryError(
            f"Circuit has {n} qubits; exceeds MAX_SAFE_QUBITS={MAX_SAFE_QUBITS} for exact simulation."
        )
    sv = Statevector.from_instruction(circ)
    # Qiskit guarantees computational basis order for probabilities()
    probs = sv.probabilities()  # np.ndarray, shape (2**n,)
    # Numerical cleanup: due to floating error, values might be ~-1e-16; clip and renormalize
    probs = np.clip(probs, 0.0, 1.0)
    s = probs.sum()
    if not np.isfinite(s) or s <= 0:
        raise ValueError("Invalid probability vector (sum is non-positive or non-finite).")
    return probs / s

def _kl(a: np.ndarray, b: np.ndarray) -> float:
    """
    KL(a||b) with ε-smoothing and safe renormalization. Natural log base.
    """
    a = np.asarray(a, dtype=float)
    b = np.asarray(b, dtype=float)
    a = a + EPS
    b = b + EPS
    a = a / a.sum()
    b = b / b.sum()
    return float(np.sum(a * (np.log(a) - np.log(b))))

def js_distance(p: np.ndarray, q: np.ndarray) -> float:
    """
    Jensen–Shannon distance in [0,1]. Uses natural logs internally, scales by log(2).
    """
    if p.shape != q.shape:
        # Different Hilbert sizes → maximally dissimilar
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
    cr = ClassicalRegister(n, "zz_final")  # ensure this is the *last* register
    new.add_register(cr)
    new.measure(list(range(n)), cr)
    return new

def _run_aer_counts(circ, shots: int, seed: int) -> Dict[str, int]:
    """Run qasm sampling and return raw counts with register separators."""
    if AerSimulator is None or transpile is None:
        raise RuntimeError(
            "qiskit-aer or transpile not available; cannot use sampling fallback. "
            "Install qiskit-aer or lower MAX_SAFE_QUBITS."
        )
    sim = AerSimulator()  # CPU; consider GPU variant if available on your cluster
    tcirc = transpile(circ, sim, optimization_level=1, seed_transpiler=seed)
    result = sim.run(tcirc, shots=shots, seed_simulator=seed).result()
    # For single circuit: result.get_counts() returns a dict
    return result.get_counts()

def _aggregate_suffix_counts(raw_counts: Dict[str, int], suffix_bits: int) -> Dict[str, int]:
    """
    Reduce counts to only the final measurement register we added.
    - Qiskit encodes multiple registers with spaces; we strip spaces.
    - Our added register is last -> take the last `suffix_bits` from each key.
    Returns dict mapping that suffix (as a string) to aggregated counts.
    """
    agg: Dict[str, int] = {}
    for bitstr, c in raw_counts.items():
        s = bitstr.replace(" ", "")
        sfx = s[-suffix_bits:]
        agg[sfx] = agg.get(sfx, 0) + c
    return agg

def _counts_to_dense_probs(agg_counts: Dict[str, int], n: int, shots: int) -> np.ndarray:
    """
    Convert suffix-only counts to a dense length 2**n vector in *little-endian* order.
    We reverse the suffix to map to Qiskit's computational ordering (q0 is LSB).
    """
    size = 1 << n
    probs = np.zeros(size, dtype=float)
    for sfx, c in agg_counts.items():
        idx = int(sfx[::-1], 2)  # reverse to little-endian index
        probs[idx] += c
    return probs / float(shots)

def _js_distance_sparse_from_counts(
    counts_p: Dict[str, int], counts_q: Dict[str, int],
    n: int, shots_p: int, shots_q: int
) -> float:
    """
    JS distance computed on a sparse support = union of observed suffixes plus a residual bucket.
    Keeps memory O(#observed outcomes), not O(2**n).
    """
    # Convert to probabilities on observed keys
    keys = set(counts_p.keys()) | set(counts_q.keys())
    # residual mass for unobserved outcomes
    sum_p = sum(counts_p.values()) / float(shots_p)
    sum_q = sum(counts_q.values()) / float(shots_q)
    # Numerical guard (should be ~1.0 each)
    sum_p = min(max(sum_p, 0.0), 1.0)
    sum_q = min(max(sum_q, 0.0), 1.0)
    rkey = "__RES__"

    # Build dense-on-union + residual dicts
    p_map: Dict[str, float] = {k: counts_p.get(k, 0) / float(shots_p) for k in keys}
    q_map: Dict[str, float] = {k: counts_q.get(k, 0) / float(shots_q) for k in keys}
    p_map[rkey] = max(0.0, 1.0 - sum(p_map.values()))
    q_map[rkey] = max(0.0, 1.0 - sum(q_map.values()))

    # Apply epsilon smoothing, renormalize
    def _smooth_norm(d: Dict[str, float]) -> Dict[str, float]:
        out = {k: v + EPS for k, v in d.items()}
        z = sum(out.values())
        return {k: v / z for k, v in out.items()}

    p = _smooth_norm(p_map)
    q = _smooth_norm(q_map)

    # KL/JS on sparse support
    keys2 = p.keys()  # same keys as q
    def _kl_sparse(a: Dict[str, float], b: Dict[str, float]) -> float:
        return float(sum(a[k] * (math.log(a[k]) - math.log(b[k])) for k in keys2))

    js_div = 0.5 * _kl_sparse(p, {k: 0.5 * (p[k] + q[k]) for k in keys2}) \
           + 0.5 * _kl_sparse(q, {k: 0.5 * (p[k] + q[k]) for k in keys2})
    return float(math.sqrt(js_div / math.log(2.0)))

# --------------------------- Rewards ----------------------------

def syntax_reward(qasm_str: str) -> float:
    """
    Light shaping: +0.2 if parseable, -0.5 otherwise. (Matches constants above.)
    """
    try:
        parse(qasm_str)
        return SYNTAX_OK_BONUS
    except Exception:
        return SYNTAX_BAD_PENALTY

def dist_reward(llm_qasm: str, gt_qasm: str) -> float:
    """
    Return similarity = 1 - JS_distance between output distributions.
    Uses exact statevector if within MAX_SAFE_QUBITS; otherwise falls back to sampling.
    """
    llm_circ = parse(llm_qasm)
    gt_circ  = parse(gt_qasm)

    n_llm = llm_circ.num_qubits
    n_gt  = gt_circ.num_qubits
    if n_llm != n_gt:
        # Different Hilbert spaces → maximally dissimilar
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
        f"Falling back to sampling for n={n} (> MAX_SAFE_QUBITS={MAX_SAFE_QUBITS}). "
        f"shots={SAMPLE_SHOTS}",
        RuntimeWarning,
    )

    # Ensure final measure-all so we can compare on the computational basis
    llm_meas = _ensure_final_measure_all(llm_circ)
    gt_meas  = _ensure_final_measure_all(gt_circ)

    raw_p = _run_aer_counts(llm_meas, shots=SAMPLE_SHOTS, seed=SAMPLE_SEED)
    raw_q = _run_aer_counts(gt_meas,  shots=SAMPLE_SHOTS, seed=SAMPLE_SEED)

    # Keep only the suffix that corresponds to our final measurement register
    agg_p = _aggregate_suffix_counts(raw_p, suffix_bits=n)
    agg_q = _aggregate_suffix_counts(raw_q, suffix_bits=n)

    # If n small enough, build dense vectors for the usual JS
    if n <= DENSE_PROB_MAX_QUBITS:
        p = _counts_to_dense_probs(agg_p, n, shots=SAMPLE_SHOTS)
        q = _counts_to_dense_probs(agg_q, n, shots=SAMPLE_SHOTS)
        d = js_distance(p, q)
        return 1.0 - d

    # Otherwise, use sparse JS over observed outcomes (+ residual bucket)
    d = _js_distance_sparse_from_counts(agg_p, agg_q, n, SAMPLE_SHOTS, SAMPLE_SHOTS)
    return 1.0 - d

def reward_calculator(circuit_string: str, ground_truth: str) -> float:
    s = syntax_reward(circuit_string)
    if s < 0:
        lo, hi = CLAMP_TO_RANGE
        return max(lo, min(hi, s))
    sim = dist_reward(circuit_string, ground_truth)
    lo, hi = CLAMP_TO_RANGE
    return max(lo, min(hi, s + sim))

# --------------------------- CLI ----------------------------

def main(response_file_path: str, ground_truth_file_path: str) -> float:
    with open(response_file_path, "r", encoding="utf-8") as f:
        response_qasm = normalize_qasm(f.read())
    with open(ground_truth_file_path, "r", encoding="utf-8") as f:
        gt_qasm = normalize_qasm(f.read())
    return reward_calculator(response_qasm, gt_qasm)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python quantum_syntax_reward.py <response_file_path> <ground_truth_file_path>")
        sys.exit(1)
    try:
        result = main(sys.argv[1], sys.argv[2])
        print(f"Reward: {result}")
        sys.exit(0)
    except Exception as e:
        # Surface the error clearly; your trainer/logger can catch this.
        print(f"Error computing reward: {e}")
        sys.exit(2)
