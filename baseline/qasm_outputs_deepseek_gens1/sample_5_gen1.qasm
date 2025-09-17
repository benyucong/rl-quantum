OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1 - Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge (0,1) weight=2
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];

// Edge (0,3) weight=12
rz(4.7124) q[0];
rz(4.7124) q[3];
cx q[0], q[3];
rz(-9.4248) q[3];
cx q[0], q[3];

// Edge (1,6) weight=11
rz(4.3197) q[1];
rz(4.3197) q[6];
cx q[1], q[6];
rz(-8.6394) q[6];
cx q[1], q[6];

// Edge (1,4) weight=13
rz(5.1051) q[1];
rz(5.1051) q[4];
cx q[1], q[4];
rz(-10.2102) q[4];
cx q[1], q[4];

// Edge (2,3) weight=2
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];

// Edge (2,7) weight=16
rz(6.2832) q[2];
rz(6.2832) q[7];
cx q[2], q[7];
rz(-12.5664) q[7];
cx q[2], q[7];

// Edge (2,5) weight=20
rz(7.8540) q[2];
rz(7.8540) q[5];
cx q[2], q[5];
rz(-15.7080) q[5];
cx q[2], q[5];

// Edge (4,5) weight=1
rz(0.3927) q[4];
rz(0.3927) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];

// Edge (6,7) weight=3
rz(1.1781) q[6];
rz(1.1781) q[7];
cx q[6], q[7];
rz(-2.3562) q[7];
cx q[6], q[7];

// Layer 1 - Mixing Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];

// Layer 2 - Problem Hamiltonian
// Edge (0,1) weight=2
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];

// Edge (0,3) weight=12
rz(4.7124) q[0];
rz(4.7124) q[3];
cx q[0], q[3];
rz(-9.4248) q[3];
cx q[0], q[3];

// Edge (1,6) weight=11
rz(4.3197) q[1];
rz(4.3197) q[6];
cx q[1], q[6];
rz(-8.6394) q[6];
cx q[1], q[6];

// Edge (1,4) weight=13
rz(5.1051) q[1];
rz(5.1051) q[4];
cx q[1], q[4];
rz(-10.2102) q[4];
cx q[1], q[4];

// Edge (2,3) weight=2
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];

// Edge (2,7) weight=16
rz(6.2832) q[2];
rz(6.2832) q[7];
cx q[2], q[7];
rz(-12.5664) q[7];
cx q[2], q[7];

// Edge (2,5) weight=20
rz(7.8540) q[2];
rz(7.8540) q[5];
cx q[2], q[5];
rz(-15.7080) q[5];
cx q[2], q[5];

// Edge (4,5) weight=1
rz(0.3927) q[4];
rz(0.3927) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];

// Edge (6,7) weight=3
rz(1.1781) q[6];
rz(1.1781) q[7];
cx q[6], q[7];
rz(-2.3562) q[7];
cx q[6], q[7];

// Layer 2 - Mixing Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];

// Layer 3 - Problem Hamiltonian
// Edge (0,1) weight=2
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];

// Edge (0,3) weight=12
rz(4.7124) q[0];
rz(4.7124) q[3];
cx q[0], q[3];
rz(-9.4248) q[3];
cx q[0], q[3];

// Edge (1,6) weight=11
rz(4.3197) q[1];
rz(4.3197) q[6];
cx q[1], q[6];
rz(-8.6394) q[6];
cx q[1], q[6];

// Edge (1,4) weight=13
rz(5.1051) q[1];
rz(5.1051) q[4];
cx q[1], q[4];
rz(-10.2102) q[4];
cx q[1], q[4];

// Edge (2,3) weight=2
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];

// Edge (2,7) weight=16
rz(6.2832) q[2];
rz(6.2832) q[7];
cx q[2], q[7];
rz(-12.5664) q[7];
cx q[2], q[7];

// Edge (2,5) weight=20
rz(7.8540) q[2];
rz(7.8540) q[5];
cx q[2], q[5];
rz(-15.7080) q[5];
cx q[2], q[5];

// Edge (4,5) weight=1
rz(0.3927) q[4];
rz(0.3927) q[5];
cx q[4], q[5];
rz(-0.7854) q[5];
cx q[4], q[5];

// Edge (6,7) weight=3
rz(1.1781) q[6];
rz(1.1781) q[7];
cx q[6], q[7];
rz(-2.3562) q[7];
cx q[6], q[7];

// Layer 3 - Final mixing
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];

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