OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1
rx(1.2) q[0];
ry(0.5) q[1];
rz(0.25) q[2];
rx(2.1) q[3];
ry(1.5) q[4];
rz(0.75) q[5];

// Connect edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[4];
cx q[4], q[5];

// Layer 2
rx(0.8) q[0];
ry(1.1) q[1];
rz(0.55) q[2];
rx(1.9) q[3];
ry(0.9) q[4];
rz(0.65) q[5];

// Connect edges again
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[5];
cx q[2], q[5];
cx q[3], q[4];
cx q[4], q[5];

// Layer 3
rx(0.6) q[0];
ry(1.3) q[1];
rz(0.35) q[2];
rx(1.4) q[3];
ry(0.7) q[4];
rz(0.45) q[5];

// Measure
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];