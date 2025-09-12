OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of entangling gates based on the edges
cx q[0], q[1]; // edge (0, 1)
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[5]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[4]; // edge (1, 4)
cx q[4], q[3]; // edge (4, 3)

// Second layer of rotation gates
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];
rz(0.5) q[5];

// Third layer of entangling gates
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
cx q[1], q[4];
cx q[4], q[3];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];