from qiskit.quantum_info import Statevector
from scipy.stats import entropy
import numpy as np
from utils import construct_qiskit_hamiltonian
from qiskit.qasm3 import loads
import json

def syntax_reward(circuit_string: str) -> float:
    """
    A simple reward function that checks if the circuit string is valid QASM syntax.
    Returns 1.0 for valid syntax, 0.0 otherwise.
    """
    try:
        # Attempt to parse the circuit string as QASM
        loads(circuit_string)
        return 1.0  # Valid syntax
    except Exception:
        return -1.0  # Invalid syntax
    

def KL_divergence_reward(circuit_string: str, ground_truth: dict) -> float:
    """
    A reward function that computes the KL divergence between the given circuit and the ground truth.
    """
    llm_circuit = loads(circuit_string)
    llm_circuit.remove_final_measurements()
    state = Statevector.from_instruction(llm_circuit)
    probs = state.probabilities_dict()
    circuit_with_params = ground_truth["circuit_with_params"]
    ground_truth_circuit = loads(circuit_with_params)
    ground_truth_circuit.remove_final_measurements()
    ground_truth_state = Statevector.from_instruction(ground_truth_circuit)

    relative_entropy = entropy(
        list(probs.values()), 
        list(ground_truth_state.probabilities_dict().values()),
        base=2,
        nan_policy='omit'
    )

    # np.log2(len(probs)) is the maximum possible value for relative entropy
    # when the distributions are uniform over the same number of outcomes
    scaled_relative_entropy = relative_entropy / np.log2(len(probs))

    # Lower is better for relative entropy, so we return 1 - scaled_relative_entropy
    return 1 - scaled_relative_entropy


def expectation_value_reward(circuit_string: str, ground_truth: dict) -> float:
    """
    A reward function that computes the expectation value of the circuit.
    """
    llm_circuit = loads(circuit_string)
    llm_circuit.remove_final_measurements()
    statevector = Statevector.from_instruction(llm_circuit)
    cost_hamiltonian = construct_qiskit_hamiltonian(ground_truth["cost_hamiltonian"])
    smallest_eigenvalue = json.loads(ground_truth["exact_solution"])["smallest_eigenvalues"][0]
    expectation_value = statevector.expectation_value(cost_hamiltonian).real

    # Normalize the expectation value
    print(f"Expectation Value: {expectation_value}, Smallest Eigenvalue: {smallest_eigenvalue}")
    normalized_expectation_value = np.abs(expectation_value - smallest_eigenvalue) / np.abs(smallest_eigenvalue)
    return 1 - normalized_expectation_value