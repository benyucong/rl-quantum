OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
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

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
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

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
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

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];
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

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];