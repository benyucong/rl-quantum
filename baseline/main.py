from llm_backend import call_llm, call_llm_self_debug
import argparse
from datasets import load_dataset
from utils import load_prompt, extract_qasm_block, save_qasm_code
import time
import json
import os

def main():
    parser = argparse.ArgumentParser(
        description="Generate quantum circuit outputs for dataset samples"
    )

    parser.add_argument(
        "--dataset", type=str, required=True, help="Dataset to use for generation"
    )
    parser.add_argument(
        "--model", type=str, required=True, help="Model to use for generation"
    )
    parser.add_argument(
        "--num_generations", type=int, default=1, help="Number of generations per sample"
    )

    args = parser.parse_args()
    
    dataset = load_dataset(args.dataset, split="test")
    dataset_size = len(dataset)
    
    results = []

    # Create a folder name based on model + gens
    qasm_folder = f"qasm_outputs_{args.model}_gens{args.num_generations}"
    
    for idx, sample in enumerate(dataset):
        
        print(f"\n--- Processing Sample {idx} ---")
        prompt = load_prompt(sample)

        generation_results = {}
        total_time = 0.0

        for gen_idx in range(args.num_generations):
            print(f"  -> Generation {gen_idx+1}/{args.num_generations}")
            start_time = time.time()
            response = call_llm(prompt, model=args.model)
            generation_time = time.time() - start_time
            total_time += generation_time

            print("LLM Response:\n", response)

            qasm_code = ""
            try:
                qasm_code = extract_qasm_block(response)
                save_qasm_code(qasm_code, f"sample_{idx}_gen{gen_idx+1}.qasm", folder=qasm_folder)
            except ValueError as e:
                print(f"Warning: Sample {idx}, Generation {gen_idx+1} skipped - {e}")

            generation_results[f"generated_circuit_{gen_idx+1}"] = qasm_code
        
        sample_result = {
            "signature": sample.get("signature"),
            "model_name": args.model,
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
            **generation_results,
            "avg_generation_time_seconds": total_time / args.num_generations,
        }

        results.append(sample_result)
        print(f"Processed sample {idx} ({args.num_generations} generations, avg {total_time/args.num_generations:.2f}s)")
    
    output_file_name = f"results_{args.model}_gens{args.num_generations}.json"
    
    with open(output_file_name, "w") as f:
        json.dump(results, f, indent=2)

if __name__ == "__main__":
    main()
