OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Entangling gates for edges
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];

// Entangling gates for edges
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.5236) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(0.5236) q[5];
cx q[4], q[5];

// Layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];

// Entangling gates for edges
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.3927) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];