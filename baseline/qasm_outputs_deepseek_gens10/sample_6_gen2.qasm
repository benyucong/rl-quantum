OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;
// Layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
// Entangling layer 1
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
// Layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
// Entangling layer 2
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
// Layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rz(1.2566) q[0];
rz(1.2566) q[1];
rz(1.2566) q[2];
// Entangling layer 3
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
// Final rotations
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];