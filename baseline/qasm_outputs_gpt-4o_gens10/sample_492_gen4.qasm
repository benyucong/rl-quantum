OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Initialize qubits
h q[0]; // Source node
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4
h q[5]; // Node 5
h q[6]; // Node 6
h q[7]; // Node 7
h q[8]; // Sink node

// Apply controlled operations based on the graph edges
// Source to Node 6
cx q[0], q[6]; // Capacity 2
cx q[0], q[8]; // Capacity 1

// Node 1 to Node 3 and Node 4
cx q[1], q[3]; // Capacity 2
cx q[1], q[4]; // Capacity 1

// Node 2 to Node 5
cx q[2], q[5]; // Capacity 1

// Node 3 to Node 6
cx q[3], q[6]; // Capacity 1

// Node 4 to Node 5
cx q[4], q[5]; // Capacity 1

// Node 6 to Node 1 and Node 4
cx q[6], q[1]; // Capacity 2
cx q[6], q[4]; // Capacity 2

// Node 7 to Node 4, Node 6, and Sink
cx q[7], q[4]; // Capacity 1
cx q[7], q[6]; // Capacity 1
cx q[7], q[8]; // Capacity 1

// Measure the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];