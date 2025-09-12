OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[4];
cx q[2], q[4];

// Layer 2
rx(0.5) q[0];
rx(0.7) q[1];
rx(0.3) q[2];
rx(0.9) q[3];
rz(0.1) q[4];
rz(0.2) q[5];
rz(0.4) q[6];
cx q[3], q[4];
cx q[4], q[5];

// Layer 3
h q[3];
cx q[0], q[3];
cx q[1], q[5];
cx q[2], q[5];
h q[4];

// Layer 4
ry(0.6) q[0];
ry(0.8) q[1];
ry(0.9) q[2];
ry(0.2) q[3];
ry(0.3) q[4];
ry(0.4) q[5];
ry(0.1) q[6];
cx q[3], q[6];
cx q[5], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];