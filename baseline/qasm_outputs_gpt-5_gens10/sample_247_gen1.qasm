OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
cx q[0], q[1];
cx q[1], q[2];

// Layer 2
rx(0.5) q[0];
rz(0.2) q[0];
rx(0.5) q[1];
rz(0.2) q[1];
cx q[0], q[2];
cx q[1], q[0];

// Layer 3
h q[0];
h q[1];
h q[2];
cx q[1], q[0];
rx(0.3) q[1];
rz(0.1) q[2];
cx q[1], q[2];

// Layer 4
rx(0.75) q[0];
rz(0.3) q[0];
rx(0.75) q[1];
rz(0.3) q[1];
h q[0];
h q[1];
h q[2];

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