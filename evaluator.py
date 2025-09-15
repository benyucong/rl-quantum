import os
from datasets import load_dataset
import json
from qiskit.qasm3 import loads, dumps
import numpy as np
from reward import JS_divergence_reward, KL_divergence_reward, expectation_value_reward, optimization_reward_qiskit
from utils import construct_qiskit_hamiltonian, parametrize_qiskit_circuit
from concurrent.futures import ThreadPoolExecutor

from warm_start import get_warmstart_qaoa_circuit, hamiltonian_to_quadratic_program

class Evaluator:

    def __init__(self):
        self.results = None

        with open("quantum_circuits_output_20250911_144036_rl_quantum_4b.json") as f:
            circuits = json.load(f)
            self.results = circuits["results"]

        self.evaluation_results = {}
        DATASET_NAME = "valterUo/graph-data-quantum-optimized"
        ds = load_dataset(DATASET_NAME)
        self.test_data = list(ds["test"])


    def process_circuit(self, circuit_data):
        j, circuit = circuit_data
        try:
            # Original LLM circuit
            qasm_str = circuit["generated_circuit"]
            qiskit_circuit = loads(qasm_str)
            
            # Warm-start QAOA circuit
            cost_hamiltonian_str = circuit['dataset_metrics']['cost_hamiltonian']
            cost_ham = construct_qiskit_hamiltonian(cost_hamiltonian_str)
            qp = hamiltonian_to_quadratic_program(cost_ham)
            warmstart_circuit = get_warmstart_qaoa_circuit(qp, p=1)
            # Parametrize circuits for random sampling
            parametrized_llm_circuit, llm_param_map = parametrize_qiskit_circuit(qiskit_circuit)
            ws_param_map = warmstart_circuit.parameters
            
            ground_truth_index = circuit["sample_index"]
            test_item = self.test_data[ground_truth_index]
            
            # Generate random circuits for both LLM and warm-start
            def generate_random_llm_circuit(_):
                param_map_random = {param: np.random.uniform(-np.pi, np.pi) for param in llm_param_map.values()}
                new_circuit = parametrized_llm_circuit.assign_parameters(param_map_random)
                return dumps(new_circuit)
            
            def generate_random_ws_circuit(_):
                param_map_random = {param: np.random.uniform(-np.pi, np.pi) for param in ws_param_map.data}
                new_circuit = warmstart_circuit.assign_parameters(param_map_random)
                return dumps(new_circuit)
            
            # Generate 50 random circuits for each method
            with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                random_llm_circuits = list(executor.map(generate_random_llm_circuit, range(100)))
                random_ws_circuits = list(executor.map(generate_random_ws_circuit, range(100)))
            
            # Compute KL divergence for all methods
            def compute_kl_divergence(circuit_qasm):
                return KL_divergence_reward(circuit_qasm, test_item)
            
            def compute_expectation_value(circuit_qasm):
                return expectation_value_reward(circuit_qasm, test_item)
            
            def compute_js_divergence(circuit_qasm):
                return JS_divergence_reward(circuit_qasm, test_item)

            def compute_optimization_reward(circuit_qasm, parametrize=True):
                return optimization_reward_qiskit(circuit_qasm, test_item, parametrize=parametrize)

            with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                # Original LLM circuit reward
                llm_reward = compute_kl_divergence(qasm_str)
                
                # Random LLM circuits rewards
                random_llm_rewards = list(executor.map(compute_kl_divergence, random_llm_circuits))
                random_ws_rewards = list(executor.map(compute_kl_divergence, random_ws_circuits))
                
                # Expectation values for warm-start circuits
                ws_expectation_values = list(executor.map(compute_expectation_value, random_ws_circuits))
                random_expectation_values = list(executor.map(compute_expectation_value, random_llm_circuits))

                # JS Divergence rewards (if needed)
                random_llm_js_rewards = list(executor.map(compute_js_divergence, random_llm_circuits))
                random_ws_js_rewards = list(executor.map(compute_js_divergence, random_ws_circuits))
                
                llm_original_js = compute_js_divergence(qasm_str)
                llm_original_expectation = compute_expectation_value(qasm_str)

                # Optimization reward for the original LLM circuit
                llm_optimization_reward = compute_optimization_reward(qasm_str)
                # Optimization reward for the original warm-start circuit
                ws_optimization_reward = compute_optimization_reward(dumps(warmstart_circuit), parametrize=False)
                
            
            # Calculate averages
            avg_random_llm_reward = float(np.mean(random_llm_rewards))
            avg_ws_reward = float(np.mean(random_ws_rewards))
            avg_ws_expectation = float(np.mean(ws_expectation_values))
            avg_random_expectation = float(np.mean(random_expectation_values))
            avg_random_llm_js = float(np.mean(random_llm_js_rewards))
            avg_random_ws_js = float(np.mean(random_ws_js_rewards))
            avg_random_llm_optimization = float(llm_optimization_reward)
            avg_random_ws_optimization = float(ws_optimization_reward)

            exact_solution = json.loads(test_item["exact_solution"])
            
            result = {
                "llm_kl_divergence_reward": float(llm_reward),
                "llm_js_divergence_reward": llm_original_js,
                "llm_expectation_value": llm_original_expectation,
                "avg_random_llm_kl_divergence": avg_random_llm_reward,
                "avg_warmstart_kl_divergence": avg_ws_reward,
                "avg_warmstart_expectation_value": avg_ws_expectation,
                "avg_random_llm_expectation_value": avg_random_expectation,
                "ground_truth_eigenvalue": exact_solution["smallest_eigenvalues"][0],
                "avg_random_llm_js_divergence": avg_random_llm_js,
                "avg_random_warmstart_js_divergence": avg_random_ws_js,
                "avg_random_llm_optimization_reward": avg_random_llm_optimization,
                "avg_random_warmstart_optimization_reward": avg_random_ws_optimization
            }
            
            return ground_truth_index, result
            
        except Exception as e:
            print(f"Error processing circuit {j}: {e}")
            return circuit["sample_index"], {
                "llm_kl_divergence_reward": None,
                "llm_js_divergence_reward": None,
                "llm_expectation_value": None,
                "avg_random_llm_kl_divergence": None,
                "avg_warmstart_kl_divergence": None,
                "avg_warmstart_expectation_value": None,
                "avg_random_llm_expectation_value": None,
                "ground_truth_eigenvalue": None,
                "avg_random_llm_js_divergence": None,
                "avg_random_warmstart_js_divergence": None,
                "avg_random_llm_optimization_reward": None,
                "avg_random_warmstart_optimization_reward": None
            }

    def evaluate(self):
        # Process all circuits in parallel
        circuits = self.results
        try:
            with open("evaluation_results.json", "r") as f:
                rewards = json.load(f)
        except FileNotFoundError:
            rewards = {}

        for j, circuit in enumerate(circuits):
            print(f"Processing circuit {j}/{len(circuits)}")
            if str(circuit["sample_index"]) in rewards:
                print(f"Skipping circuit {j} (index {circuit['sample_index']}) - already processed.")
                continue
            ground_truth_index, result = self.process_circuit((j, circuit))
            rewards[str(ground_truth_index)] = result
            
            # Save results after each circuit
            with open("evaluation_results.json", "w") as f:
                json.dump(rewards, f, indent=4)
            
        
