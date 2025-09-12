OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0]; // Start with q[0] in superposition
h q[1]; // Prepare qubit for the first node
h q[2]; // Prepare qubit for the second node
h q[3]; // Prepare qubit for the third node
h q[4]; // Prepare qubit for the fourth node
h q[5]; // Prepare qubit for the sink node

// Encoding edges with controlled rotations
rx(1.0) q[0]; // Transition from source to node 3
cx q[0], q[3];
rz(1.0) q[3];

rx(1.0) q[0]; // Transition from source to sink
cx q[0], q[5];
rz(1.0) q[5];

rx(1.0) q[1]; // Transition from node 1 to node 2
cx q[1], q[2];
rz(1.0) q[2];

rx(1.0) q[1]; // Transition from node 1 to node 4
cx q[1], q[4];
rz(1.0) q[4];

rx(1.0) q[3]; // Transition back to node 1
cx q[3], q[1];
rz(1.0) q[1];

rx(1.0) q[3]; // Transition to sink from node 3
cx q[3], q[5];
rz(1.0) q[5];

rx(1.0) q[4]; // Transition back to node 1
cx q[4], q[1];
rz(1.0) q[1];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];
rz(0.5) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];