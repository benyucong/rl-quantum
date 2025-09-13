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
// Edge interactions
rz(0.3927) q[0];
rz(0.3927) q[2];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[1];
rz(0.3927) q[3];
// Layer 2
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
// Edge interactions
rz(0.3927) q[0];
rz(0.3927) q[2];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[1];
rz(0.3927) q[3];
// Layer 3
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
// Edge interactions
rz(0.3927) q[0];
rz(0.3927) q[2];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[1];
rz(0.3927) q[3];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];