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
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];

// Layer 1 - Mixer Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];

// Layer 2 - Problem Hamiltonian
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(0.5890) q[3];
rz(0.5890) q[4];

// Layer 2 - Mixer Hamiltonian
rx(1.9635) q[0];
rx(1.9635) q[1];
rx(1.9635) q[2];
rx(1.9635) q[3];
rx(1.9635) q[4];

// Layer 3 - Problem Hamiltonian
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// Layer 3 - Mixer Hamiltonian
rx(2.3562) q[0];
rx(2.3562) q[1];
rx(2.3562) q[2];
rx(2.3562) q[3];
rx(2.3562) q[4];

// Layer 4 - Problem Hamiltonian
rz(1.9635) q[0];
rz(1.9635) q[1];
rz(1.9635) q[2];
rz(0.9817) q[3];
rz(0.9817) q[4];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];