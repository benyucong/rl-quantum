OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of entangling gates based on the edges
cx q[0], q[1]; // edge (0, 1)
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[4]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 4)
cx q[2], q[3]; // edge (2, 4)

// Second layer of rotations
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];