OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Initialization layer
h q[0];   // Source node
h q[1];   // Intermediate node
h q[2];   // Intermediate node
h q[3];   // Intermediate node
h q[4];   // Intermediate node
h q[5];   // Sink node

// Layer 1 (Applying controlled operations based on edges)
cx q[0], q[2]; // Edge: 0 -> 2 (capacity 3)
cx q[1], q[5]; // Edge: 1 -> 5 (capacity 3)
cx q[2], q[5]; // Edge: 2 -> 5 (capacity 4)
cx q[4], q[1]; // Edge: 4 -> 1 (capacity 4)
cx q[4], q[3]; // Edge: 4 -> 3 (capacity 3)
cx q[4], q[5]; // Edge: 4 -> 5 (capacity 6)

// Layer 2 (Adding phase shifts for flow constraint handling)
rz(0.5) q[5]; // Effect of flow from sink
rz(0.3) q[2]; // Adjusting node 2
rz(0.3) q[1]; // Adjusting node 1
rz(0.5) q[3]; // Adjusting node 3
rz(0.5) q[4]; // Adjusting node 4

// Layer 3 (Final layer to disentangle and measure)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[2], q[5];
cx q[1], q[5];
cx q[4], q[1];
cx q[4], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];