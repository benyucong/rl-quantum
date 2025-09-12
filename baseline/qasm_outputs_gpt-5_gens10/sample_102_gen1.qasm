OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Prepare the initial state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Initialize the capacities using RX rotations
rx(0.8741) q[0]; // node 0
rx(1.0298) q[1]; // node 1
rx(1.1084) q[2]; // node 2
rx(0.6758) q[3]; // node 3
rx(1.1543) q[4]; // node 4
rx(1.4361) q[5]; // node 5

// Implementing the edges and flow constraints
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];

cx q[2], q[3];
cx q[2], q[5];

cx q[3], q[1];

cx q[3], q[2];
cx q[3], q[4];

// Layer 2: Post-processing to measure the flow
rz(-0.2345) q[0];
rz(0.1253) q[1];
rz(-0.5123) q[2];
rz(0.8421) q[3];
rz(0.1345) q[4];
rz(-0.6752) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];