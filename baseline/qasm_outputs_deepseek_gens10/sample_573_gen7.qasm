OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1 - Initial rotations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Layer 1 - Entangling gates for graph edges
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[3], q[4];

// Layer 1 - Parameterized rotations
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.3927) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.3927) q[5];

// Layer 2 - Mixer operations
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(0.5236) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(0.5236) q[5];

// Layer 2 - Entangling gates
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[3], q[4];

// Layer 2 - Parameterized rotations
rz(0.6283) q[0];
rz(0.6283) q[1];
rz(0.3142) q[2];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(0.3142) q[5];

// Layer 3 - Final mixer operations
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.3927) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.3927) q[5];

// Layer 3 - Final entangling gates
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[2];
cx q[2], q[5];
cx q[3], q[4];

// Layer 3 - Final parameterized rotations
rz(0.4712) q[0];
rz(0.4712) q[1];
rz(0.2356) q[2];
rz(0.4712) q[3];
rz(0.4712) q[4];
rz(0.2356) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];