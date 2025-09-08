from huggingface_hub import create_repo, upload_folder, login
import os

login(token=os.environ["HF_TOKEN"])

repo_id = "Benyucong/rl_quantum_4b"   # change if you want a new name
create_repo(repo_id, repo_type="model", private=True, exist_ok=True)

upload_folder(
    folder_path="checkpoints/quantum/quantum-fsdp-agent-benyucong_sft_quantum_circuit_gen_4b-grpo-n16-b128-t0.7-lr1e-6debug/global_step_140/actor/huggingface",
    repo_id=repo_id,
    commit_message="update",
    delete_patterns="*.safetensors",  # delete all old .safetensors first
)
