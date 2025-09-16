import os
from datasets import load_dataset
import json
from qiskit.qasm3 import loads, dumps
import numpy as np
from reward import JS_divergence_reward, KL_divergence_reward, expectation_value_reward, optimization_reward_qiskit
from utils import construct_qiskit_hamiltonian, parametrize_qiskit_circuit
from concurrent.futures import ThreadPoolExecutor

from warm_start import get_warmstart_qaoa_circuit, hamiltonian_to_quadratic_program
from qiskit import transpile

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
        
        # Initialize result dictionary with None values
        result = {
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
        
        ground_truth_index = circuit["sample_index"]
        test_item = self.test_data[ground_truth_index]
        
        # Get ground truth eigenvalue (this should always work)
        try:
            exact_solution = json.loads(test_item["exact_solution"])
            result["ground_truth_eigenvalue"] = exact_solution["smallest_eigenvalues"][0]
        except Exception as e:
            print(f"Error getting ground truth for circuit {j}: {e}")
        
        # Process LLM circuit
        try:
            qasm_str = circuit["generated_circuit"]
            qiskit_circuit = loads(qasm_str)
            parametrized_llm_circuit, llm_param_map = parametrize_qiskit_circuit(qiskit_circuit)
            
            # LLM original circuit rewards
            try:
                result["llm_kl_divergence_reward"] = float(KL_divergence_reward(qasm_str, test_item))
            except Exception as e:
                print(f"Error computing LLM KL divergence for circuit {j}: {e}")
            
            try:
                result["llm_js_divergence_reward"] = JS_divergence_reward(qasm_str, test_item)
            except Exception as e:
                print(f"Error computing LLM JS divergence for circuit {j}: {e}")
            
            try:
                result["llm_expectation_value"] = expectation_value_reward(qasm_str, test_item)
            except Exception as e:
                print(f"Error computing LLM expectation value for circuit {j}: {e}")
            
            try:
                result["avg_random_llm_optimization_reward"] = float(optimization_reward_qiskit(qasm_str, test_item, parametrize=True))
            except Exception as e:
                print(f"Error computing LLM optimization reward for circuit {j}: {e}")
            
            # Random LLM circuits
            try:
                def generate_random_llm_circuit(_):
                    param_map_random = {param: np.random.uniform(-np.pi, np.pi) for param in llm_param_map.values()}
                    new_circuit = parametrized_llm_circuit.assign_parameters(param_map_random)
                    return dumps(new_circuit)
                
                with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                    random_llm_circuits = list(executor.map(generate_random_llm_circuit, range(100)))
                
                # Compute rewards for random LLM circuits
                try:
                    with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                        random_llm_rewards = list(executor.map(lambda c: KL_divergence_reward(c, test_item), random_llm_circuits))
                    result["avg_random_llm_kl_divergence"] = float(np.mean(random_llm_rewards))
                except Exception as e:
                    print(f"Error computing random LLM KL divergence for circuit {j}: {e}")
                
                try:
                    with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                        random_llm_js_rewards = list(executor.map(lambda c: JS_divergence_reward(c, test_item), random_llm_circuits))
                    result["avg_random_llm_js_divergence"] = float(np.mean(random_llm_js_rewards))
                except Exception as e:
                    print(f"Error computing random LLM JS divergence for circuit {j}: {e}")
                
                try:
                    with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                        random_expectation_values = list(executor.map(lambda c: expectation_value_reward(c, test_item), random_llm_circuits))
                    result["avg_random_llm_expectation_value"] = float(np.mean(random_expectation_values))
                except Exception as e:
                    print(f"Error computing random LLM expectation values for circuit {j}: {e}")
                    
            except Exception as e:
                print(f"Error generating random LLM circuits for circuit {j}: {e}")
                
        except Exception as e:
            print(f"Error processing LLM circuit {j}: {e}")
        
        # Process warm-start circuit (this is the part that often fails)
        try:
            cost_hamiltonian_str = circuit['dataset_metrics']['cost_hamiltonian']
            cost_ham = construct_qiskit_hamiltonian(cost_hamiltonian_str)
            qp = hamiltonian_to_quadratic_program(cost_ham)
            warmstart_circuit = get_warmstart_qaoa_circuit(qp, p=1)
            ws_param_map = warmstart_circuit.parameters
            
            try:
                result["avg_random_warmstart_optimization_reward"] = float(optimization_reward_qiskit(dumps(warmstart_circuit), test_item, parametrize=False))
            except Exception as e:
                print(f"Error computing warmstart optimization reward for circuit {j}: {e}")
            
            try:
                def generate_random_ws_circuit(_):
                    param_map_random = {param: np.random.uniform(-np.pi, np.pi) for param in ws_param_map.data}
                    new_circuit = warmstart_circuit.assign_parameters(param_map_random)
                    return dumps(new_circuit)
                
                with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                    random_ws_circuits = list(executor.map(generate_random_ws_circuit, range(100)))
                
                try:
                    with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                        random_ws_rewards = list(executor.map(lambda c: KL_divergence_reward(c, test_item), random_ws_circuits))
                    result["avg_warmstart_kl_divergence"] = float(np.mean(random_ws_rewards))
                except Exception as e:
                    print(f"Error computing warmstart KL divergence for circuit {j}: {e}")
                
                try:
                    with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                        ws_expectation_values = list(executor.map(lambda c: expectation_value_reward(c, test_item), random_ws_circuits))
                    result["avg_warmstart_expectation_value"] = float(np.mean(ws_expectation_values))
                except Exception as e:
                    print(f"Error computing warmstart expectation values for circuit {j}: {e}")
                
                try:
                    with ThreadPoolExecutor(max_workers=os.cpu_count() - 1) as executor:
                        random_ws_js_rewards = list(executor.map(lambda c: JS_divergence_reward(c, test_item), random_ws_circuits))
                    result["avg_random_warmstart_js_divergence"] = float(np.mean(random_ws_js_rewards))
                except Exception as e:
                    print(f"Error computing warmstart JS divergence for circuit {j}: {e}")
                    
            except Exception as e:
                print(f"Error generating random warmstart circuits for circuit {j}: {e}")
                
        except Exception as e:
            print(f"Error processing warmstart circuit {j}: {e}")
        
        return ground_truth_index, result

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
            # Skip already processed circuits if the entry does not contain Nones
            if str(circuit["sample_index"]) in rewards and all(value is not None for value in rewards[str(circuit["sample_index"])].values()):
                print(f"Skipping circuit {j} (index {circuit['sample_index']}) as it is already processed.")
                continue
            ground_truth_index, result = self.process_circuit((j, circuit))
            rewards[str(ground_truth_index)] = result
            
            # Save results after each circuit
            with open("evaluation_results.json", "w") as f:
                json.dump(rewards, f, indent=4)
            
        
