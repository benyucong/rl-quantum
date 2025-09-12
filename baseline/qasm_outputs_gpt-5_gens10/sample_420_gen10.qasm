OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Apply Hadamard gates to prepare the state
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled-NOT gates based on the edges of the graph
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[3]; // edge (0, 3)
cx q[2], q[1]; // edge (2, 1)
cx q[2], q[3]; // edge (2, 3)
cx q[1], q[3]; // edge (1, 3)

// Measure to obtain the color assignments
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];

// Resetting the measurement bits to classical bits