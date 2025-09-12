OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initialize qubits
h q[0]; // Source node
h q[1]; // Intermediate node 1
h q[2]; // Intermediate node 2
h q[3]; // Intermediate node 3
h q[4]; // Intermediate node 4
h q[5]; // Sink node

// Apply controlled operations based on the graph edges
cx q[0], q[1]; // 0 -> 1
cx q[0], q[3]; // 0 -> 3
cx q[1], q[2]; // 1 -> 2
cx q[1], q[5]; // 1 -> 5
cx q[2], q[1]; // 2 -> 1
cx q[2], q[4]; // 2 -> 4
cx q[4], q[1]; // 4 -> 1
cx q[4], q[2]; // 4 -> 2

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
c[9] = measure q[9];