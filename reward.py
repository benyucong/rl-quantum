from qiskit.quantum_info import Statevector
from scipy.stats import entropy
import numpy as np
from utils import construct_pennylane_hamiltonian, construct_qiskit_hamiltonian, parametrize_qiskit_circuit
from qiskit.qasm3 import loads
import json

import pennylane as qml
import torch
import torch.nn as nn
import torch.optim as optim

class QuantumCircuit(nn.Module):
    def __init__(self, qfunc, n_qubits, hamiltonian):
        super(QuantumCircuit, self).__init__()
        self.qfunc = qfunc
        self.n_qubits = n_qubits
        self.hamiltonian = hamiltonian
        self.dev = qml.device('default.qubit', wires=n_qubits)
        
    def forward(self, params):
        @qml.qnode(self.dev, interface='torch', diff_method='backprop')
        def circuit(x):
            self.qfunc(*x, wires=range(self.n_qubits))
            return qml.expval(self.hamiltonian)
        
        return circuit(params)
    

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


def optimization_reward(circuit_string: str, ground_truth: dict) -> float:
    """
    A reward function that aims to optimize the circuit given the LLM generated warm-start circuit with initial parameters
    """
    optimal_eigenvalue = json.loads(ground_truth["exact_solution"])["smallest_eigenvalues"][0]
    qiskit_qc = loads(circuit_string)
    H = ground_truth["cost_hamiltonian"]
    pennylane_H = construct_pennylane_hamiltonian(H)
    qiskit_symbolic_param_qc, param_map = parametrize_qiskit_circuit(qiskit_qc)
    qiskit_symbolic_param_qc.draw(output='mpl')
    params_to_values = {str(value) : key for key, value in param_map.items()}

    qfunc = qml.from_qiskit(qiskit_symbolic_param_qc)
    n_qubits = qiskit_symbolic_param_qc.num_qubits

    # Convert initial parameters to torch tensor
    initial_params_torch = torch.tensor([params_to_values[key] for key in sorted(params_to_values.keys())], 
                                    dtype=torch.float32, requires_grad=True)

    # Initialize model and optimizer
    model = QuantumCircuit(qfunc, n_qubits, pennylane_H)
    optimizer = optim.Adam([initial_params_torch], lr=0.01)

    params = initial_params_torch
    #print('Initial parameters:', params.detach().numpy())

    # Stopping criteria parameters
    max_iterations = 100
    tolerance = 1e-6
    patience = 10
    min_improvement = 1e-8
    total_steps = 1
    final_cost = None

    # Tracking variables
    best_cost = float('inf')
    no_improvement_count = 0
    prev_cost = None

    for i in range(max_iterations):
        optimizer.zero_grad()
        cost = model(params)
        cost.backward()
        optimizer.step()
        
        current_cost = cost.item()
        
        # Check for convergence based on cost change
        if prev_cost is not None:
            cost_change = abs(current_cost - prev_cost)
            if cost_change < tolerance:
                print(f'Converged at step {i}: cost change {cost_change:.8f} < tolerance {tolerance}')
                break
        
        # Check for improvement and early stopping
        if current_cost < best_cost - min_improvement:
            best_cost = current_cost
            no_improvement_count = 0
        else:
            no_improvement_count += 1
            if no_improvement_count >= patience:
                print(f'Early stopping at step {i}: no improvement for {patience} steps')
                break
        
        prev_cost = current_cost
        
        if i % 10 == 0:
            print(f'Step {i}, Cost: {current_cost:.6f}')
        
        total_steps += 1
        final_cost = current_cost

    print('Final parameters:', params.detach().numpy())

    # Smaller is better in training steps
    train_reward = 1/total_steps
    # After optimization we favor those cases when the final cost is close to the optimal eigenvalue
    cost_reward = final_cost/optimal_eigenvalue

    return train_reward + cost_reward