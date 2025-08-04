OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rz(0.7854) q[6];
rz(1.5708) q[7];

// Edge interactions (0-1, 1-2, 2-3, 3-4, 4-5)
cx q[0], q[1];
rz(0.6283) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.3142) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(0.4712) q[3];
cx q[2], q[3];
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];
cx q[4], q[5];
rz(0.5236) q[5];
cx q[4], q[5];

// Layer 2
rx(1.0472) q[0];
rx(0.7854) q[1];
rx(1.2566) q[2];
rx(0.6283) q[3];
rx(0.9425) q[4];
rx(1.0996) q[5];
h q[6];
h q[7];

// Edge interactions (0-4, 1-3, 3-5)
cx q[0], q[4];
rz(0.3142) q[4];
cx q[0], q[4];
cx q[1], q[3];
rz(0.4712) q[3];
cx q[1], q[3];
cx q[3], q[5];
rz(0.3927) q[5];
cx q[3], q[5];

// Layer 3
ry(0.6283) q[0];
ry(0.7854) q[1];
ry(1.0472) q[2];
ry(0.3927) q[3];
ry(0.5236) q[4];
ry(0.3142) q[5];
cx q[6], q[7];
rz(0.7854) q[7];
cx q[6], q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];