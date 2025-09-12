OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize nodes with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Apply controlled operations based on graph edges
// Edges: (0, 2), (0, 3), (1, 2), (1, 3), (2, 3), (4, 5)
cx q[0], q[2]; // edge 0-2
cx q[0], q[3]; // edge 0-3
cx q[1], q[2]; // edge 1-2
cx q[1], q[3]; // edge 1-3
cx q[2], q[3]; // edge 2-3
cx q[4], q[5]; // edge 4-5

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];