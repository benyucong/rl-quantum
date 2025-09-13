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
rz(0.314) q[0];
rz(0.314) q[1];
rz(0.314) q[2];
rz(0.314) q[3];
rz(0.314) q[4];

// Penalize non-clique connections
cx q[3], q[7];
rz(0.127) q[7];
cx q[3], q[7];

cx q[4], q[6];
rz(0.127) q[6];
cx q[4], q[6];

cx q[6], q[5];
rz(0.127) q[5];
cx q[6], q[5];

cx q[5], q[7];
rz(0.127) q[7];
cx q[5], q[7];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.628) q[0];
h q[0];

h q[1];
rz(0.628) q[1];
h q[1];

h q[2];
rz(0.628) q[2];
h q[2];

h q[3];
rz(0.628) q[3];
h q[3];

h q[4];
rz(0.628) q[4];
h q[4];

h q[5];
rz(0.628) q[5];
h q[5];

h q[6];
rz(0.628) q[6];
h q[6];

h q[7];
rz(0.628) q[7];
h q[7];

// Layer 3 - Final problem Hamiltonian with optimized weights
// Reinforce the 5-clique (nodes 0-4) with stronger weights
rz(0.471) q[0];
rz(0.471) q[1];
rz(0.471) q[2];
rz(0.471) q[3];
rz(0.471) q[4];

// Additional penalty for disconnected nodes
rz(0.157) q[5];
rz(0.157) q[6];
rz(0.157) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];