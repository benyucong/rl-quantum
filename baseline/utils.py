import os
import re

with open("Prompt/system.txt", "r") as f:
    SYSTEM_PROMPT = f.read().strip()

def extract_qasm_block(text: str) -> str:
    
    match = re.search(r"```qasm(.*?)```", text, re.DOTALL)
    if match:
        return match.group(1).strip()
    else:
        raise ValueError("No QASM block found in the input text.")

def save_qasm_code(code: str, filename: str, folder: str):
    
    os.makedirs(folder, exist_ok=True)
    path = os.path.join(folder, filename)
    with open(path, 'w') as f:
        f.write(code)
    print(f"QASM code saved to {path}")

def prompt_template(sample):
    
    n_qubits = sample.get("number_of_qubits")
    n_layers = sample.get("number_of_layers")
    graph = sample.get("graph")
    problem_type = sample.get("problem_type")
    attrs = sample.get("problem_specific_attributes")
    

    prompt = (
        f"Your task is to generate a quantum circuit in QASM 3.0 with "
        f"{n_qubits} qubits and {n_layers} layers with optimal parameters that solves the "
        f"{problem_type} {attrs} problem for the following graph: {graph}. "
        "Then ensure that the final answer is correct and in valid QASM 3.0 code. "
        "Only return the full QASM code enclosed within a ```qasm block, with no additional text."
    )
    return prompt


def load_prompt(sample, few_shot_path='Prompt/few_shot.txt'):

    # Load few-shot examples
    with open(few_shot_path, 'r') as f:
        few_shot_examples = f.read().strip()

    # Generate the user prompt from the sample
    user_prompt = prompt_template(sample)
    
    final_user_prompt = f"{few_shot_examples}\n\n{user_prompt}"

    return final_user_prompt

# def load_self_debug_prompt(previous_prompt, response, error_message):
#     print("Loading self-debug prompt...")
    
#     # debug_prompts = (
#     #     "The QASM code you generated contains an error. Please analyze and fix it.\n"
#     #     f"Error message: {error_message}\n\n"
#     #     "Follow these steps to debug:\n"
#     #     "1. Carefully review the QASM syntax in your generated code\n"
#     #     "2. Check that all qubit operations are within the declared qubit range\n"
#     #     "3. Verify all gates and operations are valid in QASM 3.0\n"
#     #     "4. Ensure proper initialization and measurement operations\n"
#     #     "5. Check that all parameters are properly defined\n\n"
#     #     "Return the corrected QASM code enclosed in a ```qasm block with no additional text."
#     # )
#     debug_prompts = (
#         "The QASM code you generated contains an error. Please analyze and fix it.\\"
#         f"Error message: {error_message}\\"
#         "Return the corrected QASM code enclosed in a ```qasm block with no additional text.\\"
#     )

#     message = [
#         {"role": "system", "content": SYSTEM_PROMPT},
#         {"role": "user", "content": previous_prompt},
#         {"role": "assistant", "content": response},
#         {"role": "user", "content": debug_prompts}
#     ]

#     return message


