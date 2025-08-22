#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Hierarchical reward for QASM circuits (stages individually toggleable).

Stage 1 (gate):    Syntax bonus/penalty from QASM parsability.
Stage 2:           Distribution similarity = 1 − JS_distance(p_llm, p_gt).
Stage 3 (EV):      Fidelity-based expectation value via projector H = I − |psi_gt><psi_gt|.
Stage 4 (Opt):     Tiny parameter optimization to reduce E(theta) = 1 − Fidelity(theta).

Each stage can be disabled via command-line flags:
--disable-syntax, --disable-sim, --disable-ev, --disable-opt.

Example usage:
  # All stages ON (default)
  python quantum_syntax_reward.py resp.qasm gt.qasm

  # Tune thresholds/weights
  python quantum_syntax_reward.py resp.qasm gt.qasm \
      --sim-threshold 0.6 --w-ev 0.3 --opt-sim-threshold 0.75 --w-opt 0.2 --opt-max-iters 50

  # Disable selective stages
  python quantum_syntax_reward.py resp.qasm gt.qasm --disable-sim
  python quantum_syntax_reward.py resp.qasm gt.qasm --disable-ev
  python quantum_syntax_reward.py resp.qasm gt.qasm --disable-opt
  python quantum_syntax_reward.py resp.qasm gt.qasm --disable-syntax
"""

import sys
import math
import argparse
import warnings
import re
from typing import Dict, Tuple, Optional

import numpy as np
from qiskit.quantum_info import Statevector, SparsePauliOp
from qiskit_qasm3_import import parse
from qiskit.circuit import QuantumCircuit, Parameter

# Attempt to import Aer for sampling fallback (Stage 2). This will be used only
# if MAX_SAFE_QUBITS is set and the circuit is large enough.
from qiskit_aer import AerSimulator  # Qiskit >= 1.0

from qiskit import ClassicalRegister, transpile

# Optional SciPy dependency for Stage 4 optimization
from scipy.optimize import minimize

# -----------------------------------------------------------------------------
# Tuning parameters

SYNTAX_OK_BONUS = 0.2  # reward if QASM parses correctly
SYNTAX_BAD_PENALTY = -0.2  # penalty if QASM does not parse
EPS = 1e-12  # smoothing constant for KL and JS calculations

# If MAX_SAFE_QUBITS is set to an integer, Stage 2 uses exact statevectors for
# circuits up to that size; larger circuits use sampling. If None, always
# compute exact probabilities (may be expensive for many qubits).
MAX_SAFE_QUBITS: Optional[int] = 18

# Sampling parameters used when MAX_SAFE_QUBITS is set and the circuit exceeds it.
SAMPLE_SHOTS = 32768
SAMPLE_SEED = 1234
# When using sampling, if the number of qubits is small enough, convert counts
# to dense probability vectors for JS distance. Otherwise, use sparse JS.
DENSE_PROB_MAX_QUBITS = 22

# Rewards are clamped to a fixed range to provide predictable gradients.
CLAMP_TO_RANGE = (-1.0, 1.0)

# Default thresholds and weights for gating and mixing stages
DEFAULT_SIM_THRESHOLD = 0.6
DEFAULT_W_EV = 0.3
DEFAULT_OPT_SIM_THRESHOLD = 0.75
DEFAULT_W_OPT = 0.2
DEFAULT_OPT_MAX_ITERS = 50

# -----------------------------------------------------------------------------
# Utility functions

import pennylane as qml 

def construct_pennylane_hamiltonian(expression: str):
    """Construct a Pennylane Hamiltonian from a string expression.

    The expression should contain terms like `0.5 * (X(0) @ Z(1))`.
    """
    if qml is None:
        raise RuntimeError("Pennylane is not installed; cannot construct Pennylane Hamiltonian.")
    term_pattern_tensor = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*\(\s*([XYZ]\(\d+\)((?:\s*@\s*[XYZ]\(\d+\))*?))\s*\)"
    )
    term_pattern_single = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*([XYZ]\(\d+\))"
    )
    operator_pattern = re.compile(r"([XYZ])\((\d+)\)")

    terms = []
    for match in term_pattern_tensor.finditer(expression):
        coefficient = float(match.group(1))
        operator_sequence = match.group(4)
        operators = [(m.group(1), int(m.group(2))) for m in operator_pattern.finditer(operator_sequence)]
        terms.append({"coefficient": coefficient, "operators": operators})
    for match in term_pattern_single.finditer(expression):
        coefficient = float(match.group(1))
        operator = match.group(4)
        op_match = operator_pattern.search(operator)
        if op_match:
            pauli, qubit = op_match.group(1), int(op_match.group(2))
            terms.append({"coefficient": coefficient, "operators": [(pauli, qubit)]})

    coeffs = []
    observables = []
    for term in terms:
        coeffs.append(term["coefficient"])
        obs = None
        for pauli, qubit in term["operators"]:
            pauli_op = getattr(qml, f"Pauli{pauli}")  # type: ignore[attr-defined]
            obs = pauli_op(qubit) if obs is None else (obs @ pauli_op(qubit))
        observables.append(obs)
    return qml.ops.op_math.LinearCombination(coeffs, observables)

def construct_qiskit_hamiltonian(expression: str) -> SparsePauliOp:
    """Construct a Qiskit Hamiltonian (SparsePauliOp) from a string expression.

    Each term has the form `coefficient * (Pauli(0) @ Pauli(1) @ ...)` or
    `coefficient * Pauli(qubit)`. The function uses identity operators for
    unspecified qubits.
    """
    term_pattern_tensor = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*\(\s*([XYZ]\(\d+\)((?:\s*@\s*[XYZ]\(\d+\))*?))\s*\)"
    )
    term_pattern_single = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*([XYZ]\(\d+\))"
    )
    operator_pattern = re.compile(r"([XYZ])\((\d+)\)")

    terms = []
    for match in term_pattern_tensor.finditer(expression):
        coefficient = float(match.group(1))
        operator_sequence = match.group(4)
        operators = [(m.group(1), int(m.group(2))) for m in operator_pattern.finditer(operator_sequence)]
        terms.append({"coefficient": coefficient, "operators": operators})
    for match in term_pattern_single.finditer(expression):
        coefficient = float(match.group(1))
        operator = match.group(4)
        op_match = operator_pattern.search(operator)
        if op_match:
            pauli, qubit = op_match.group(1), int(op_match.group(2))
            terms.append({"coefficient": coefficient, "operators": [(pauli, qubit)]})

    paulis: list[str] = []
    coeffs: list[float] = []
    max_qubit = -1
    for term in terms:
        for _, qubit in term["operators"]:
            max_qubit = max(max_qubit, qubit)

    for term in terms:
        pauli_str = "I" * (max_qubit + 1)
        for pauli, qubit in term["operators"]:
            pauli_str = pauli_str[:qubit] + pauli + pauli_str[qubit + 1 :]
        paulis.append(pauli_str)
        coeffs.append(term["coefficient"])
    return SparsePauliOp(paulis, coeffs)

def parametrize_qiskit_circuit(circuit: QuantumCircuit) -> Tuple[QuantumCircuit, Dict[float, Parameter]]:
    """Given a circuit with numeric angles, produce a parameterized version.

    Each unique numeric angle becomes a shared Parameter. Returns the new circuit
    and a mapping from constant values to their Parameter. Measurement
    operations are preserved.
    """
    param_circuit = QuantumCircuit(circuit.num_qubits, circuit.num_clbits)
    param_map: Dict[float, Parameter] = {}
    for inst in circuit.data:
        instruction, qargs, cargs = inst.operation, inst.qubits, inst.clbits
        new_params = []
        for param in getattr(instruction, "params", []):
            if isinstance(param, (int, float)):
                if param not in param_map:
                    param_map[param] = Parameter(f"θ_{len(param_map)}")
                new_params.append(param_map[param])
            else:
                new_params.append(param)
        param_circuit.append(instruction.__class__(*new_params), qargs, cargs)
    return param_circuit, param_map

# -----------------------------------------------------------------------------
# Core helpers for statevector and JS distance calculations

def normalize_qasm(qasm_str: str) -> str:
    """Normalize a QASM string by decoding escapes and collapsing newlines."""
    decoded = qasm_str.encode("utf-8").decode("unicode_escape")
    return decoded.replace("\n", " ").strip()

def _remove_final_measurements(circ: QuantumCircuit) -> QuantumCircuit:
    """Return a copy of `circ` with trailing measurements removed."""
    new = circ.copy()
    if hasattr(new, "remove_final_measurements"):
        try:
            new.remove_final_measurements()
        except TypeError:
            new.remove_final_measurements(inplace=True)
        return new
    while new.data and new.data[-1][0].name == "measure":
        new.data.pop()
    return new

def _probabilities_full(circuit: QuantumCircuit) -> np.ndarray:
    """Return the computational basis probabilities of `circuit`.

    Uses exact statevectors if `MAX_SAFE_QUBITS` is None or the circuit has
    `num_qubits <= MAX_SAFE_QUBITS`. Otherwise, raises a MemoryError to
    indicate that sampling should be used.
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
    """Compute KL divergence KL(a||b) with epsilon smoothing."""
    a = np.asarray(a, dtype=float) + EPS
    b = np.asarray(b, dtype=float) + EPS
    a = a / a.sum()
    b = b / b.sum()
    return float(np.sum(a * (np.log(a) - np.log(b))))

def js_distance(p: np.ndarray, q: np.ndarray) -> float:
    """Compute the Jensen–Shannon distance between two probability vectors."""
    if p.shape != q.shape:
        return 1.0
    m = 0.5 * (p + q)
    js_div = 0.5 * _kl(p, m) + 0.5 * _kl(q, m)
    return float(np.sqrt(js_div / np.log(2.0)))

def _ensure_final_measure_all(circ: QuantumCircuit) -> QuantumCircuit:
    """Return a copy of `circ` with measurement on all qubits at the end."""
    if ClassicalRegister is None:
        raise RuntimeError("ClassicalRegister unavailable; cannot add final measurements.")
    new = circ.copy()
    n = new.num_qubits
    if n == 0:
        return new
    cr = ClassicalRegister(n, "zz_final")
    new.add_register(cr)
    new.measure(list(range(n)), cr)
    return new

def _run_aer_counts(circ: QuantumCircuit, shots: int, seed: int) -> Dict[str, int]:
    """Run the circuit on Aer and return measurement counts."""
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
    """Aggregate counts by the last `suffix_bits` bits of the bitstring."""
    agg: Dict[str, int] = {}
    for bitstr, c in raw_counts.items():
        s = bitstr.replace(" ", "")
        sfx = s[-suffix_bits:]
        agg[sfx] = agg.get(sfx, 0) + c
    return agg

def _counts_to_dense_probs(agg_counts: Dict[str, int], n: int, shots: int) -> np.ndarray:
    """Convert aggregated counts to a dense probability vector in little-endian order."""
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
    """Compute JS distance on sparse distributions via counts with a residual bucket."""
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
        return float(sum(a[k] * (np.log(a[k]) - np.log(b[k])) for k in keys2))
    js_div = 0.5 * _kl_sparse(p, {k: 0.5 * (p[k] + q[k]) for k in keys2}) \
           + 0.5 * _kl_sparse(q, {k: 0.5 * (p[k] + q[k]) for k in keys2})
    return float(np.sqrt(js_div / np.log(2.0)))

def syntax_reward(qasm_str: str) -> float:
    """Return a small bonus if the QASM parses, else a penalty."""
    try:
        parse(qasm_str)
        return SYNTAX_OK_BONUS
    except Exception:
        return SYNTAX_BAD_PENALTY

def dist_reward(llm_qasm: str, gt_qasm: str) -> float:
    """Compute 1 − JS distance between probability distributions of two circuits."""
    llm_circ = parse(llm_qasm)
    gt_circ  = parse(gt_qasm)
    n_llm = llm_circ.num_qubits
    n_gt  = gt_circ.num_qubits
    if n_llm != n_gt:
        return 0.0
    n = n_llm
    # Exact simulation if allowed
    if MAX_SAFE_QUBITS is None or n <= MAX_SAFE_QUBITS:
        p = _probabilities_full(llm_circ)
        q = _probabilities_full(gt_circ)
        d = js_distance(p, q)
        return 1.0 - d
    # Sampling fallback
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

def _statevector_from_qasm(qasm_str: str) -> Statevector:
    """Compute the statevector of a circuit from its QASM string."""
    circ = parse(qasm_str)
    circ = _remove_final_measurements(circ)
    if MAX_SAFE_QUBITS is not None and circ.num_qubits > MAX_SAFE_QUBITS:
        raise MemoryError(
            f"Circuit has {circ.num_qubits} qubits; exceeds MAX_SAFE_QUBITS={MAX_SAFE_QUBITS} for exact simulation."
        )
    return Statevector.from_instruction(circ)

def fidelity_reward(llm_qasm: str, gt_qasm: str) -> float:
    """Compute the state fidelity between two circuits."""
    psi_gt = _statevector_from_qasm(gt_qasm)
    psi_llm = _statevector_from_qasm(llm_qasm)
    overlap = complex(np.vdot(psi_llm.data, psi_gt.data))
    F = float((overlap.conjugate() * overlap).real)
    return max(0.0, min(1.0, F))

# -----------------------------------------------------------------------------
# Stage 4 optimization

def _assign_params_compat(circ: QuantumCircuit, mapping: Dict[Parameter, float]) -> QuantumCircuit:
    """Bind/assign parameters in a QuantumCircuit across Qiskit versions.

    Uses `assign_parameters` if available. Falls back to `bind_parameters` for
    older versions. Always returns a new circuit.
    """
    if hasattr(circ, "assign_parameters"):
        try:
            return circ.assign_parameters(mapping, inplace=False)
        except TypeError:
            new = circ.copy()
            new.assign_parameters(mapping, inplace=True)
            return new
    if hasattr(circ, "bind_parameters"):
        try:
            return circ.bind_parameters(mapping)
        except TypeError:
            return circ.bind_parameters(mapping, inplace=False)
    raise AttributeError(
        "QuantumCircuit has neither assign_parameters nor bind_parameters. "
        "Please upgrade qiskit-terra."
    )

def _fidelity_for_params(circ_template: QuantumCircuit, params, values, target_sv: Statevector) -> float:
    """Compute fidelity between `circ_template` with parameters bound to `values` and `target_sv`."""
    bound = _assign_params_compat(circ_template, dict(zip(params, values)))
    bound = _remove_final_measurements(bound)
    sv = Statevector.from_instruction(bound)
    overlap = complex(np.vdot(sv.data, target_sv.data))
    F = float((overlap.conjugate() * overlap).real)
    return max(0.0, min(1.0, F))

def optimization_refinement_reward(
    llm_qasm: str,
    gt_qasm: str,
    *,
    max_iters: int = DEFAULT_OPT_MAX_ITERS,
    patience: int = 15,
    random_fallback_trials: int = 40,
) -> Tuple[float, int, float]:
    """Attempt to optimize parameters of a circuit to maximize fidelity.

    Returns a tuple of (reward, number of evaluations, final energy), where
    final energy E = 1 - fidelity. The reward is a mixture of fidelity and
    evaluation efficiency.
    """
    # Get the target statevector
    target_sv = _statevector_from_qasm(gt_qasm)
    # Parse and remove measurements
    circ_template = parse(llm_qasm)
    circ_template = _remove_final_measurements(circ_template)
    # Get parameters
    params = list(circ_template.parameters)
    if len(params) == 0:
        # Try to parameterize numeric angles
        try:
            circ_template, _ = parametrize_qiskit_circuit(circ_template)
            params = list(circ_template.parameters)
        except Exception as e:
            warnings.warn(f"Parameterization failed: {e}", RuntimeWarning)
    if len(params) == 0:
        # Nothing to optimize; compute fidelity directly
        F = _fidelity_for_params(circ_template, [], [], target_sv)
        E = 1.0 - F
        # Use eval count of 1 and incorporate efficiency term
        efficiency = 1.0 / (1.0 + 1.0)
        total = 0.8 * F + 0.2 * efficiency
        return float(total), 1, float(E)
    # Initial parameter guess: zeros
    x0 = np.zeros(len(params), dtype=float)
    evals = 0
    # Objective function: minimize E = 1 - fidelity
    def obj(x):
        nonlocal evals
        evals += 1
        F = _fidelity_for_params(circ_template, params, x, target_sv)
        return 1.0 - F
    # Use SciPy Nelder-Mead if available
    if minimize is not None:
        res = minimize(
            obj, x0,
            method="Nelder-Mead",
            options=dict(maxiter=max_iters, xatol=1e-4, fatol=1e-6, adaptive=True)
        )
        E = float(res.fun)
    else:
        # Fallback: tiny random-restart hill-climb
        rng = np.random.default_rng(123)
        x = x0.copy()
        best_E = obj(x)
        no_improve = 0
        for _ in range(random_fallback_trials):
            step = rng.normal(scale=0.2, size=len(params))
            cand = x + step
            E_cand = obj(cand)
            if E_cand < best_E - 1e-6:
                x = cand
                best_E = E_cand
                no_improve = 0
            else:
                no_improve += 1
                if no_improve >= patience:
                    break
        E = float(best_E)
    F_final = max(0.0, min(1.0, 1.0 - E))
    efficiency = 1.0 / (1.0 + float(evals))
    total = 0.8 * F_final + 0.2 * efficiency
    return float(total), int(evals), float(E)

# -----------------------------------------------------------------------------
# Hierarchical reward combiner

def hierarchical_reward(
    circuit_string: str,
    gt_qasm: str,
    *,
    disable_syntax: bool = False,
    disable_sim: bool = False,
    disable_ev: bool = False,
    disable_opt: bool = False,
    sim_threshold: float = DEFAULT_SIM_THRESHOLD,
    w_ev: float = DEFAULT_W_EV,
    w_opt: float = DEFAULT_W_OPT,
    opt_sim_threshold: float = DEFAULT_OPT_SIM_THRESHOLD,
    opt_max_iters: int = DEFAULT_OPT_MAX_ITERS,
) -> float:
    """Compute a hierarchical reward combining up to four stages.

    Stage 1: syntax gate. If disabled, returns 0 for this stage and does not gate.
    Stage 2: distribution similarity (JS-based). If disabled, sets similarity to 0
             for reward but 1.0 for gating to allow EV/OPT stages to run.
    Stage 3: fidelity-based EV. If disabled or similarity below threshold,
             contributes nothing.
    Stage 4: optimization refinement. If disabled or similarity below threshold,
             contributes nothing.
    """
    # Stage 1
    s = 0.0
    if not disable_syntax:
        s = syntax_reward(circuit_string)
        if s < 0:
            lo, hi = CLAMP_TO_RANGE
            return max(lo, min(hi, s))
    # Stage 2
    sim = 0.0
    if not disable_sim:
        sim = dist_reward(circuit_string, gt_qasm)
    # For gating: if Stage 2 disabled, treat similarity as 1.0
    sim_for_gating = sim if not disable_sim else 1.0
    # Stage 3
    add_ev = 0.0
    if not disable_ev and sim_for_gating >= sim_threshold:
        try:
            ev = fidelity_reward(circuit_string, gt_qasm)
            add_ev = w_ev * ev
        except MemoryError as e:
            warnings.warn(f"EV stage skipped due to size: {e}", RuntimeWarning)
        except Exception as e:
            warnings.warn(f"EV stage failed: {e}", RuntimeWarning)
    # Stage 4
    add_opt = 0.0
    if not disable_opt and sim_for_gating >= opt_sim_threshold:
        try:
            optr, evals, final_E = optimization_refinement_reward(
                circuit_string, gt_qasm, max_iters=opt_max_iters
            )
            add_opt = w_opt * optr
        except MemoryError as e:
            warnings.warn(f"Optimization stage skipped due to size: {e}", RuntimeWarning)
        except Exception as e:
            warnings.warn(f"Optimization stage failed: {e}", RuntimeWarning)
    lo, hi = CLAMP_TO_RANGE
    return max(lo, min(hi, s + sim + add_ev + add_opt))

# -----------------------------------------------------------------------------
# CLI entry point

def main(argv=None) -> float:
    parser = argparse.ArgumentParser(
        description="Hierarchical reward for QASM circuits (stages individually toggleable)."
    )
    parser.add_argument(
        "response_file_path",
        type=str,
        help="Path to the model response .qasm (or text containing QASM)."
    )
    parser.add_argument(
        "ground_truth_file_path",
        type=str,
        help="Path to the ground truth .qasm (or text containing QASM)."
    )
    # Stage toggles
    parser.add_argument("--disable-syntax", action="store_true", help="Disable Stage 1 (syntax).")
    parser.add_argument("--disable-sim", action="store_true", help="Disable Stage 2 (distribution similarity).")
    parser.add_argument("--disable-ev", action="store_true", help="Disable Stage 3 (fidelity EV).")
    parser.add_argument("--disable-opt", action="store_true", help="Disable Stage 4 (optimization).")
    # Thresholds and weights
    parser.add_argument("--sim-threshold", type=float, default=DEFAULT_SIM_THRESHOLD, help="Similarity threshold to trigger Stage 3.")
    parser.add_argument("--w-ev", type=float, default=DEFAULT_W_EV, help="Weight for EV reward when triggered.")
    parser.add_argument("--opt-sim-threshold", type=float, default=DEFAULT_OPT_SIM_THRESHOLD, help="Similarity threshold to trigger Stage 4.")
    parser.add_argument("--w-opt", type=float, default=DEFAULT_W_OPT, help="Weight for optimization reward.")
    parser.add_argument("--opt-max-iters", type=int, default=DEFAULT_OPT_MAX_ITERS, help="Maximum iterations for the optimizer.")

    args = parser.parse_args(argv)
    # Read QASM strings
    with open(args.response_file_path, "r", encoding="utf-8") as f:
        response_qasm = normalize_qasm(f.read())
    with open(args.ground_truth_file_path, "r", encoding="utf-8") as f:
        gt_qasm = normalize_qasm(f.read())
    score = hierarchical_reward(
        response_qasm,
        gt_qasm,
        disable_syntax=args.disable_syntax,
        disable_sim=args.disable_sim,
        disable_ev=args.disable_ev,
        disable_opt=args.disable_opt,
        sim_threshold=args.sim_threshold,
        w_ev=args.w_ev,
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