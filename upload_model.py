from huggingface_hub import create_repo, upload_folder, login
import os

login(token=os.environ["HF_TOKEN"])

repo_id = "Benyucong/quantum_3b"   # change if you want a new name
create_repo(repo_id, repo_type="model", private=False, exist_ok=True)

upload_folder(
    folder_path="checkpoints/quantum/quantum-fsdp-agent-linuzj_quantum-circuit-qubo-3b-grpo-n16-b128-t1.0-lr1e-6debug/global_step_430/actor/huggingface",
    repo_id=repo_id,
    commit_message="update",
    delete_patterns="*.safetensors",  # delete all old .safetensors first
)
