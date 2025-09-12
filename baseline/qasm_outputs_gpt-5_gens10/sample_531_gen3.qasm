OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0]; // source node 0 initialization
h q[1]; // source node 1 initialization
h q[2]; // intermediate node 2 initialization
h q[3]; // sink node 3 initialization

// Apply a sequence of controlled operations to represent edge capacities
// Encoding the edges: (0->2, capacity 5), (0->3, capacity 1)
//                      (1->2, capacity 1), (1->3, capacity 6)

// 0 to 2 with capacity 5
cx q[0], q[2]; // Path from 0 to 2
cz q[2], q[2]; // Represents capacity as zero point

// 0 to 3 with capacity 1
cx q[0], q[3]; // Path from 0 to 3

// 1 to 2 with capacity 1
cx q[1], q[2]; // Path from 1 to 2

// 1 to 3 with capacity 6
cx q[1], q[3]; // Path from 1 to 3

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];