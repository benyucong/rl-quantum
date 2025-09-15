from qiskit_optimization.algorithms import WarmStartQAOAOptimizer
from qiskit_optimization.problems import QuadraticProgram
from qiskit_optimization.converters import QuadraticProgramToQubo
from qiskit_optimization.optimizers import COBYLA
from qiskit_optimization.algorithms import GurobiOptimizer
from qiskit_optimization import QuadraticProgram
from qiskit.quantum_info import SparsePauliOp

from qiskit_optimization.minimum_eigensolvers import QAOA
from qiskit.primitives import Sampler

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)

def get_warmstart_qaoa_circuit(problem: QuadraticProgram, p=1):
    """
    Generate a warm-started QAOA circuit for a given Qiskit Optimization problem.
    Returns the circuit (not optimized, just warm-started).
    """
    optimizer = COBYLA(maxiter=0)
    sampler = Sampler()
    qaoa = QAOA(sampler=sampler, optimizer=optimizer, reps=p)
    ws_qaoa = WarmStartQAOAOptimizer(
        pre_solver=GurobiOptimizer(),
        relax_for_pre_solver=True,
        qaoa=qaoa,
        epsilon=0.0
    )
    qp2qubo = QuadraticProgramToQubo()
    qubo = qp2qubo.convert(problem)
    result = ws_qaoa.solve(qubo)
    qaoa_circuit = ws_qaoa._qaoa.ansatz
    return qaoa_circuit


def hamiltonian_to_quadratic_program(hamiltonian: SparsePauliOp):
    n = hamiltonian.num_qubits
    qp = QuadraticProgram()
    for i in range(n):
        qp.binary_var(f'x{i}')
    linear = {f'x{i}': 0.0 for i in range(n)}
    quadratic = {}
    constant = 0.0

    for pauli_str, coeff in zip(hamiltonian.paulis.to_labels(), hamiltonian.coeffs):
        coeff = float(coeff)
        z_indices = [i for i, p in enumerate(pauli_str[::-1]) if p == 'Z']
        if len(z_indices) == 0:
            constant += coeff
        elif len(z_indices) == 1:
            i = z_indices[0]
            # Z_i = 1 - 2x_i
            constant += coeff * 1
            linear[f'x{i}'] += -2 * coeff
        elif len(z_indices) == 2:
            i, j = z_indices
            # Z_i Z_j = 1 - 2x_i - 2x_j + 4x_i x_j
            constant += coeff * 1
            linear[f'x{i}'] += -2 * coeff
            linear[f'x{j}'] += -2 * coeff
            quadratic[(f'x{i}', f'x{j}')] = quadratic.get((f'x{i}', f'x{j}'), 0.0) + 4 * coeff
        else:
            # More than 2 Zs or contains X/Y: skip (not QUBO)
            continue

    qp.minimize(constant=constant, linear=linear, quadratic=quadratic)
    return qp