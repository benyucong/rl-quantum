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
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
cx q[2], q[4];
cx q[4], q[3];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
rx(3.1416) q[0];
rz(-0.5) q[1];
ry(0.2) q[2];
rz(0.5) q[3];
rx(-1.0) q[4];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];