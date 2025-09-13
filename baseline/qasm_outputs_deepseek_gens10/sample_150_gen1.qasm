OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// Mixer unitary layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];

// Layer 2
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// Mixer unitary layer 2
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];

// Layer 3
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// Mixer unitary layer 3
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];

// Layer 4
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Problem unitary for edge (2,6)
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];

// Problem unitary for edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Problem unitary for edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];