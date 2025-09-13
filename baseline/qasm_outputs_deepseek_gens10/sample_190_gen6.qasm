OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Problem Hamiltonian (k-clique constraints)
// Cost terms for k=5 clique
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(-0.3927) q[5];
rz(-0.3927) q[6];
rz(-0.3927) q[7];

// Mixer layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 2 - Problem Hamiltonian (edge constraints)
// Edge terms for the given graph
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.5236) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.5236) q[4];
cx q[2], q[4];
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];
cx q[2], q[7];
rz(0.5236) q[7];
cx q[2], q[7];
cx q[3], q[4];
rz(0.5236) q[4];
cx q[3], q[4];
cx q[6], q[5];
rz(0.5236) q[5];
cx q[6], q[5];
cx q[5], q[7];
rz(0.5236) q[7];
cx q[5], q[7];

// Mixer layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Layer 3 - Problem Hamiltonian (reinforce clique structure)
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(-0.7854) q[5];
rz(-0.7854) q[6];
rz(-0.7854) q[7];

// Mixer layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];

// Layer 4 - Final optimization
rz(0.2618) q[0];
rz(0.2618) q[1];
rz(0.2618) q[2];
rz(0.2618) q[3];
rz(0.2618) q[4];
rz(-0.5236) q[5];
rz(-0.5236) q[6];
rz(-0.5236) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];