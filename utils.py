import re
from qiskit.circuit import QuantumCircuit, Parameter
from qiskit.quantum_info import SparsePauliOp
import pennylane as qml

def construct_pennylane_hamiltonian(expression):
    # First, handle terms with tensor products (@)
    term_pattern_tensor = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*\(\s*([XYZ]\(\d+\)((?:\s*@\s*[XYZ]\(\d+\))*?))\s*\)"
    )

    # Pattern for single operators (without tensor products)
    term_pattern_single = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*([XYZ]\(\d+\))"
    )

    # Regex to extract individual operators and indices
    operator_pattern = re.compile(r"([XYZ])\((\d+)\)")

    # Parse the expression
    terms = []

    # Process tensor product terms
    for match in term_pattern_tensor.finditer(expression):
        coefficient = float(match.group(1))  # Convert to float
        operator_sequence = match.group(4)

        # Extract individual operators
        operators = [
            (m.group(1), int(m.group(2)))
            for m in operator_pattern.finditer(operator_sequence)
        ]

        terms.append({"coefficient": coefficient, "operators": operators})

    # Process single operator terms
    for match in term_pattern_single.finditer(expression):
        coefficient = float(match.group(1))
        operator = match.group(4)

        # Extract the individual operator
        op_match = operator_pattern.search(operator)
        if op_match:
            pauli, qubit = op_match.group(1), int(op_match.group(2))

            terms.append({"coefficient": coefficient, "operators": [(pauli, qubit)]})

    # Reconstruct the Hamiltonian
    coeffs = []
    observables = []
    for term in terms:
        coeffs.append(term["coefficient"])
        obs = None
        for pauli, qubit in term["operators"]:
            pauli_op = getattr(qml, f"Pauli{pauli}")
            if obs is None:
                obs = pauli_op(qubit)
            else:
                obs = obs @ pauli_op(qubit)
        observables.append(obs)

    return qml.ops.op_math.LinearCombination(coeffs, observables)


def construct_qiskit_hamiltonian(expression):
    """ "
    Construct a Qiskit Hamiltonian from a string expression encoding Pennylane Hamiltonian."
    """
    # First, handle terms with tensor products (@)
    term_pattern_tensor = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*\(\s*([XYZ]\(\d+\)((?:\s*@\s*[XYZ]\(\d+\))*?))\s*\)"
    )

    # Pattern for single operators (without tensor products)
    term_pattern_single = re.compile(
        r"([+-]?\d+(\.\d+)?([eE][+-]?\d+)?)\s*\*\s*([XYZ]\(\d+\))"
    )

    # Regex to extract individual operators and indices
    operator_pattern = re.compile(r"([XYZ])\((\d+)\)")

    # Parse the expression
    terms = []

    # Process tensor product terms
    for match in term_pattern_tensor.finditer(expression):
        coefficient = float(match.group(1))  # Convert to float
        operator_sequence = match.group(4)

        # Extract individual operators
        operators = [
            (m.group(1), int(m.group(2)))
            for m in operator_pattern.finditer(operator_sequence)
        ]

        terms.append({"coefficient": coefficient, "operators": operators})

    # Process single operator terms
    for match in term_pattern_single.finditer(expression):
        coefficient = float(match.group(1))
        operator = match.group(4)

        # Extract the individual operator
        op_match = operator_pattern.search(operator)
        if op_match:
            pauli, qubit = op_match.group(1), int(op_match.group(2))

            terms.append({"coefficient": coefficient, "operators": [(pauli, qubit)]})

    # Reconstruct the Hamiltonian using qiskit's SparsePauliOp
    paulis = []
    coeffs = []
    max_qubit = -1

    # Find the maximum qubit index
    for term in terms:
        for _, qubit in term["operators"]:
            max_qubit = max(max_qubit, qubit)

    for term in terms:
        # Initialize with identity (I) for all qubits
        pauli_str = "I" * (max_qubit + 1)

        # Replace Identity with appropriate Pauli operator at correct positions
        for pauli, qubit in term["operators"]:
            pauli_str = pauli_str[:qubit] + pauli + pauli_str[qubit + 1 :]

        # Reverse the string as qiskit expects the least significant qubit on the right
        # pauli_str = pauli_str[::-1]

        paulis.append(pauli_str)
        coeffs.append(term["coefficient"])

    return SparsePauliOp(paulis, coeffs)


def parametrize_qiskit_circuit(circuit):
    """
    Input: A qiskit.QuantumCircuit object with constant values inside parameterized gates
    Output: A parameterized qiskit.QuantumCircuit object with symbolic parameters and a map of constant values to shared parameters
    """
    param_circuit = QuantumCircuit(circuit.num_qubits, circuit.num_clbits)
    param_map = {}  # Maps constant values to shared parameters

    for inst in circuit.data:
        instruction, qargs, cargs = inst.operation, inst.qubits, inst.clbits
        new_params = []

        for param in instruction.params:
            if isinstance(param, (int, float)):  # Check if the param is a constant
                if param not in param_map:
                    param_map[param] = Parameter(f"θ_{len(param_map)}")
                new_params.append(param_map[param])
            else:
                new_params.append(param)  # Keep existing parameters

        param_circuit.append(instruction.__class__(*new_params), qargs, cargs)

    return param_circuit, param_map