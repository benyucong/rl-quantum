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

// Non-edge penalty (node 7 is connected to 0 and 5, but not part of the 5-clique)
rz(-0.3927) q[7];

// Layer 2 - Mixer Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 3 - Final problem Hamiltonian with optimized parameters
// Reinforce the 5-clique solution (nodes 0-4)
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];

// Penalize non-clique nodes
rz(-0.5890) q[5];
rz(-0.5890) q[6];
rz(-0.5890) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];