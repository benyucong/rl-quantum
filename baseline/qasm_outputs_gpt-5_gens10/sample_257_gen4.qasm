OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1 - Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2 - Entangling based on the k-clique structure
cx q[0], q[1]; // Edge (0, 1)
cx q[0], q[2]; // Edge (0, 2)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[4]; // Edge (1, 4)
cx q[2], q[3]; // Edge (2, 3)
cx q[3], q[4]; // Edge (3, 4)

// Add parameterized rotations to optimize measurement outcomes
rz(1.2345) q[0];
rz(0.6543) q[1];
rz(0.7890) q[2];
rz(1.0987) q[3];
rz(0.3456) q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];