import os
import subprocess
import uuid
from typing import Tuple, Dict, Any, Optional, Union, List
from .base import BaseTool, register_tool

# Default paths for the Singularity container and script, you should set it by yourself
DEFAULT_WORKDIR = "/scratch/work/yuc10/cuda-quantum"
DEFAULT_IMAGE_PATH = os.path.join(DEFAULT_WORKDIR, "cuda-quantum.sif")
DEFAULT_SCRIPT_PATH = os.path.join(DEFAULT_WORKDIR, "program.py")

@register_tool
class CudaQuantumTool(BaseTool):
    """
    A tool to execute CUDA Quantum workloads using a Singularity container.
    """
    tool_type: str = "cuda_quantum"

    def __init__(
        self,
        workdir: str = DEFAULT_WORKDIR,
        image_path: str = DEFAULT_IMAGE_PATH,
        script_path: str = DEFAULT_SCRIPT_PATH,
        timeout: int = 14400,  # 4 hours in seconds
    ):
        """
        Initialize the CUDA Quantum tool.

        Args:
            workdir: The working directory to bind to the container.
            image_path: Path to the Singularity container image.
            script_path: Path to the Python script to execute inside the container.
            timeout: Maximum time allowed for the execution (in seconds).
        """
        self.workdir = workdir
        self.image_path = image_path
        self.script_path = script_path
        self.timeout = timeout

    def parse_action(self, action: str) -> str:
        """
        Parse the action to extract any additional parameters for the script.

        Args:
            action: The action string provided to the tool.

        Returns:
            Parsed parameters for the script.
        """
        # For simplicity, assume the action contains additional arguments for the script
        return action.strip()

    def conduct_action(
        self,
        trajectory_id: str,
        action: str,
        extra_field: Dict[str, Any],
    ) -> Tuple[str, bool, bool]:
        """
        Execute the CUDA Quantum workload inside the Singularity container.

        Args:
            trajectory_id: The unique ID for the trajectory.
            action: The action string provided to the tool.
            extra_field: Additional metadata for the action.

        Returns:
            A tuple containing (observation, done, valid).
        """
        # Parse additional parameters from the action
        additional_args = self.parse_action(action)

        # Generate a unique temporary directory for this execution
        temp_dir = os.path.join(self.workdir, "tmp", str(uuid.uuid4()))
        os.makedirs(temp_dir, exist_ok=True)

        # Construct the Singularity command
        command = [
            "singularity", "exec", "--nv",
            "--bind", f"{self.workdir}:{self.workdir}",
            self.image_path,
            "bash", "-c",
            f"""
            python3 {self.script_path} {additional_args}
            """
        ]

        # Execute the command
        try:
            result = subprocess.run(
                command,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                cwd=temp_dir,
                timeout=self.timeout,
                text=True,
            )
            observation = f"=== STDOUT ===\n{result.stdout}\n=== STDERR ===\n{result.stderr}"
            done = True
            valid = result.returncode == 0
        except subprocess.TimeoutExpired:
            observation = "Error: Execution timed out."
            done = True
            valid = False
        except Exception as e:
            observation = f"Error: {str(e)}"
            done = True
            valid = False
        finally:
            # Clean up the temporary directory
            try:
                os.rmdir(temp_dir)
            except OSError:
                pass

        return observation, done, valid