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

cx q[0], q[5]; // Connect source to sink
rz(-0.5) q[5]; // Apply rotation based on edge capacity
cx q[1], q[3]; // Connect node 1 to node 3
rz(-0.3) q[3]; // Apply rotation based on edge capacity
cx q[2], q[4]; // Connect node 2 to node 4
rz(-0.4) q[4]; // Apply rotation based on edge capacity

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[3], q[2]; // Connect node 3 to node 2
rz(-0.2) q[2]; // Apply rotation based on edge capacity
cx q[3], q[5]; // Connect node 3 to sink
rz(-0.1) q[5]; // Apply rotation based on edge capacity
cx q[4], q[3]; // Connect node 4 to node 3
rz(-0.3) q[3]; // Apply rotation based on edge capacity

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];