from qiskit import QuantumCircuit
from qiskit.qasm import Qasm
from qiskit.converters import ast_to_dag, dag_to_circuit

def openqasm_to_qiskit(openqasm_str: str) -> QuantumCircuit:
    """
    Converts an OpenQASM string into a Qiskit QuantumCircuit.

    Args:
        openqasm_str (str): The OpenQASM string to be converted.

    Returns:
        QuantumCircuit: The corresponding Qiskit QuantumCircuit.
    """
    try:
        # Parse the OpenQASM string into an AST (Abstract Syntax Tree)
        qasm_ast = Qasm(data=openqasm_str).parse()
        
        # Convert the AST to a DAG (Directed Acyclic Graph)
        dag = ast_to_dag(qasm_ast)
        
        # Convert the DAG to a Qiskit QuantumCircuit
        circuit = dag_to_circuit(dag)
        
        return circuit
    except Exception as e:
        print(f"Error converting OpenQASM to Qiskit circuit: {e}")
        raise

