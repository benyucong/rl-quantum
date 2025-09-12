OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1]; // Edge: 0 -> 1
cx q[0], q[3]; // Edge: 0 -> 3
cx q[1], q[2]; // Edge: 1 -> 2
cx q[1], q[3]; // Edge: 1 -> 3

// Layer 2
rx(1.2) q[0];
rx(1.4) q[1];
rx(1.0) q[2];
rx(1.6) q[3];
rz(0.5) q[0];
rz(0.3) q[1];
rz(0.7) q[2];
rz(0.2) q[3];

// Layer 3
cx q[2], q[1]; // Edge: 2 -> 1
cx q[2], q[3]; // Edge: 2 -> 3
cx q[1], q[3]; // Edge: 1 -> 3

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