import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from datasets import load_dataset
from qiskit.qasm3 import loads, dumps
from qiskit.quantum_info import Statevector
from utils import construct_qiskit_hamiltonian, parametrize_qiskit_circuit
import numpy as np
import cma
import json
import pickle
from pathlib import Path
from tqdm import tqdm
from concurrent.futures import ProcessPoolExecutor, as_completed
from multiprocessing import cpu_count
import time

# Configuration
DATASET_NAME = "valterUo/graph-data-quantum-updated"
CHECKPOINT_DIR = "optimization_checkpoints"
RESULTS_DIR = "optimization_results"
BATCH_SIZE = 1  # Save checkpoints every N examples

def ensure_dirs():
    """Create necessary directories"""
    Path(CHECKPOINT_DIR).mkdir(exist_ok=True)
    Path(RESULTS_DIR).mkdir(exist_ok=True)

def save_checkpoint(data, filename):
    """Save checkpoint data"""
    ensure_dirs()
    filepath = Path(CHECKPOINT_DIR) / f"{filename}.pkl"
    with open(filepath, 'wb') as f:
        pickle.dump(data, f)
    print(f"Checkpoint saved: {filepath}")

def load_checkpoint(filename):
    """Load checkpoint data"""
    filepath = Path(CHECKPOINT_DIR) / f"{filename}.pkl"
    if filepath.exists():
        with open(filepath, 'rb') as f:
            return pickle.load(f)
    return None

def save_results(results, split_name):
    """Save final results to JSON"""
    ensure_dirs()
    filepath = Path(RESULTS_DIR) / f"optimization_results_{split_name}.json"
    with open(filepath, 'w') as f:
        json.dump(results, f, indent=2)
    print(f"Results saved: {filepath}")

def load_existing_results(split_name):
    """Load existing results if they exist"""
    filepath = Path(RESULTS_DIR) / f"optimization_results_{split_name}.json"
    if filepath.exists():
        with open(filepath, 'r') as f:
            return json.load(f)
    return {}

def solve_qiskit_circuit_with_cma_es(circuit_data_with_idx, target_ratio=0.97, maxiter=800):
    """
    Optimize a parametrized Qiskit circuit using CMA-ES.
    
    Args:
        circuit_data_with_idx: Tuple of (idx, circuit_data)
        target_ratio: Target ratio of optimal eigenvalue to achieve
        maxiter: Maximum CMA-ES iterations
    
    Returns:
        Tuple of (idx, optimization_results)
    """
    
    idx, circuit_data = circuit_data_with_idx
    
    try:
        # Extract data
        param_circuit = loads(circuit_data["circuit_with_params"])
        param_circuit, param_map = parametrize_qiskit_circuit(param_circuit)
        param_circuit.remove_final_measurements()
        cost_hamiltonian = construct_qiskit_hamiltonian(circuit_data["cost_hamiltonian"])

        # Find minimum eigenvalue for reference
        #eigenvalues, eigenvectors = np.linalg.eigh(cost_hamiltonian.to_matrix())
        #min_eigenvalue = np.min(eigenvalues)
        
        # Find optimal bitstring
        #min_eigenvector = eigenvectors[:, np.argmin(eigenvalues)]
        #max_amplitude_index = np.argmax(np.abs(min_eigenvector))
        n_qubits = param_circuit.num_qubits
        print(f"Optimizing circuit {idx} with {n_qubits} qubits and {len(param_map)} parameters")
        #optimal_bitstring = format(max_amplitude_index, f'0{n_qubits}b')

        # Get ground truth values
        exact_solution = json.loads(circuit_data["exact_solution"])
        optimal_eigenvalue = exact_solution["smallest_eigenvalues"][0]
        # Enure optimal_eigenvalue is the minimum eigenvalue
        #if not np.isclose(optimal_eigenvalue, min_eigenvalue):
        #    raise ValueError(f"Optimal eigenvalue from dataset ({optimal_eigenvalue}) does not match computed minimum eigenvalue ({min_eigenvalue})")
        target_value = target_ratio * optimal_eigenvalue
        
        # Extract parameter objects and initial values
        param_items = list(param_map.items())
        param_values = [item[0] for item in param_items]  # Initial values
        param_objects = [item[1] for item in param_items]  # Parameter objects
        
        def objective_function(params):
            """Objective function for CMA-ES optimization"""
            try:
                # Bind parameters to circuit
                bound_circuit = param_circuit.assign_parameters(
                    {param_objects[i]: params[i] for i in range(len(params))}
                )
                
                # Calculate expectation value
                statevector = Statevector.from_instruction(bound_circuit)
                expectation_value = statevector.expectation_value(cost_hamiltonian).real
                
                return float(expectation_value)
            
            except Exception as e:
                return float('inf')  # Return large value for failed evaluations
        
        def get_circuit_probabilities(params):
            """Get probability distribution from optimized circuit"""
            try:
                bound_circuit = param_circuit.assign_parameters(
                    {param_objects[i]: params[i] for i in range(len(params))}
                )
                statevector = Statevector.from_instruction(bound_circuit)
                return np.abs(statevector.data) ** 2
            except Exception as e:
                return np.zeros(2**param_circuit.num_qubits)
        
        # Initialize CMA-ES
        initial_params = np.array(param_values, dtype=float)
        
        # Reduce maxiter for larger circuits
        if param_circuit.num_qubits > 13:
            maxiter = 300
        
        # Set up CMA-ES with silent mode for parallel processing
        sigma0 = 0.1  # Initial step size
        es = cma.CMAEvolutionStrategy(initial_params, sigma0, options={"maxiter": maxiter}) #, "verbose": -1})
        
        # Optimization loop with early stopping
        iteration = 0
        best_value = float('inf')
        
        while not es.stop():
            solutions = es.ask()
            fitness_values = [objective_function(x) for x in solutions]
            es.tell(solutions, fitness_values)
            
            # Track progress
            current_best = min(fitness_values)
            if current_best < best_value:
                best_value = current_best
            iteration += 1
            # Early stopping if target reached
            if best_value <= target_value:
                break
        
        # Get final results
        optimized_params = es.result.xbest
        final_expectation_value = objective_function(optimized_params)
        final_probs = get_circuit_probabilities(optimized_params)
        
        # Get most probable states
        n_states_to_return = min(5, len(final_probs))  # Return top 5 states
        most_probable_indices = np.argsort(final_probs)[-n_states_to_return:][::-1]
        most_probable_states = [format(i, f'0{param_circuit.num_qubits}b') for i in most_probable_indices]
        states_probs = [final_probs[i] for i in most_probable_indices]
        
        # Calculate final optimized circuit
        final_circuit = param_circuit.assign_parameters(
            {param_objects[i]: optimized_params[i] for i in range(len(optimized_params))}
        )
        optimized_param_map = {str(param_objects[i]): optimized_params[i] for i in range(len(optimized_params))}
        return (idx, {
            'success': True,
            "signature": circuit_data["signature"],
            'most_probable_states': most_probable_states,
            'final_expectation_value': float(final_expectation_value),
            'optimized_params': optimized_params.tolist(),
            'optimized_param_map': optimized_param_map,
            'total_iterations': iteration,
            'states_probabilities': states_probs,
            'target_achieved': final_expectation_value <= target_value,
            'improvement_ratio': float(final_expectation_value / optimal_eigenvalue),
            'final_circuit_qasm': dumps(final_circuit),
            "original_circuit_data": circuit_data,
            'optimization_info': {
                'target_value': float(target_value),
                'optimal_eigenvalue': float(optimal_eigenvalue),
                'target_ratio': target_ratio,
                'n_qubits': n_qubits,
                'n_parameters': len(param_objects)
            }
        })
        
    except Exception as e:
        return (idx, {
            'signature': circuit_data["signature"],
            'success': False,
            'error': str(e),
            'final_expectation_value': float('inf'),
            'target_achieved': False
        })

def get_num_workers(user_n_workers=None):
    """Auto-detect number of workers, respecting SLURM if present."""
    if user_n_workers is not None:
        return user_n_workers
    slurm_cpus = os.environ.get("SLURM_CPUS_PER_TASK")
    if slurm_cpus is not None:
        return int(slurm_cpus)
    return cpu_count() - 1


def optimize_dataset_split_embarrassingly_parallel(
    ds, split_name, target_ratio=0.97, maxiter=800, resume=True, n_workers=None
):
    """Optimize all circuits in a dataset split with a fixed-size worker pool."""
    n_workers = get_num_workers(n_workers)
    print(f"Using {n_workers} parallel workers")

    if resume:
        results = load_existing_results(split_name)
        print(f"Loaded {len(results)} existing results for {split_name}")
    else:
        results = {}

    split_data = ds[split_name]
    total_examples = len(split_data)
    pending_indices = [idx for idx in range(total_examples) if str(idx) not in results]

    print(f"Total: {total_examples}, Already done: {len(results)}, Remaining: {len(pending_indices)}")

    if not pending_indices:
        print("All examples already processed!")
        return results

    successful_optimizations = sum(1 for r in results.values() if r.get('success', False))
    failed_optimizations = sum(1 for r in results.values() if not r.get('success', False))

    start_time = time.time()
    completed_count = 0

    with ProcessPoolExecutor(max_workers=n_workers) as executor, tqdm(total=len(pending_indices), desc=f"Optimizing {split_name}") as pbar:
        # Submit initial batch
        futures = {}
        next_to_submit = 0
        # Fill up the pool
        while len(futures) < n_workers and next_to_submit < len(pending_indices):
            idx = pending_indices[next_to_submit]
            future = executor.submit(
                solve_qiskit_circuit_with_cma_es, (idx, split_data[idx]), target_ratio, maxiter
            )
            futures[future] = idx
            next_to_submit += 1

        while futures:
            # Wait for the next completed job
            for future in as_completed(futures):
                idx = futures.pop(future)
                try:
                    result_idx, result = future.result()
                    results[str(result_idx)] = result
                    if result['success']:
                        successful_optimizations += 1
                    else:
                        failed_optimizations += 1
                except Exception as e:
                    print(f"Failed to process example {idx}: {e}")
                    results[str(idx)] = {
                        'success': False,
                        'error': str(e),
                        'final_expectation_value': float('inf'),
                        'target_achieved': False
                    }
                    failed_optimizations += 1

                completed_count += 1
                pbar.update(1)
                pbar.set_postfix({
                    'Success': successful_optimizations,
                    'Failed': failed_optimizations,
                    'Rate': f"{successful_optimizations/(successful_optimizations + failed_optimizations)*100:.1f}%" if (successful_optimizations + failed_optimizations) > 0 else "0%"
                })

                # Submit next job if any remain
                if next_to_submit < len(pending_indices):
                    next_idx = pending_indices[next_to_submit]
                    new_future = executor.submit(
                        solve_qiskit_circuit_with_cma_es, (next_idx, split_data[next_idx]), target_ratio, maxiter
                    )
                    futures[new_future] = next_idx
                    next_to_submit += 1

                # Save checkpoint periodically
                if completed_count % BATCH_SIZE == 0:
                    save_checkpoint(results, f"{split_name}_progress")
                    save_results(results, split_name)
                    elapsed_time = time.time() - start_time
                    avg_time_per_example = elapsed_time / completed_count
                    remaining_time = avg_time_per_example * (len(pending_indices) - completed_count)
                    print(f"\nCheckpoint saved. Estimated remaining time: {remaining_time/60:.1f} minutes")
                break  # Only process one completed future at a time

    # Save final results
    save_results(results, split_name)
    elapsed_time = time.time() - start_time
    print(f"\n=== {split_name.upper()} OPTIMIZATION COMPLETE ===")
    print(f"Total time: {elapsed_time/60:.1f} minutes")
    print(f"Average time per example: {elapsed_time/len(pending_indices):.1f} seconds")
    print(f"Total examples: {total_examples}")
    print(f"Successful optimizations: {successful_optimizations}")
    print(f"Failed optimizations: {failed_optimizations}")
    print(f"Success rate: {successful_optimizations/total_examples*100:.1f}%")
    return results

def optimize_full_dataset_embarrassingly_parallel(target_ratio=0.97, maxiter=800, resume=True, n_workers=None):
    print("Loading dataset...")
    ds = load_dataset(DATASET_NAME)
    all_results = {}
    for split_name in ds.keys():
        print(f"\n{'='*50}")
        print(f"Processing {split_name} split")
        print(f"{'='*50}")
        results = optimize_dataset_split_embarrassingly_parallel(
            ds, split_name, target_ratio=target_ratio, maxiter=maxiter, resume=resume, n_workers=n_workers
        )
        all_results[split_name] = results
    ensure_dirs()
    combined_filepath = Path(RESULTS_DIR) / "optimization_results_all_splits.json"
    with open(combined_filepath, 'w') as f:
        json.dump(all_results, f, indent=2)
    print(f"\n{'='*50}")
    print("DATASET OPTIMIZATION COMPLETE")
    print(f"{'='*50}")
    print(f"Combined results saved to: {combined_filepath}")
    return all_results

# Example usage
if __name__ == "__main__":
    # You can set n_workers to None for auto-detect, or to a specific number
    results = optimize_full_dataset_embarrassingly_parallel(
        target_ratio=0.97,
        maxiter=500,
        resume=True,
        n_workers=None  # or set to a specific number
    )