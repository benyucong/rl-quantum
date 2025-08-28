#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Exact (statevector) reward for QASM circuits.

Reward = syntax_bonus + (1 - JS_distance(p_llm, p_gt))
- JS_distance ∈ [0, 1], symmetric, numerically stable with ε-smoothing.
- Probabilities come from full statevectors (length 2**n) in computational order.
- Syntax bonus is small to avoid dominating learning signals.

CLI:
  python quantum_syntax_reward.py <response_qasm> <ground_truth_qasm> <cost_hamiltonian> <smallest_eigenvalue> <largest_eigenvalue>
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
        raise ValueError(
            "Invalid probability vector (sum is non-positive or non-finite).")
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
    Jensen-Shannon distance in [0,1]. Uses natural logs internally, scales by log(2).
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


def expectation_value_reward(llm_circuit: str, cost_hamiltonian: str, smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    """
    A reward function that computes the expectation value of the circuit.
    """
    llm_circuit = parse(llm_circuit)
    llm_circuit.remove_final_measurements()
    statevector = Statevector.from_instruction(llm_circuit)
    cost_hamiltonian = construct_qiskit_hamiltonian(cost_hamiltonian)
    expectation_value = statevector.expectation_value(cost_hamiltonian).real

    # Normalize the expectation value
    print(
        f"Expectation Value: {expectation_value}, Smallest Eigenvalue: {smallest_eigenvalue}, Largest Eigenvalue: {largest_eigenvalue}")
    min_max_normalized_value = (
        expectation_value - smallest_eigenvalue) / (largest_eigenvalue - smallest_eigenvalue)
    return 1 - min_max_normalized_value


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
        dumps(optimized_circuit), smallest_eigenvalue, largest_eigenvalue)

    return 0.8*train_reward + 0.2*cost_reward


def reward_calculator(circuit_string: str, ground_truth: str, cost_hamiltonian: str, smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    """
    Final reward:
      - early exit on syntax failure,
      - otherwise syntax bonus + distribution similarity + expectation_value + optimization_value.
    """
    s = syntax_reward(circuit_string)
    if s < 0:
        return s
    # Distribution reward
    dist_reward = dist_reward_exact(circuit_string, ground_truth)

    if dist_reward > OPTIMIZATION_THRESHOLD:
        optimization_value = optimization_reward_qiskit(
            circuit_string, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)
        return s + 0.6*dist_reward + 0.4*optimization_value
    if dist_reward < EXPECTED_THRESHOLD:
        expectation_value = expectation_value_reward(
            circuit_string, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)
        if expectation_value > OPTIMIZATION_THRESHOLD:
            optimization_value = optimization_reward_qiskit(
                circuit_string, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)
            return s + 0.3*dist_reward + 0.3*expectation_value + 0.4*optimization_value
        else:
            return s + 0.3*dist_reward + 0.3*expectation_value
    return s + dist_reward

# --------------------------- CLI ----------------------------


def main(response_code: str, ground_truth_code: str, cost_hamiltonian: str, smallest_eigenvalue: float, largest_eigenvalue: float) -> float:
    response_qasm = normalize_qasm(response_code)
    gt_qasm = normalize_qasm(ground_truth_code)
    # Extra numeric parameters currently unused; kept for future reward extensions.
    return reward_calculator(response_qasm, gt_qasm, cost_hamiltonian, smallest_eigenvalue, largest_eigenvalue)


if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: python quantum_syntax_reward.py response_code ground_truth_code cost_hamiltonian smallest_eigenvalue largest_eigenvalue")
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
