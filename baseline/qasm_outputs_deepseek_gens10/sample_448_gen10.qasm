OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1 - Problem Hamiltonian (k-clique constraints)
// Edge constraints for potential 3-clique
rz(0.7854) q[0];  // Node 0
rz(0.7854) q[1];  // Node 1
rz(0.7854) q[2];  // Node 2
rz(0.7854) q[3];  // Node 3
rz(0.7854) q[4];  // Node 4
rz(0.7854) q[5];  // Node 5

// Mixing Hamiltonian layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Layer 2 - Problem Hamiltonian with optimized parameters
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(0.5236) q[3];
rz(0.5236) q[4];
rz(0.5236) q[5];

// Mixing Hamiltonian layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(2.0944) q[0];
rx(2.0944) q[1];
rx(2.0944) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];

// Layer 3 - Final problem Hamiltonian with optimal parameters
rz(1.3089) q[0];
rz(1.3089) q[1];
rz(1.3089) q[2];
rz(0.6545) q[3];
rz(0.6545) q[4];
rz(0.6545) q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];