from qiskit.quantum_info import Statevector, SparsePauliOp
from scipy.stats import entropy
import numpy as np
from qiskit_qasm3_import import parse
import cudaq
import json
import re
import ast

def qasm_to_cudaq_kernel(qasm_str: str):
    """
    Parses your OpenQASM 3.0 with rx, rz, crz, and measurement.
    Builds a CUDA-Q kernel for statevector simulation (ignores measurement).
    """
    kernel = cudaq.make_kernel()

    # Find qubit count
    qubit_decl = re.search(r"qubit\[(\d+)\]", qasm_str)
    if not qubit_decl:
        raise ValueError("No qubit declaration found.")
    num_qubits = int(qubit_decl.group(1))
    qubits = kernel.qalloc(num_qubits)

    # Split by semicolon
    lines = qasm_str.strip().split(';')
    for line in lines:
        line = line.strip()
        if not line:
            continue

        # Ignore headers and classical bits
        if line.startswith('OPENQASM') or line.startswith('include') or \
           line.startswith('qubit') or line.startswith('bit'):
            continue

        # Ignore measurement
        if 'measure' in line:
            continue

        # rx(θ) q[i]
        match = re.match(r'rx\(([^)]+)\)\s+q\[(\d+)\]', line)
        if match:
            angle, idx = match.groups()
            kernel.rx(float(angle), qubits[int(idx)])
            continue

        # rz(θ) q[i]
        match = re.match(r'rz\(([^)]+)\)\s+q\[(\d+)\]', line)
        if match:
            angle, idx = match.groups()
            kernel.rz(float(angle), qubits[int(idx)])
            continue

        # crz(θ) q[i], q[j]
        match = re.match(r'crz\(([^)]+)\)\s+q\[(\d+)\],\s*q\[(\d+)\]', line)
        if match:
            angle, control, target = match.groups()
            kernel.crz(float(angle), qubits[int(control)], qubits[int(target)])
            continue

        print(f"Warning: Unrecognized line: {line}")

    return kernel

def syntax_reward(circuit_string: str) -> float:
    """
    A simple reward function that checks if the circuit string is valid QASM syntax.
    """
    # Attempt to parse the circuit string as QASM
    # print(f"normalized circuit: ||{circuit_string}||")
    try:
        qiskit_circuit = parse(circuit_string)
        return 1.0  # Return a high reward for valid syntax
    except Exception as e:
        # If parsing fails, the syntax is invalid
        return -1.0  # Return a low reward for invalid syntax

    

def KL_divergence_reward_cpu(llm_circuit: str, ground_truth_circuit: str) -> float:
    """
    A reward function that computes the KL divergence between the given circuit and the ground truth.
    """
    llm_circuit = parse(llm_circuit)
    ground_truth_circuit = parse(ground_truth_circuit)
    
    llm_circuit.remove_final_measurements()
    state = Statevector.from_instruction(llm_circuit)
    probs = state.probabilities_dict()
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



import cudaq
import numpy as np
from scipy.stats import entropy

def KL_divergence_reward_cuda(llm_qasm: str, truth_qasm: str) -> float:
    """
    Compute the KL divergence reward using CUDA‑Q statevector simulation.
    """
    cudaq.set_target("nvidia", option="mgpu")  # multi-GPU pooling via MPI if available
    target = cudaq.get_target()
    num_qpus = target.num_qpus()
    print("Number of QPUs:", num_qpus)
    # Convert QASM to CUDA‑Q kernels
    llm_kernel = qasm_to_cudaq_kernel(llm_qasm)
    truth_kernel = qasm_to_cudaq_kernel(truth_qasm)

    # Sample with a single shot (statevector returned on simulator)
    llm_res = cudaq.sample(llm_kernel, shots_count=1000)
    truth_res = cudaq.sample(truth_kernel, shots_count=1000)

    # Extract statevectors
    llm_state = np.array(llm_res.statevector)
    truth_state = np.array(truth_res.statevector)

    # Compute probability distributions
    llm_probs = np.abs(llm_state) ** 2
    truth_probs = np.abs(truth_state) ** 2
    llm_probs /= np.sum(llm_probs)
    truth_probs /= np.sum(truth_probs)

    # Compute KL divergence (P || Q)
    kl = entropy(llm_probs, truth_probs, base=2, nan_policy='omit')

    # Normalize by max possible KL = log2(N)
    max_kl = np.log2(len(llm_probs))
    scaled_kl = kl / max_kl if max_kl > 0 else 0.0

    # Reward = 1 − scaled KL
    reward = 1.0 - scaled_kl
    return reward


def normalize_qasm(qasm_str: str) -> str:
    # Convert literal \n into real newlines
    decoded = qasm_str.encode('utf-8').decode('unicode_escape')
    # print("After decoding:", repr(decoded))

    # Now replace newlines with spaces
    normalized = decoded.replace('\n', ' ').strip()
    # print("Normalized QASM:", normalized)
    return normalized

def reward_calculator(circuit_string: str, ground_truth: str) -> float:
    """
    A function to compute the reward based on the type specified.
    """
    syntax_reward_value = syntax_reward(circuit_string)
    if syntax_reward_value < 0:
        return syntax_reward_value
    # If the syntax is valid, compute the KL divergence reward
    return KL_divergence_reward_cuda(circuit_string, ground_truth)
    

def main(response_file_path: str,  ground_truth_file_path: str):
    # Read the circuit string from the file
    with open(response_file_path, "r") as file:
        response_circuit_string = (file.read())
        response_circuit_string = normalize_qasm(response_circuit_string)
        
    with open(ground_truth_file_path, "r") as file:
        truth_circuit_string = (file.read())
        truth_circuit_string = normalize_qasm(truth_circuit_string)
    # Compute the syntax reward

    result = reward_calculator(response_circuit_string, truth_circuit_string)
    return result

# Example usage
if __name__ == "__main__":
    import sys
    if len(sys.argv) != 3:
        print("Usage: python reward.py <response_file_path> <ground_truth_file_path>")
        exit(1)
    else:
        response_file_path = sys.argv[1]
        ground_truth_file_path = sys.argv[2]
        result = main(response_file_path, ground_truth_file_path)
        print(f"Reward: {result}")
        exit(0)