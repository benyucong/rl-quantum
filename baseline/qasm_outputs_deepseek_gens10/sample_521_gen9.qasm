OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
// Layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
// Layer 2 - Entangling operations for edges
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Layer 3 - Mixer operations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
// Layer 4 - Final parameterized rotations
rx(0.3927) q[0];
rx(0.7854) q[1];
rx(0.5890) q[2];
rx(0.9817) q[3];
rx(1.1781) q[4];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];