OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];

// Entangling layer 1
cx q[0], q[4];
rz(2.0) q[4];
cx q[0], q[4];
cx q[0], q[6];
rz(13.0) q[6];
cx q[0], q[6];
cx q[1], q[5];
rz(1.0) q[5];
cx q[1], q[5];
cx q[1], q[8];
rz(17.0) q[8];
cx q[1], q[8];
cx q[2], q[6];
rz(8.0) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(12.0) q[7];
cx q[2], q[7];
cx q[2], q[4];
rz(12.0) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(10.0) q[7];
cx q[3], q[7];
cx q[3], q[6];
rz(15.0) q[6];
cx q[3], q[6];

// Layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];

// Entangling layer 2
cx q[0], q[4];
rz(1.5) q[4];
cx q[0], q[4];
cx q[0], q[6];
rz(9.75) q[6];
cx q[0], q[6];
cx q[1], q[5];
rz(0.75) q[5];
cx q[1], q[5];
cx q[1], q[8];
rz(12.75) q[8];
cx q[1], q[8];
cx q[2], q[6];
rz(6.0) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(9.0) q[7];
cx q[2], q[7];
cx q[2], q[4];
rz(9.0) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(7.5) q[7];
cx q[3], q[7];
cx q[3], q[6];
rz(11.25) q[6];
cx q[3], q[6];

// Layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];

// Entangling layer 3
cx q[0], q[4];
rz(1.0) q[4];
cx q[0], q[4];
cx q[0], q[6];
rz(6.5) q[6];
cx q[0], q[6];
cx q[1], q[5];
rz(0.5) q[5];
cx q[1], q[5];
cx q[1], q[8];
rz(8.5) q[8];
cx q[1], q[8];
cx q[2], q[6];
rz(4.0) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(6.0) q[7];
cx q[2], q[7];
cx q[2], q[4];
rz(6.0) q[4];
cx q[2], q[4];
cx q[3], q[7];
rz(5.0) q[7];
cx q[3], q[7];
cx q[3], q[6];
rz(7.5) q[6];
cx q[3], q[6];

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