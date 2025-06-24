# reward score for quatum qasm
from qiskit.quantum_info import Statevector, SparsePauliOp
from scipy.stats import entropy
import numpy as np
from qiskit.qasm3 import loads
import json
import re

def syntax_reward(response_string: str) -> float:
    """
    A simple reward function that checks if the circuit string contains the word 'successfully'.
    Returns:
        1.0 if 'successfully' is present (case-insensitive),
       -1.0 otherwise.
    """
    if "successfully" in response_string.lower():
        return 1.0
    else:
        return -1.0