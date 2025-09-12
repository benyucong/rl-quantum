OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Applying controlled operations based on the graph edges
cx q[0], q[1]; // source->node1 with capacity 2
cx q[0], q[3]; // source->node3 with capacity 1
cx q[1], q[3]; // node1->node3 with capacity 3
cx q[1], q[4]; // node1->sink with capacity 2
cx q[2], q[1]; // node2->node1 with capacity 4
cx q[3], q[1]; // node3->node1 with capacity 1

// Layer 2: RZ rotations to optimize the qubit states
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.3) q[2];
rz(0.4) q[3];
rz(0.5) q[4];

// Layer 3: Apply entangling gates in reverse order
cx q[1], q[3]; // reverse operations
cx q[1], q[4]; // reverse operations
cx q[0], q[3]; // reverse operations
cx q[0], q[1]; // reverse operations
cx q[2], q[1]; // reverse operations

// Measuring the output to get the min_cut result
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];