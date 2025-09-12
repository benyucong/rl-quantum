OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialize all qubits to |+> state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Apply controlled rotations to encode the connectivity of the graph
cx q[0], q[2]; // 0 -> 2
cx q[1], q[2]; // 1 -> 2
cx q[2], q[3]; // 2 -> 3
cx q[4], q[5]; // 4 -> 5
cx q[4], q[6]; // 4 -> 6
cx q[5], q[7]; // 5 -> 7

// Measure qubits to extract connectivity information
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];