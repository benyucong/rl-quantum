from qiskit.quantum_info import Statevector, SparsePauliOp
from scipy.stats import entropy
import numpy as np
from qiskit_qasm3_import import parse
import json
import re
import ast


def construct_qiskit_hamiltonian(expression):
    """ "
    Construct a Qiskit Hamiltonian from a string expression encoding Pennylane Hamiltonian."
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

            terms.append({"coefficient": coefficient, "operators": [(pauli, qubit)]})

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
        pauli_str = "I" * (max_qubit + 1)

        # Replace Identity with appropriate Pauli operator at correct positions
        for pauli, qubit in term["operators"]:
            pauli_str = pauli_str[:qubit] + pauli + pauli_str[qubit + 1 :]

        # Reverse the string as qiskit expects the least significant qubit on the right
        # pauli_str = pauli_str[::-1]

        paulis.append(pauli_str)
        coeffs.append(term["coefficient"])

    return SparsePauliOp(paulis, coeffs)


def syntax_reward(circuit_string: str):
    """
    A simple reward function that checks if the circuit string is valid QASM syntax.
    """
    # Attempt to parse the circuit string as QASM
    # print(f"normalized circuit: ||{circuit_string}||")
    qiskit_circuit = parse(circuit_string)

    

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

def normalize_qasm(qasm_str: str) -> str:
    # Convert literal \n into real newlines
    decoded = qasm_str.encode('utf-8').decode('unicode_escape')
    # print("After decoding:", repr(decoded))

    # Now replace newlines with spaces
    normalized = decoded.replace('\n', ' ').strip()
    # print("Normalized QASM:", normalized)
    return normalized


def main(file_path: str):
    try:
        # Read the circuit string from the file
        with open(file_path, "r") as file:
            circuit_string = (file.read())
        
        # Compute the syntax reward
        circuit_string = normalize_qasm(circuit_string)
        syntax_reward(circuit_string)
        return "Syntax reward computed successfully"
    except FileNotFoundError:
        return(f"Error: File '{file_path}' not found.")
    except Exception as e:
        import traceback
        traceback.print_exc()
        return(f"Error: {e}")

# Example usage
if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python reward.py <file_path>")
        exit(1)
    else:
        file_path = sys.argv[1]
        result = main(file_path)
        print(result) 
        exit(0)