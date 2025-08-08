# reward score for quatum qasm
from qiskit.quantum_info import Statevector, SparsePauliOp
from scipy.stats import entropy
import numpy as np
from qiskit.qasm3 import loads
import json
import re


# extract "Reward: {result}"
def extract_reward(response_string: str) -> float:
    """
    Extracts the reward value from a response string.
    """
    # Extracts the reward value from a string like 'Reward: 42.5'.
    # Handles integers, floats, and scientific notation.
    match = re.search(r"Reward:\s*([+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)", response_string)
    if match:
        return float(match.group(1))
    return -1.0