from qiskit.quantum_info import Statevector, SparsePauliOp
from scipy.stats import entropy
import numpy as np
from qiskit_qasm3_import import parse
import json
import re
import ast
import math

def safe_eval(expr: str) -> float:
    """Evaluate math expressions like 'pi/2' without sympy."""
    try:
        return float(eval(expr, {"__builtins__": {}}, math.__dict__))
    except Exception as e:
        raise ValueError(f"Invalid expression '{expr}': {e}")


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
    return 2 * KL_divergence_reward_cpu(circuit_string, ground_truth) + syntax_reward_value


def main(response_file_path: str,  ground_truth_file_path: str)-> float:
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