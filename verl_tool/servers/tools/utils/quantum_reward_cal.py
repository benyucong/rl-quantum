#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Exact (statevector) reward for QASM circuits.

Reward = syntax_bonus + (1 - JS_distance(p_llm, p_gt))
- JS_distance ∈ [0, 1], symmetric, numerically stable with ε-smoothing.
- Probabilities come from full statevectors (length 2**n) in computational order.
- Syntax bonus is small to avoid dominating learning signals.

CLI:
  python quantum_reward_cal.py <response_qasm> <ground_truth_qasm> <cost_hamiltonian> <smallest_eigenvalue> <largest_eigenvalue>
  e.g.
    python quantum_reward_cal.py \
    "OPENQASM 3.0; include \"stdgates.inc\"; qubit[1] q; h q[0];" \
    "OPENQASM 3.0; include \"stdgates.inc\"; qubit[1] q;" \
    "1.0 * Z(0)" \
    -1.0 1.0
Prints:
  Reward: <float>
"""

import sys
import numpy as np
from qiskit.quantum_info import Statevector
from qiskit_qasm3_import import parse
import re
from qiskit.circuit import QuantumCircuit, Parameter
from qiskit.quantum_info import SparsePauliOp
from qiskit.qasm3 import loads, dumps
from scipy.optimize import minimize

# --------------------------- Tunables ---------------------------

SYNTAX_OK_BONUS = 0.2   # small positive shaping for valid QASM
SYNTAX_BAD_PENALTY = -1
EPS = 1e-12             # smoothing for KL/JS
EXPECTED_THRESHOLD = 0.1  # if dist_reward below this, give expectation_value_reward
# if dist_reward greater this, give optimization_value_reward
OPTIMIZATION_THRESHOLD = 0.6
# guardrail (exact sim is exponential). Set None to disable.
MAX_SAFE_QUBITS = None

# Tunables for mismatch severity
BASE_MISMATCH_PENALTY = -0.35       # applied if n_llm != n_gt
PER_EXTRA_QUBIT_PENALTY = -0.08     # per qubit count difference
PER_ACTIVE_EXTRA_BONUS  = -0.12     # extra hit for each ACTIVE extra qubit

# --------------------------- Utilities ----------------------------


def construct_qiskit_hamiltonian(expression: str):
    """
    Construct a Qiskit Hamiltonian from a string expression encoding Pennylane Hamiltonian.
    """
    # First, handle terms with tensor products (@)
    term_pattern_tensor = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*\(\s*([XYZ]\(\d+\)((?:\s*@\s*[XYZ]\(\d+\))*?))\s*\)"
    )

    # Pattern for single operators (without tensor products)
    term_pattern_single = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*([XYZ]\(\d+\))"
    )

    # Regex to extract individual operators and indices
    operator_pattern = re.compile(r"([XYZ])\((\d+)\)")

    # Parse the expression
    terms = []

    # Process tensor product terms
    for match in term_pattern_tensor.finditer(expression):
        coefficient = float(match.group(1))  # Convert to float
        operator_sequence = match.group(4)

        # Extract individual operators
        operators = [
            (m.group(1), int(m.group(2)))
            for m in operator_pattern.finditer(operator_sequence)
        ]

        terms.append({"coefficient": coefficient, "operators": operators})

    # Process single operator terms
    for match in term_pattern_single.finditer(expression):
        coefficient = float(match.group(1))
        operator = match.group(4)

        # Extract the individual operator
        op_match = operator_pattern.search(operator)
        if op_match:
            pauli, qubit = op_match.group(1), int(op_match.group(2))

            terms.append({"coefficient": coefficient,
                         "operators": [(pauli, qubit)]})

    # Reconstruct the Hamiltonian using qiskit's SparsePauliOp
    paulis = []
    coeffs = []
    max_qubit = -1

    # Find the maximum qubit index
    for term in terms:
        for _, qubit in term["operators"]:
            max_qubit = max(max_qubit, qubit)

    for term in terms:
        # Initialize with identity (I) for all qubits
        pauli_list = ["I"] * (max_qubit + 1)

        # Place each Pauli operator at the correct position
        for pauli, qubit in term["operators"]:
            pauli_list[qubit] = pauli

        pauli_str = "".join(reversed(pauli_list))
        paulis.append(pauli_str)
        coeffs.append(term["coefficient"])

    return SparsePauliOp(paulis, np.array(coeffs, dtype=float))


def parametrize_qiskit_circuit(circuit):
    """
    Input: A qiskit.QuantumCircuit object with constant values inside parameterized gates
    Output: A parameterized qiskit.QuantumCircuit object with symbolic parameters and a map of constant values to shared parameters
    """
    param_circuit = QuantumCircuit(circuit.num_qubits, circuit.num_clbits)
    param_map = {}  # Maps constant values to shared parameters

    for inst in circuit.data:
        instruction, qargs, cargs = inst.operation, inst.qubits, inst.clbits
        new_params = []

        for param in instruction.params:
            if isinstance(param, (int, float)):  # Check if the param is a constant
                if param not in param_map:
                    param_map[param] = Parameter(f"θ_{len(param_map)}")
                new_params.append(param_map[param])
            else:
                new_params.append(param)  # Keep existing parameters

        param_circuit.append(instruction.__class__(*new_params), qargs, cargs)

    return param_circuit, param_map

# --------------------------- Helpers ----------------------------

def _clean_circuit(circ):
    """Return a copy with final measurements and idle qubits removed (if possible)."""
    c = circ.copy()
    try:
        c.remove_final_measurements()
    except Exception:
        pass
    try:
        c.remove_idle_qubits()  # no-op on older qiskit-terra
    except Exception:
        pass
    return c

def _active_qubits(circ):
    """Return set of qubit indices that appear in any non-measure operation."""
    active = set()
    for inst in circ.data:
        op = inst.operation
        # Skip classical-only and measurement ops
        if getattr(op, "name", "") in ("measure", "barrier", "delay", "reset"):
            continue
        for q in inst.qubits:
            active.add(circ.find_bit(q).index)  # map to integer index
    return active

def normalize_qasm(qasm_str: str) -> str:
    """
    Normalize a QASM string that might contain literal escape sequences.
    We convert literal '\n' to newlines, then collapse newlines to spaces.
    """
    decoded = qasm_str.encode("utf-8").decode("unicode_escape")
    return decoded.replace("\n", " ").strip()

def qubit_mismatch_penalty(llm_circ, gt_circ) -> float:
    """Compute a negative penalty if qubit counts differ, harsher if extra qubits are active."""
    n1 = llm_circ.num_qubits
    n2 = gt_circ.num_qubits
    if n1 == n2:
        return 0.0

    # Identify which circuit is larger and count "active" extra qubits
    if n1 > n2:
        larger, smaller_n = llm_circ, n2
    else:
        larger, smaller_n = gt_circ, n1

    active = _active_qubits(larger)
    extra_active = sum(1 for i in range(smaller_n, larger.num_qubits) if i in active)
    delta = abs(n1 - n2)

    penalty = BASE_MISMATCH_PENALTY + PER_EXTRA_QUBIT_PENALTY * delta + PER_ACTIVE_EXTRA_BONUS * extra_active
    # Clip so the penalty doesn't dominate beyond reason
    return max(-1.0, penalty)


def _probabilities(circuit, qargs=None) -> np.ndarray:
    """
    Return computational-basis probabilities, optionally marginalized to qargs.
    Uses exact statevector simulation.
    """
    c = _clean_circuit(circuit)
    n = c.num_qubits
    if MAX_SAFE_QUBITS is not None and n > MAX_SAFE_QUBITS:
        raise MemoryError(
            f"Circuit has {n} qubits; exceeds MAX_SAFE_QUBITS={MAX_SAFE_QUBITS}."
        )
    sv = Statevector.from_instruction(c)
    probs = sv.probabilities(qargs=qargs)  # marginal if qargs is not None
    probs = np.asarray(probs, dtype=float)
    probs = np.clip(probs, 0.0, 1.0)
    s = probs.sum()
    if not np.isfinite(s) or s <= 0:
        raise ValueError("Invalid probability vector.")
    return probs / s


def _kl(a: np.ndarray, b: np.ndarray) -> float:
    a = np.asarray(a, dtype=float) + EPS
    b = np.asarray(b, dtype=float) + EPS
    a = a / a.sum()
    b = b / b.sum()
    return float(np.sum(a * (np.log(a) - np.log(b))))


def js_distance(p: np.ndarray, q: np.ndarray) -> float:
    if p.shape != q.shape:
        raise ValueError(f"Cannot compute JS distance for different shapes: {p.shape} vs {q.shape}")
    m = 0.5 * (p + q)
    js_div = 0.5 * _kl(p, m) + 0.5 * _kl(q, m)
    return float(np.sqrt(js_div / np.log(2.0)))

# --------------------------- Rewards ----------------------------


def syntax_reward(qasm_str: str) -> float:
    """
    Light shaping: +0.2 if parseable, -1.0 otherwise.
    """
    try:
        parse(qasm_str)
        return SYNTAX_OK_BONUS
    except Exception:
        return SYNTAX_BAD_PENALTY


def dist_reward_exact(llm_qasm: str, gt_qasm: str) -> float:
    """
    1 - JS distance between probability vectors.
    If qubit counts differ, compute on the first k=min(n1,n2) qubits to avoid shape errors.
    NOTE: The *penalty* for mismatch is handled elsewhere; this function just returns similarity.
    """
    llm_circ = _clean_circuit(parse(llm_qasm))
    gt_circ  = _clean_circuit(parse(gt_qasm))

    n1, n2 = llm_circ.num_qubits, gt_circ.num_qubits
    if min(n1, n2) == 0:
        return 0.0  # degenerate; treat as maximally dissimilar

    if n1 == n2:
        p = _probabilities(llm_circ)
        q = _probabilities(gt_circ)
    else:
        k = min(n1, n2)
        keep = list(range(k))
        p = _probabilities(llm_circ, qargs=keep)
        q = _probabilities(gt_circ,  qargs=keep)

    m = 0.5 * (p + q)
    # KL helpers with smoothing
    a = (p + EPS) / (p + EPS).sum()
    b = (q + EPS) / (q + EPS).sum()
    m = (m + EPS) / (m + EPS).sum()
    js_div = 0.5 * np.sum(a * (np.log(a) - np.log(m))) + 0.5 * np.sum(b * (np.log(b) - np.log(m)))
    d = float(np.sqrt(js_div / np.log(2.0)))
    return 1.0 - d




def expectation_value_reward(llm_circuit: str, cost_hamiltonian: str,
                             smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    llm_circuit = parse(llm_circuit)
    llm_circuit = _clean_circuit(llm_circuit)

    statevector = Statevector.from_instruction(llm_circuit)
    cost_hamiltonian = construct_qiskit_hamiltonian(cost_hamiltonian)
    ev = statevector.expectation_value(cost_hamiltonian).real

    denom = (largest_eigenvalue - smallest_eigenvalue)
    if abs(denom) < 1e-12:
        # Avoid division by ~0; fallback to a squashed transform in [-1,1] → [0,1]
        # assuming eigenvalues are effectively constant.
        min_max_normalized_value = 0.5 * (np.tanh(ev) + 1.0)
    else:
        min_max_normalized_value = (ev - smallest_eigenvalue) / denom

    print(f"Expectation Value: {ev}, Smallest Eigenvalue: {smallest_eigenvalue}, Largest Eigenvalue: {largest_eigenvalue}")
    return 1.0 - float(min_max_normalized_value)



def optimization_reward_qiskit(qiskit_qc: str, H: str, smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    """
    A reward function that aims to optimize the circuit given the LLM generated warm-start circuit with initial parameters.

    Final reward depends on the optimization steps and the fact how close to the ground truth the optimization managed to take the circuit.
    """
    qiskit_qc = parse(qiskit_qc)
    qiskit_hamiltonian = construct_qiskit_hamiltonian(H)
    qiskit_symbolic_param_qc, param_map = parametrize_qiskit_circuit(qiskit_qc)
    param_items = list(param_map.items())
    initial_params = np.array([item[0] for item in param_items])
    param_objects = [item[1] for item in param_items]

    # Define cost function for optimization
    def cost_function(params):
        # Bind parameters to the circuit
        bound_circuit = qiskit_symbolic_param_qc.assign_parameters(
            {param_objects[i]: params[i] for i in range(len(params))}
        )

        # Remove any measurements and calculate statevector
        bound_circuit.remove_final_measurements()
        statevector = Statevector.from_instruction(bound_circuit)

        # Calculate expectation value using statevector
        expectation_value = statevector.expectation_value(
            qiskit_hamiltonian).real
        return expectation_value

    # Stopping criteria parameters
    max_iterations = 100
    tolerance = 1e-6

    # Track optimization progress
    iteration_count = 0
    cost_history = []

    def callback(x):
        nonlocal iteration_count, cost_history
        iteration_count += 1
        current_cost = cost_function(x)
        cost_history.append(current_cost)

        if iteration_count % 10 == 0:
            print(f'Step {iteration_count}, Cost: {current_cost:.6f}')

        # Check for convergence
        if len(cost_history) > 1:
            cost_change = abs(cost_history[-1] - cost_history[-2])
            if cost_change < tolerance:
                print(
                    f'Converged at step {iteration_count}: cost change {cost_change:.8f} < tolerance {tolerance}')
                return True  # Stop optimization

        if iteration_count >= max_iterations:
            print(f'Reached maximum iterations: {max_iterations}')
            return True

        return False

    # Run COBYLA optimization
    result = minimize(
        cost_function,
        initial_params,
        method='COBYLA',
        callback=callback,
        options={'maxiter': max_iterations, 'tol': tolerance}
    )

    total_steps = result.nfev  # Number of function evaluations

    optimized_circuit = qiskit_symbolic_param_qc.assign_parameters(
        {param_objects[i]: result.x[i] for i in range(len(result.x))}
    )
    # Smaller is better in training steps
    train_reward = 1 / total_steps
    # After optimization we favor those cases when the final cost is close to the optimal eigenvalue
    cost_reward = expectation_value_reward(
        dumps(optimized_circuit), H, smallest_eigenvalue, largest_eigenvalue)

    return 0.8*train_reward + 0.2*cost_reward


def reward_calculator(circuit_string: str, ground_truth: str,
                      cost_hamiltonian: str, smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    # Syntax
    s = syntax_reward(circuit_string)
    if s < 0:
        return s

    # Pre-parse and clean once for penalty computation
    llm_circ = _clean_circuit(parse(circuit_string))
    gt_circ  = _clean_circuit(parse(ground_truth))

    # Mismatch penalty (0 if same size)
    mismatch = qubit_mismatch_penalty(llm_circ, gt_circ)

    # Distribution similarity (shape-safe)
    dist_sim = dist_reward_exact(circuit_string, ground_truth)

    # If there is a mismatch, downweight the impact of dist_sim (it’s computed on marginals)
    if mismatch != 0.0:
        dist_weight = 0.5
    else:
        dist_weight = 1

    # Decide whether to include expectation/optimization branches
    # If mismatched, be conservative: allow expectation, but only allow optimization if really strong
    if dist_sim > OPTIMIZATION_THRESHOLD and mismatch == 0.0:
        optimization_value = optimization_reward_qiskit(
            circuit_string, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)
        return s + mismatch + dist_weight * 0.6 * dist_sim + 0.4 * optimization_value

    if dist_sim < EXPECTED_THRESHOLD:
        expectation_value = expectation_value_reward(
            circuit_string, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)
        if expectation_value > OPTIMIZATION_THRESHOLD and mismatch == 0.0:
            optimization_value = optimization_reward_qiskit(
                circuit_string, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)
            return s + mismatch + 0.30 * dist_weight*dist_sim + 0.30 * expectation_value + 0.40 * optimization_value
        else:
            return s + mismatch + 0.30 * dist_weight*dist_sim + 0.30 * expectation_value

    return s + mismatch + dist_weight * dist_sim


# --------------------------- CLI ----------------------------


def main(response_code: str, ground_truth_code: str, cost_hamiltonian: str, smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    response_qasm = normalize_qasm(response_code)
    gt_qasm = normalize_qasm(ground_truth_code)
    # Extra numeric parameters currently unused; kept for future reward extensions.
    return reward_calculator(response_qasm, gt_qasm, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)


if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: python quantum_reward_cal.py response_code ground_truth_code cost_hamiltonian smallest_eigenvalue largest_eigenvalue")
        sys.exit(1)
    try:
        result = main(sys.argv[1], sys.argv[2], sys.argv[3],
                      float(sys.argv[4]), float(sys.argv[5]))
        print(f"Reward: {result}")
        sys.exit(0)
    except Exception as e:
        # Surface the error clearly; your trainer/logger can catch this.
        print(f"Error computing reward: {e}")
        sys.exit(2)
