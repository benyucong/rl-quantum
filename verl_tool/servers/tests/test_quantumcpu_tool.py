#!/usr/bin/env python
import json
import requests
import fire
import logging
import sys
import os

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

def test_qasm(
    url: str = None,
    trajectory_id: str = "test-qasm-001",
):
    """Test qasm code execution"""
    
    print("--- Testing 1 ---")
    action = """<qasm>OPENQASM 3.0;\ninclude "stdgates.inc";\nqubit[2] q;\nh q[0];\ncx q[0], q[1];</qasm> ..."""
    print(_send_test_request(url, trajectory_id, action, "Python"))
    
    # print("--- Testing 2 ---")
    # action = """<qasm>import sys\n\nprint('Hello from Python!')\nprint(f'Arguments: {sys.argv[1:]}')\nfor i in range(5):\n    print(f'Number {i}')</qasm> ..."""
    # print(_send_test_request(url, trajectory_id, action, "Python"))
    
    # print("--- Testing 3 ---")
    # action = """```python\nprint('Hello from Python!')\n``` ..."""
    # print(_send_test_request(url, trajectory_id, action, "Python"))
    
    # print("--- Testing 4 ---")
    # action = """```<qasm>\nprint('Hello from Python!')</qasm> ... <qasm>print('Hello again!')</qasm>``` ..."""
    # print(_send_test_request(url, trajectory_id, action, "Python"))
    
    # print("--- Testing 5 ---")
    # action = """```<qasm>import time\ntime.sleep(30)\nprint('Hello from Python!')</qasm> ... <qasm>print('Hello again!')</qasm>``` ..."""
    # print(_send_test_request(url, trajectory_id, action, "Python"))
    
    print("--- Testing 6 ---") # syntax error
    action = """```<qasm>OPENQASM 3.0;\ninclude "stdgates.inc";\nqudit[2] q;\nh q[0];\ncx q[0], q[1];</qasm> ..."""
    print(_send_test_request(url, trajectory_id, action, "Python"))

    # print("--- Testing 7 ---") # memory limit
    # action = """```<qasm>\nimport numpy as np\nx = np.random.rand(5000, 5000)\nsize_of_x_in_bytes = x.nbytes\nprint(f'Memory test completed after allocating a {len(x)}x{len(x[0])} array, which is {size_of_x_in_bytes / (1024 * 1024):.2f} MB.')</qasm> ...```"""
    # print(_send_test_request(url, trajectory_id, action, "Python Memory Test"))

    # print("--- Testing 7 ---") # memory limit
    # action = """```<qasm>\nimport numpy as np\nx = np.random.rand(40000, 40000)\nsize_of_x_in_bytes = x.nbytes\nprint(f'Memory test completed after allocating a {len(x)}x{len(x[0])} array, which is {size_of_x_in_bytes / (1024 * 1024):.2f} MB.')</qasm> ...```"""
    # print(_send_test_request(url, trajectory_id, action, "Python Memory Test"))
    return True
    
    
def _send_test_request(url, trajectory_id, action, test_name):
    """Helper function to send test requests and process responses"""
    logger.info(f"Testing {test_name} code execution...")
    
    # Use server API
    payload = {
        "trajectory_ids": [trajectory_id],
        "actions": [action],
        "extra_fields": [{}]
    }
    
    try:
        response = requests.post(url, json=payload)
        response.raise_for_status()  # Raise exception for error status codes
        
        result = response.json()
        logger.info(f"Response received for {test_name} test")
        
        # Print observation
        if "observations" in result and len(result["observations"]) > 0:
            observation = result["observations"][0]
            logger.info(f"\n--- {test_name} Result ---\n{observation}\n")
        else:
            logger.error(f"No observation found in response for {test_name}")
        
        return result
    except requests.exceptions.RequestException as e:
        logger.error(f"Request error: {str(e)}")
        return {"error": str(e)}
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}")
        return {"error": str(e)}

def main():
    """Main entry point for the test script
    Run with:
        python -m verl_tool.servers.tests.test_quantumcpu_tool qasm --url=http://localhost:5000/get_observation
    """
    fire.Fire({
        "qasm": test_qasm,
    })

if __name__ == "__main__":
    main()
