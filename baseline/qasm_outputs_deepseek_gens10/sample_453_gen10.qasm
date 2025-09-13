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
// Edge interactions
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
// Layer 2
rx(1.1781) q[0];
rx(1.1781) q[1];
rx(1.1781) q[2];
rx(1.1781) q[3];
rx(1.1781) q[4];
rx(1.1781) q[5];
// Edge interactions
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
// Layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
// Edge interactions
rz(0.1963) q[0];
rz(0.1963) q[1];
rz(0.1963) q[2];
rz(0.1963) q[3];
rz(0.1963) q[4];
rz(0.1963) q[5];
// Layer 4
rx(0.3927) q[0];
rx(0.3927) q[1];
rx(0.3927) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];
rx(0.3927) q[5];
// Final edge interactions
rz(0.0982) q[0];
rz(0.0982) q[1];
rz(0.0982) q[2];
rz(0.0982) q[3];
rz(0.0982) q[4];
rz(0.0982) q[5];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];