from llm_backend import call_llm
import argparse
from datasets import load_dataset
from utils import load_prompt, extract_qasm_block, save_qasm_code
import time
import json

def main():
    parser = argparse.ArgumentParser(
        description="Generate quantum circuit outputs for dataset samples"
    )

    parser.add_argument(
        "--dataset", type=str, required=True, help="Dataset to use for generation"
    )
    
    args = parser.parse_args()
    
    dataset = load_dataset(args.dataset, split="test")
    dataset_size = len(dataset)
    
    
    results = []
    
    for idx, sample in enumerate(dataset):
        
        print(f"\n--- Processing Sample {idx} ---")
        prompt = load_prompt(sample)
        start_time = time.time()
        response = call_llm(prompt, model="deepseek")
        generation_time = time.time() - start_time
        print("LLM Response:\n", response)
        
        qasm_code = ""
        try:
            qasm_code = extract_qasm_block(response)
            save_qasm_code(qasm_code, f"sample_{idx}.qasm")
        except ValueError as e:
            print(f"Warning: Sample {idx} skipped – {e}")
        
        sample_result = {
            "signature": sample.get("signature"),
            "model_name": "deepseek",
            "sample_index": idx,
            "dataset_metrics": {
                "n_qubits": sample.get("number_of_qubits"),
                "n_layers": sample.get("number_of_layers"),
                "graph": sample.get("graph"),
                "optimization_type": sample.get("optimization_type"),
                "problem_type": sample.get("problem_type"),
                "problem_specific_attributes": sample.get(
                    "problem_specific_attributes"
                ),
                "optimal_circuit": sample.get("circuit_with_params"),
                "cost_hamiltonian": sample.get("cost_hamiltonian"),
                "solution": sample.get("solution"),
                "exact_solution": sample.get("exact_solution"),
            },
            "generated_circuit": qasm_code,
            "generation_time_seconds": generation_time,
        }

        results.append(sample_result)
        print(f"Processed sample {idx} (generation took {generation_time:.2f} seconds)")
    
    output_file_name = f"results_deepseek_all.json"
    
    with open(output_file_name, "w") as f:
        json.dump(results, f, indent=2)

if __name__ == "__main__":
    main()