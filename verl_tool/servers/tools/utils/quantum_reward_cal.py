#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Exact (statevector) reward for QASM circuits.

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
import numpy as np
from qiskit.quantum_info import Statevector
from qiskit_qasm3_import import parse

# --------------------------- Tunables ---------------------------

SYNTAX_OK_BONUS = 0.2   # small positive shaping for valid QASM
SYNTAX_BAD_PENALTY = -0.5
EPS = 1e-12             # smoothing for KL/JS
MAX_SAFE_QUBITS = None    # guardrail (exact sim is exponential). Set None to disable.

# --------------------------- Helpers ----------------------------

def normalize_qasm(qasm_str: str) -> str:
    """
    Normalize a QASM string that might contain literal escape sequences.
    We convert literal '\n' to newlines, then collapse newlines to spaces.
    """
    decoded = qasm_str.encode("utf-8").decode("unicode_escape")
    return decoded.replace("\n", " ").strip()

def _probabilities_full(circuit) -> np.ndarray:
    """
    Return full length-2**n computational-basis probabilities from exact statevector.
    Ensures final measurements are removed before simulation.
    """
    circ = circuit.copy()
    # remove_final_measurements handles both "measure" and classical bits
    circ.remove_final_measurements()
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
    m = 0.5 * (p + q)
    js_div = 0.5 * _kl(p, m) + 0.5 * _kl(q, m)
    # Convert JS divergence to distance and normalize to [0,1]
    return float(np.sqrt(js_div / np.log(2.0)))

# --------------------------- Rewards ----------------------------

def syntax_reward(qasm_str: str) -> float:
    """
    Light shaping: +0.2 if parseable, -0.2 otherwise.
    """
    try:
        parse(qasm_str)
        return SYNTAX_OK_BONUS
    except Exception:
        return SYNTAX_BAD_PENALTY

def dist_reward_exact(llm_qasm: str, gt_qasm: str) -> float:
    """
    1 - JS_distance between exact probability vectors of the two circuits.
    Returns value in [0,1], where 1 means identical output distributions.
    """
    llm_circ = parse(llm_qasm)
    gt_circ = parse(gt_qasm)
    p = _probabilities_full(llm_circ)
    q = _probabilities_full(gt_circ)
    d = js_distance(p, q)     # 0 (same) → 1 (very different)
    return 1.0 - d

def reward_calculator(circuit_string: str, ground_truth: str) -> float:
    """
    Final reward:
      - early exit on syntax failure,
      - otherwise syntax bonus + distribution similarity.
    """
    s = syntax_reward(circuit_string)
    if s < 0:
        return s
    return s + dist_reward_exact(circuit_string, ground_truth)

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