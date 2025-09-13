OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
// Layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
// Entangling layer for edges: (0,2), (1,2), (1,3)
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];
// Layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
// Entangling layer
cx q[0], q[2];
rz(0.3491) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.3491) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.3491) q[3];
cx q[1], q[3];
// Layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rz(0.2618) q[0];
rz(0.2618) q[1];
rz(0.2618) q[2];
rz(0.2618) q[3];
// Final entangling layer
cx q[0], q[2];
rz(0.1745) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.1745) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.1745) q[3];
cx q[1], q[3];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];