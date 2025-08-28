# Copyright 2024 Bytedance Ltd. and/or its affiliates
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""
Preprocess the quantum qasm dataset to parquet format
"""
import fire
import os
import datasets
from pathlib import Path
import json

execution_prompt = """\
Answer the given quantum circuit design question. You must conduct reasoning about the problem and then provide the final QASM 3.0 code as the answer. 
During the thinking process, you can write test cases or validate your current solutions using a simulation tool. If you want to test any QASM code, write it inside ```qasm and ``` tags, followed by "```output". 
The code between "```qasm" and "```output" will then be executed, and the terminal output (standard output and standard error) will be provided to you. 
Each program between ```qasm and ``` tags is an independent program. You can test QASM codes as many times as you want. 
If you find no further code execution needed, you can then give your final solution in a markdown code block like this: ```qasm\nyour code here\n``` without appending anything. 
The final program will be evaluated against hidden test cases. If the final program passes all the test cases, you will get a reward. If the final program fails any of the test cases, you will get a penalty.
"""

naive_instruction = """\
Let's think step by step and generate the final QASM 3.0 code in a markdown code block like this: ```qasm\nyour code here\n```.
"""

naive_execution_prompt = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The Assistant can reason with the help of QASM code. If the Assistant wants to run any QASM code, it writes it inside ```qasm and ``` tags, and makes sure to follow it with "```output", meaning that it is requesting the code to be executed. Then the result of execution will be provided to the Assistant between "```output" and "```" for the QASM code block that it follows. The Assistant can test QASM codes as many times as it wants. If the Assistant finds no further code execution needed, it can then give the final solution in a markdown code block like this: ```qasm\nyour code here\n``` without appending anything.
"""

r1_naive_execution_prompt = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The reasoning process and answer are enclosed within <think> </think> and <answer> </answer> tags, respectively, i.e., <think> reasoning process here </think> <answer> answer here </answer>. If the Assistant wants to run any QASM code when thinking, it writes it inside "```qasm" and "```" tags, and makes sure to have "```output" after the QASM code block, meaning that it is requesting the code to be executed. Then the result of execution will be in the output markdown block.
"""

complex_execution_prompt = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The Assistant can reason with the help of QASM code. If the Assistant wants to run any QASM code, it writes it inside "```qasm" and "```" tags, and makes sure to have "```output" after the QASM code block, meaning that it is requesting the code to be executed. Then the result of execution will be in the output markdown block.

Quantum circuit design questions can ask for various forms of solutions:
- If the question has a specific graph or problem, you may use it to design the circuit.
- If the question has a function signature, you may use the signature to write the solution.
- Else you may write a program that reads the input from standard input and writes the output to standard output.

The Assistant can test QASM codes as many times as it wants. If the Assistant finds no further code execution needed, it can then give the final solution in a markdown code block like this: ```qasm\nyour code here\n``` without appending anything. 
"""

r1_complex_execution_prompt = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The reasoning process and answer are enclosed within <think> </think> and <answer> </answer> tags, respectively, i.e., <think> reasoning process here </think> <answer> answer here </answer>. If the Assistant wants to run any QASM code when thinking, it writes it inside "```qasm" and "```" tags, and makes sure to have "```output" after the QASM code block, meaning that it is requesting the code to be executed. Then the result of execution will be in the output markdown block.

Quantum circuit design questions can ask for various forms of solutions:
- If the question has a specific graph or problem, you may use it to design the circuit.
- If the question has a function signature, you may use the signature to write the solution.
- Else you may write a program that reads the input from standard input and writes the output to standard output.

The Assistant can test QASM codes as many times as it wants. If the Assistant finds no further code execution needed, it can then give the final solution in a markdown code block like this: ```qasm\nyour code here\n``` without appending anything. 
"""

coder_instruction = """\
Let's think step by step and generate the correct QASM 3.0 code for this quantum circuit design question. You should attempt multiple times before giving the final program.
In each attempt, you should:
- Test your program by reviewing the QASM syntax and logic, and fix any potential issues in the next attempt.
- Imagine a set of test cases or scenarios based on your understanding of the problem and the constraints.
- You then need to validate your program with these test cases. Since you are not able to run the program in a real quantum environment, you need to simulate the program execution and think aloud to describe how each qubit state evolves during the execution. Finally, see whether the program produces the expected output.
- If the program fails any of the test cases, you need to debug the program and fix the issues in the next attempt.
- If the program passes all the test cases, you can then give the final program in a markdown code block like this: ```qasm\nyour code here\n```.

You are also allowed to analyze the problem with any other domain-specific knowledge you have, like quantum mechanics, graph theory, or optimization, to help you solve the problem.

Now start thinking and generate the final program in a markdown code block like this: ```qasm\nyour code here\n```.
"""

naive_coder_instruction = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. 

Let's think step by step and generate the final QASM 3.0 code in a markdown code block like this: ```qasm\nyour code here\n```.
"""

r1_naive_coder_instruction = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The reasoning process and answer are enclosed within <think> </think> and <answer> </answer> tags, respectively, i.e., <think> reasoning process here </think> <answer> answer here </answer>.
"""

complex_coder_instruction = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. 

Quantum circuit design questions can ask for various forms of solutions:
- If the question has a specific graph or problem, you may use it to design the circuit.
- If the question has a function signature, you may use the signature to write the solution.
- Else you may write a program that reads the input from standard input and writes the output to standard output.

Let's think step by step and generate the final QASM 3.0 code in a markdown code block like this: ```qasm\nyour code
"""

r1_complex_coder_instruction = """\
A conversation between User and Assistant. The user asks a quantum circuit design question, and the Assistant solves it. The assistant first thinks about the reasoning process in the mind and then provides the user with the answer. The reasoning process and answer are enclosed within <think> </think> and <answer> </answer> tags, respectively, i.e., <think> reasoning process here </think> <answer> answer here </answer>.

Quantum circuit design questions can ask for various forms of solutions:
- If the question has a specific graph or problem, you may use it to design the circuit.
- If the question has a function signature, you may use the signature to write the solution.
- Else you may write a program that reads the input from standard input and writes the output to standard output.

Let's think step by step and generate the final QASM 3.0 code in a markdown code block like this: ```qasm\nyour code here\n```.
"""

linus_instruction = """\
You are a helpful quantum circuit design assistant. Provide a quantum circuit in valid QASM 3.0 code with optimal gate parameters so that the output state encodes the solution, ensuring that the measurement outcomes have a high probability of reflecting the correct answer."
"""

def main(
    dataset_path: str = 'Benyucong/graph-data-quantum-rl',
    local_dir: str = 'data/graph-data-quantum-rl',
    add_execution_prompt: bool = False,
    propmt_type='complex',
    add_r1: bool = False,
):
    local_dir = Path(local_dir)
    local_dir_post_fix = ""
    if add_execution_prompt:
        local_dir_post_fix = "-with-execution-prompt"
    if add_r1:
        local_dir_post_fix += "-r1"
    local_dir_post_fix += f"-{propmt_type}"
    local_dir = local_dir / (dataset_path.split('/')[-1] + local_dir_post_fix)
    local_dir.mkdir(parents=True, exist_ok=True)

    # 500 examples for testing
    # dataset = dataset.train_test_split(test_size=500, seed=42) 
    train_dataset = datasets.load_dataset(dataset_path, split='train')
    test_dataset = datasets.load_dataset(dataset_path, split='test')

    # add a row to each data item that represents a unique id
    def make_map_fn(split):

        def process_fn(example, idx):
            question_raw = example.pop('prompt')
            ground_truth = example.pop('circuit_with_params')
            cost_hamiltonian = example.pop('cost_hamiltonian')
            smallest_eigenvalue = json.loads(example.pop('exact_solution'))["smallest_eigenvalues"][0]
            largest_eigenvalue = json.loads(example.pop('exact_solution'))["largest_eigenvalues"]

            if propmt_type == 'complex':
                if add_r1:
                    system_instruction = r1_complex_execution_prompt if add_execution_prompt else r1_complex_coder_instruction
                else:
                    system_instruction = complex_execution_prompt if add_execution_prompt else complex_coder_instruction
            elif propmt_type == 'naive':
                if add_r1:
                    system_instruction = r1_naive_execution_prompt if add_execution_prompt else r1_naive_coder_instruction
                else:
                    system_instruction = naive_execution_prompt if add_execution_prompt else naive_coder_instruction
            elif propmt_type == 'linus':
                system_instruction = linus_instruction
            else:
                raise ValueError(f"Unknown propmt_type: {propmt_type}")
            
            data = {
                "data_source": dataset_path,
                "prompt": [
                    {
                        "role": "system",
                        "content": system_instruction.strip(' \n'),
                    },
                    {
                        "role": "user",
                        "content": question_raw,
                    }
                ],
                "ability": "code",
                "reward_model": {
                    "style": "rule",
                    "ground_truth": ground_truth,
                },
                "extra_info": {
                    'split': split,
                    'index': idx,
                    "cost_hamiltonian": cost_hamiltonian,
                    "smallest_eigenvalue": smallest_eigenvalue,
                    "largest_eigenvalue": largest_eigenvalue,
                    "inputs_outputs": None,
                }
            }
            return data

        return process_fn

    train_dataset = train_dataset.map(function=make_map_fn('train'), with_indices=True, remove_columns=train_dataset.column_names)
    test_dataset = test_dataset.map(function=make_map_fn('test'), with_indices=True, remove_columns=test_dataset.column_names)
    
    print(f"Loaded {len(train_dataset)} training samples")
    print(f"Loaded {len(test_dataset)} testing samples")
    print(f"Example of a training sample:")
    print(train_dataset[0])

    train_dataset.to_parquet(os.path.join(local_dir, 'train.parquet'))
    test_dataset.to_parquet(os.path.join(local_dir, 'test.parquet'))
    print(f"Saved to {len(train_dataset)} training samples to {local_dir}/train.parquet")
    print(f"Saved to {len(test_dataset)} testing samples to {local_dir}/test.parquet")

if __name__ == '__main__':
    fire.Fire(main)
    
"""
python examples/data_preprocess/quantum.py --dataset_path Benyucong/quantum-qasm --local_dir data/qasm --add_execution_prompt True --propmt_type complex
python examples/data_preprocess/quantum.py --dataset_path Benyucong/quantum-qasm --local_dir data/qasm --add_execution_prompt True --propmt_type naive
python examples/data_preprocess/quantum.py --dataset_path Benyucong/quantum-qasm --local_dir data/qasm --add_execution_prompt False --propmt_type complex
python examples/data_preprocess/quantum.py --dataset_path Benyucong/quantum-qasm --local_dir data/qasm --add_execution_prompt False --propmt_type naive
python examples/data_preprocess/quantum.py --dataset_path Benyucong/quantum-qasm --local_dir data/qasm --add_execution_prompt True --propmt_type linus
python examples/data_preprocess/quantum.py --local_dir data/rl-qasm --add_execution_prompt True --propmt_type linus
"""