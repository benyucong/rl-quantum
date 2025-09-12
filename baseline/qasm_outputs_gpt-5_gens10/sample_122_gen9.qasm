OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Initialization layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1 (setting up connections according to graph edges)
cx q[0], q[2]; // from node 0 to node 2 (capacity 3)
cx q[1], q[5]; // from node 1 to node 5 (capacity 3)
cx q[2], q[5]; // from node 2 to node 5 (capacity 4)
cx q[4], q[1]; // from node 4 to node 1 (capacity 4)
cx q[4], q[3]; // from node 4 to node 3 (capacity 3)
cx q[4], q[5]; // from node 4 to node 5 (capacity 6)

// Layer 2 (applying Rz rotations based on capacities)
rz(0.1234) q[2]; // rotation for the edge 0->2
rz(0.5678) q[5]; // rotation for the edge 1->5
rz(0.9101) q[5]; // rotation for the edge 2->5
rz(1.2345) q[1]; // rotation for the edge 4->1
rz(1.6789) q[3]; // rotation for the edge 4->3
rz(2.3456) q[5]; // rotation for the edge 4->5

// Layer 3 (final measurements)
h q[5];
h q[0];
h q[1];
h q[2];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];