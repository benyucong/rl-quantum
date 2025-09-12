OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[2]; // Connect source to intermediate
rz(-0.5) q[2]; // Adjust phase based on capacity
cx q[2], q[1]; // Connect intermediate to sink
rz(-0.5) q[1]; // Adjust phase based on capacity
cx q[2], q[4]; // Connect intermediate to another node
rz(-0.5) q[4]; // Adjust phase based on capacity
cx q[3], q[2]; // Connect another node to intermediate
rz(-0.5) q[2]; // Adjust phase based on capacity
cx q[3], q[5]; // Connect another node to sink
rz(-0.5) q[5]; // Adjust phase based on capacity

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[2]; // Reconnect source to intermediate
rz(0.5) q[2]; // Adjust phase based on capacity
cx q[2], q[1]; // Reconnect intermediate to sink
rz(0.5) q[1]; // Adjust phase based on capacity
cx q[2], q[4]; // Reconnect intermediate to another node
rz(0.5) q[4]; // Adjust phase based on capacity
cx q[3], q[2]; // Reconnect another node to intermediate
rz(0.5) q[2]; // Adjust phase based on capacity
cx q[3], q[5]; // Reconnect another node to sink
rz(0.5) q[5]; // Adjust phase based on capacity

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];