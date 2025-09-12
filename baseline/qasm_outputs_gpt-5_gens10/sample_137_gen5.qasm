OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1
h q[0];
h q[1];
h q[2];
cx q[0], q[2]; // capacity 6
cx q[1], q[3]; // capacity 1
cx q[1], q[4]; // capacity 4
cx q[2], q[4]; // capacity 4
cx q[3], q[2]; // capacity 3

// Layer 2
h q[0];
h q[2];
h q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[2];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];