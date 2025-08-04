OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// Edge interactions (0-1-2 component)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

// Edge interactions (3-5-6-4-8-7-9-10 component)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];
cx q[3], q[8];
rz(0.7854) q[8];
cx q[3], q[8];
cx q[3], q[10];
rz(0.7854) q[10];
cx q[3], q[10];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(0.7854) q[6];
cx q[4], q[6];
cx q[4], q[8];
rz(0.7854) q[8];
cx q[4], q[8];
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];
cx q[5], q[7];
rz(0.7854) q[7];
cx q[5], q[7];
cx q[5], q[9];
rz(0.7854) q[9];
cx q[5], q[9];
cx q[6], q[8];
rz(0.7854) q[8];
cx q[6], q[8];
cx q[6], q[9];
rz(0.7854) q[9];
cx q[6], q[9];
cx q[7], q[8];
rz(0.7854) q[8];
cx q[7], q[8];
cx q[7], q[9];
rz(0.7854) q[9];
cx q[7], q[9];
cx q[7], q[10];
rz(0.7854) q[10];
cx q[7], q[10];

// Layer 2
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];

// Layer 3
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];
rz(0.3927) q[8];
rz(0.3927) q[9];

// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

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