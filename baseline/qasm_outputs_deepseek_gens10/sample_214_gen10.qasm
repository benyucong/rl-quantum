OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian
// Edge constraints for potential 4-clique (nodes 0,1,2,3)
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];

// Penalize non-connected nodes in potential clique
rz(-0.3927) q[4];
rz(-0.3927) q[5];
rz(-0.3927) q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 3 - Final optimization
// Reinforce clique structure (nodes 0,1,2,3)
rz(0.6283) q[0];
rz(0.6283) q[1];
rz(0.6283) q[2];
rz(0.6283) q[3];

// Suppress non-clique nodes
rz(-0.3142) q[4];
rz(-0.3142) q[5];
rz(-0.3142) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];