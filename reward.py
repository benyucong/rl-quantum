from qiskit.quantum_info import Statevector
from scipy.stats import entropy
import numpy as np
from utils import construct_pennylane_hamiltonian, construct_qiskit_hamiltonian, parametrize_qiskit_circuit
from qiskit.qasm3 import loads, dumps
import json

import pennylane as qml
import torch
import torch.nn as nn
import torch.optim as optim

from scipy.optimize import minimize


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

    def get_circuit(self):
        @qml.qnode(self.dev)
        def circuit(x):
            self.qfunc(*x, wires=range(self.n_qubits))
            return qml.expval(self.hamiltonian)

        return circuit


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

    # Compute the largest eigenvalue from the cost Hamiltonian
    # It might be better to do this offline and extend the training data
    eigenvalues = np.linalg.eigvalsh(cost_hamiltonian)  # eigvalsh for Hermitian matrices
    largest_eigenvalue = np.max(eigenvalues)

    # Normalize the expectation value
    print(f"Expectation Value: {expectation_value}, Smallest Eigenvalue: {smallest_eigenvalue}, Largest Eigenvalue: {largest_eigenvalue}")
    min_max_normalized_value = (expectation_value - smallest_eigenvalue) / (largest_eigenvalue - smallest_eigenvalue)
    return 1 - min_max_normalized_value


def expectation_value_reward_pennylane(circuit_in, ground_truth: dict, params = None) -> float:
    """
    A reward function that computes the expectation value of the circuit using PennyLane.
    """
    # Load circuit and convert to PennyLane
    if type(circuit_in) is str:
        llm_circuit = loads(circuit_in)
        llm_circuit.remove_final_measurements()

        # Convert to PennyLane format
        qfunc = qml.from_qiskit(llm_circuit)
        n_qubits = llm_circuit.num_qubits

        # Create PennyLane device and QNode
        dev = qml.device('default.qubit', wires=n_qubits)
        
        @qml.qnode(dev)
        def circuit():
            qfunc(wires=range(n_qubits))
            return qml.expval(pennylane_hamiltonian)
    else:
        circuit = circuit_in

    # Construct PennyLane Hamiltonian
    pennylane_hamiltonian = construct_pennylane_hamiltonian(ground_truth["cost_hamiltonian"])
    
    # Get ground truth values
    smallest_eigenvalue = json.loads(ground_truth["exact_solution"])["smallest_eigenvalues"][0]
    
    # Calculate expectation value
    expectation_value = circuit(params) if params is not None else circuit()
    
    # Compute the largest eigenvalue from the cost Hamiltonian
    hamiltonian_matrix = pennylane_hamiltonian.matrix()
    eigenvalues = np.linalg.eigvalsh(hamiltonian_matrix)  # eigvalsh for Hermitian matrices
    largest_eigenvalue = np.max(eigenvalues)
    
    # Normalize the expectation value
    print(f"PennyLane Expectation Value: {expectation_value}, Smallest Eigenvalue: {smallest_eigenvalue}, Largest Eigenvalue: {largest_eigenvalue}")
    min_max_normalized_value = (expectation_value - smallest_eigenvalue) / (largest_eigenvalue - smallest_eigenvalue)
    return 1 - min_max_normalized_value


def optimization_reward_pennylane(circuit_string: str, ground_truth: dict) -> float:
    """
    A reward function that aims to optimize the circuit given the LLM generated warm-start circuit with initial parameters
    """

    qiskit_qc = loads(circuit_string)
    H = ground_truth["cost_hamiltonian"]
    pennylane_H = construct_pennylane_hamiltonian(H)

    qiskit_symbolic_param_qc, param_map = parametrize_qiskit_circuit(qiskit_qc)
    param_list = list(param_map.items())
    param_values = [item[0] for item in param_list]
    param_objects = [item[1] for item in param_list]

    initial_params_torch = torch.tensor(param_values, dtype=torch.float32, requires_grad=True)

    qfunc = qml.from_qiskit(qiskit_symbolic_param_qc)
    n_qubits = qiskit_symbolic_param_qc.num_qubits

    # Initialize model and optimizer
    model = QuantumCircuit(qfunc, n_qubits, pennylane_H)
    optimizer = optim.Adam([initial_params_torch], lr=0.01)

    params = initial_params_torch

    # Stopping criteria parameters
    max_iterations = 100
    tolerance = 1e-6
    patience = 10
    min_improvement = 1e-8
    total_steps = 1

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
                print(f'Converged at step {i}: cost {current_cost:.4f} < tolerance {tolerance}')
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

    final_params = params.detach().numpy()

    optimized_circuit = model.get_circuit()

    # Smaller is better in training steps
    train_reward = 1 / total_steps
    
    # After optimization we favor those cases when the final cost is close to the optimal eigenvalue
    cost_reward = expectation_value_reward_pennylane(optimized_circuit, ground_truth, final_params)

    return (train_reward + cost_reward) / 2


def optimization_reward_qiskit(circuit_string: str, ground_truth: dict) -> float:
    """
    A reward function that aims to optimize the circuit given the LLM generated warm-start circuit with initial parameters
    """
    #optimal_eigenvalue = json.loads(ground_truth["exact_solution"])["smallest_eigenvalues"][0]
    qiskit_qc = loads(circuit_string)
    H = ground_truth["cost_hamiltonian"]
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
        expectation_value = statevector.expectation_value(qiskit_hamiltonian).real
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
                print(f'Converged at step {iteration_count}: cost change {cost_change:.8f} < tolerance {tolerance}')
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

    final_cost = result.fun
    total_steps = result.nfev  # Number of function evaluations

    optimized_circuit = qiskit_symbolic_param_qc.assign_parameters(
        {param_objects[i]: result.x[i] for i in range(len(result.x))}
    )
    # Smaller is better in training steps
    train_reward = 1/total_steps
    # After optimization we favor those cases when the final cost is close to the optimal eigenvalue
    cost_reward = expectation_value_reward(dumps(optimized_circuit), ground_truth)

    return (train_reward + cost_reward) / 2