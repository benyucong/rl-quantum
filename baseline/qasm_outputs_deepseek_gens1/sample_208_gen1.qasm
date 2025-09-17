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
// Layer 1 - Problem Hamiltonian (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
// Edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];
// Layer 1 - Mixer Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
// Layer 2 - Problem Hamiltonian (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];
// Edge (1,4)
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];
// Layer 2 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];