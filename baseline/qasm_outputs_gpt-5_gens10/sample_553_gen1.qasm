OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Apply controlled operations based on the graph edges
// Encodes the connections: (0->2), (1->2), (3->4), (4->5)

cx q[0], q[2]; // Connect 0 to 2
cx q[1], q[2]; // Connect 1 to 2
cx q[3], q[4]; // Connect 3 to 4
cx q[4], q[5]; // Connect 4 to 5

// Apply additional gates to prepare the measurement basis
h q[2];
h q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];