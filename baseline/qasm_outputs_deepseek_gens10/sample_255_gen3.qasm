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
// Edge constraints for potential 5-clique (nodes 0-4 form a complete subgraph)
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// Non-edge penalty (node 5-7 not in clique)
rz(-0.3927) q[5];
rz(-0.3927) q[6];
rz(-0.3927) q[7];

// Layer 1 - Mixer Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];

// Layer 2 - Problem Hamiltonian
rz(0.6283) q[0];
rz(0.6283) q[1];
rz(0.6283) q[2];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(-0.3142) q[5];
rz(-0.3142) q[6];
rz(-0.3142) q[7];

// Layer 2 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.3927) q[5];
rx(0.3927) q[6];
rx(0.3927) q[7];

// Layer 3 - Problem Hamiltonian
rz(0.4712) q[0];
rz(0.4712) q[1];
rz(0.4712) q[2];
rz(0.4712) q[3];
rz(0.4712) q[4];
rz(-0.2356) q[5];
rz(-0.2356) q[6];
rz(-0.2356) q[7];

// Layer 3 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.2618) q[5];
rx(0.2618) q[6];
rx(0.2618) q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];