OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[2];
rz(1.5708) q[2];
cx q[0], q[2];
cx q[1], q[3];
rz(1.5708) q[3];
cx q[1], q[3];
cx q[2], q[1];
rz(1.5708) q[1];
cx q[2], q[1];
cx q[2], q[3];
rz(1.5708) q[3];
cx q[2], q[3];

// Layer 2
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
cx q[0], q[2];
rz(1.1781) q[2];
cx q[0], q[2];
cx q[1], q[3];
rz(1.1781) q[3];
cx q[1], q[3];
cx q[2], q[1];
rz(1.1781) q[1];
cx q[2], q[1];
cx q[2], q[3];
rz(1.1781) q[3];
cx q[2], q[3];

// Layer 3
ry(0.3927) q[0];
ry(0.3927) q[1];
ry(0.3927) q[2];
ry(0.3927) q[3];
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
cx q[2], q[1];
rz(0.7854) q[1];
cx q[2], q[1];
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];