OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Encoding maximum flow constraints
cx q[0], q[6]; // Edge 0-6
cx q[0], q[8]; // Edge 0-8
cx q[1], q[3]; // Edge 1-3
cx q[1], q[4]; // Edge 1-4
cx q[2], q[5]; // Edge 2-5
cx q[3], q[6]; // Edge 3-6
cx q[4], q[5]; // Edge 4-5
cx q[6], q[1]; // Edge 6-1
cx q[6], q[4]; // Edge 6-4
cx q[7], q[4]; // Edge 7-4
cx q[7], q[6]; // Edge 7-6
cx q[7], q[8]; // Edge 7-8

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
c[12] = measure q[12];
c[13] = measure q[13];
c[14] = measure q[14];