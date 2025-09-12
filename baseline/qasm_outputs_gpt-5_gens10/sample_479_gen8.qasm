OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial state preparation
h q[0]; // Node 0
h q[1]; // Node 1
h q[2]; // Node 2

// Create separable states for each node to prepare for coloring
cx q[0], q[1]; // Edge (0, 1)
rz(-0.6143) q[1]; // Phase rotation for qubit 1
cx q[0], q[1]; // Control qubit again

cx q[2], q[0]; // Edge (0, 2)
rz(-0.6143) q[0]; // Phase rotation for qubit 0
cx q[2], q[0]; // Control qubit again

cx q[2], q[1]; // Edge (1, 2)
rz(-0.6143) q[1]; // Phase rotation for qubit 1
cx q[2], q[1]; // Control qubit again

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];