OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initializing qubits to represent different nodes in the graph
h q[0]; // Node 0
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4

// Applying controlled gates based on the edges in the graph
cx q[0], q[2]; // Edge (0, 2)
cx q[0], q[3]; // Edge (0, 3)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[2], q[3]; // Edge (2, 3)
cx q[4], q[5]; // Edge (4, 5)

// Measurement of the qubits to determine connected components
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];