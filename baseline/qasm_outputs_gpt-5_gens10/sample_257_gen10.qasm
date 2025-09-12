OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Encoding the K-Clique problem
cx q[0], q[1]; // Connect nodes 0 and 1
cx q[0], q[2]; // Connect nodes 0 and 2
cx q[1], q[2]; // Connect nodes 1 and 2
cx q[1], q[4]; // Connect nodes 1 and 4
cx q[2], q[3]; // Connect nodes 2 and 3
cx q[3], q[4]; // Connect nodes 3 and 4

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];