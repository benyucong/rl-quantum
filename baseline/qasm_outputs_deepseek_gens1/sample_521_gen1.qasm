OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1 - Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1 - Problem Hamiltonian (edges)
// Edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];

// Layer 2 - Mixing Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];

// Layer 2 - Problem Hamiltonian (edges)
// Edge (0,3)
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];

// Layer 3 - Mixing Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];

// Layer 3 - Problem Hamiltonian (edges)
// Edge (0,3)
cx q[0], q[3];
rz(0.1963) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1963) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1963) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.1963) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1963) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1963) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1963) q[4];
cx q[3], q[4];

// Layer 4 - Final mixing and measurement
rx(0.3927) q[0];
rx(0.3927) q[1];
rx(0.3927) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];