OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits to |+> state
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled rotations based on the edges of the graph
// Edge (0, 2)
cx q[0], q[2];
rz(1.0472) q[2]; // Rz rotation for color assignment
cx q[0], q[2];

// Edge (0, 3)
cx q[0], q[3];
rz(1.0472) q[3]; // Rz rotation for color assignment
cx q[0], q[3];

// Edge (2, 1)
cx q[2], q[1];
rz(1.0472) q[1]; // Rz rotation for color assignment
cx q[2], q[1];

// Edge (2, 3)
cx q[2], q[3];
rz(1.0472) q[3]; // Rz rotation for color assignment
cx q[2], q[3];

// Edge (1, 3)
cx q[1], q[3];
rz(1.0472) q[3]; // Rz rotation for color assignment
cx q[1], q[3];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];