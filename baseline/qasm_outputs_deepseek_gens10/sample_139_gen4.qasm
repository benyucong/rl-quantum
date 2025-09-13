OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem Hamiltonian (edge interactions)
// Edge (0,1) with weight 1
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];
rz(0.7854) q[0];
rz(0.7854) q[1];

// Edge (0,3) with weight 1
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-1.5708) q[3];
cx q[0], q[3];
rz(0.7854) q[0];
rz(0.7854) q[3];

// Edge (1,2) with weight 1
rz(0.7854) q[1];
rz(0.7854) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
rz(0.7854) q[1];
rz(0.7854) q[2];

// Edge (2,3) with weight 1
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];
rz(0.7854) q[2];
rz(0.7854) q[3];

// Layer 1: Mixer Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 2: Problem Hamiltonian (edge interactions)
// Edge (0,1) with weight 1
rz(0.7854) q[0];
rz(0.7854) q[1];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];
rz(0.7854) q[0];
rz(0.7854) q[1];

// Edge (0,3) with weight 1
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-1.5708) q[3];
cx q[0], q[3];
rz(0.7854) q[0];
rz(0.7854) q[3];

// Edge (1,2) with weight 1
rz(0.7854) q[1];
rz(0.7854) q[2];
cx q[1], q[2];
rz(-1.5708) q[2];
cx q[1], q[2];
rz(0.7854) q[1];
rz(0.7854) q[2];

// Edge (2,3) with weight 1
rz(0.7854) q[2];
rz(0.7854) q[3];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];
rz(0.7854) q[2];
rz(0.7854) q[3];

// Layer 2: Mixer Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];