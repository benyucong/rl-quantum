OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2
cx q[0], q[1];
cx q[2], q[3];

// Layer 3
rz(1.0472) q[1]; // Rotation for connecting node 0 and node 1
rz(1.0472) q[3]; // Rotation for connecting node 2 and node 3
cx q[1], q[3]; // Connect component from node 1 to node 3
cx q[0], q[2]; // Connect node 0 to node 2

// Layer 4
h q[0];
h q[1];
h q[2];
h q[3]; 

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];