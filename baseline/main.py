from llm_backend import call_llm, call_llm_self_debug
import argparse
from datasets import load_dataset
from utils import load_prompt, extract_qasm_block, save_qasm_code, load_self_debug_prompt
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

    parser.add_argument("--self_debug", action="store_true", help="Enable self-debugging")

    args = parser.parse_args()
    
    dataset = load_dataset(args.dataset, split="test")
    dataset_size = len(dataset)
    
    
    results = []
    
    for idx, sample in enumerate(dataset):
        
        print(f"\n--- Processing Sample {idx} ---")
        prompt = load_prompt(sample)
        start_time = time.time()
        response = call_llm(prompt, model="gpt")
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


        # if args.self_debug:
        #     print("SELF_DEBUGGING.....")
        #     debug_temp_file = "temp_debug_results.json"
        #     with open(debug_temp_file, "w") as f:
        #         json.dump([sample_result], f, indent=2)

        #     error_message = process_circuits_debug(debug_temp_file)

        #     if len(error_message) > 0:
        #         self_debug_prompt = load_self_debug_prompt(prompt, response , error_message)
        #         print("Self-debugging prompt:\n", self_debug_prompt)
        #         self_debug_response = call_llm_self_debug(self_debug_prompt)

        #         try:
        #             self_debug_qasm_code = ""
        #             self_debug_qasm_code = extract_qasm_block(self_debug_response)
        #             save_qasm_code(self_debug_qasm_code, f"sample_{idx}.qasm")
        #         except ValueError as e:
        #             print(f"Warning: Sample {idx} skipped – {e}")
                   
        #         sample_result["generated_circuit"] = self_debug_qasm_code

        #         os.remove(debug_temp_file)
        #         print(f"Cleaned up temp file: {debug_temp_file}")

        results.append(sample_result)
        print(f"Processed sample {idx} (generation took {generation_time:.2f} seconds)")
    
    output_file_name = f"results_gpt-4o.json"
    
    with open(output_file_name, "w") as f:
        json.dump(results, f, indent=2)

if __name__ == "__main__":
    main()