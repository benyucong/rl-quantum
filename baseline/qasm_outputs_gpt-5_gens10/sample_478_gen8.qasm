OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled rotations based on min-cut problem
cx q[0], q[1]; // Control from node 0 to node 1 (edge: capacity 1)
rz(0.1227) q[1]; // Rotate based on edge capacity to node 5
cx q[1], q[5]; // Control from node 1 to sink node (edge: capacity 4)

cx q[0], q[5]; // Direct connection from node 0 to sink node
rz(0.1227) q[5]; // Rotate for minimum cut from node 0 to sink

cx q[2], q[4]; // Control from node 2 to node 4 (edge: capacity 5)
rz(0.1380) q[4]; // Rotate for lower edge capacity to node 5
cx q[4], q[5]; // Control from node 4 to sink node (edge: capacity 1)

cx q[3], q[4]; // Control from node 3 to node 4 (edge: capacity 2)
rz(0.1380) q[4]; // Rotate for interacting edges
cx q[4], q[3]; // Re-connect node 4 back to 3 (helping minimize cut)

// Layer 3: Final measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];