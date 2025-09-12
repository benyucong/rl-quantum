OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize qubits to |+> state
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled gates based on edges in the graph
cx q[0], q[1]; // Edge (0, 1)
cx q[0], q[3]; // Edge (0, 3)
cx q[1], q[4]; // Edge (1, 4)
cx q[2], q[3]; // Edge (2, 3)

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];