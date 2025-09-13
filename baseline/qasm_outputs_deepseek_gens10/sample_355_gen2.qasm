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
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(1.5708) q[2];
rz(0.7854) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2 - Problem Hamiltonian
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.9635) q[2];
rz(1.1781) q[3];
rz(1.9635) q[4];
rz(1.9635) q[5];
rz(1.9635) q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3 - Problem Hamiltonian
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(2.3562) q[2];
rz(1.5708) q[3];
rz(2.3562) q[4];
rz(2.3562) q[5];
rz(2.3562) q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 4 - Problem Hamiltonian
rz(1.9635) q[0];
rz(1.9635) q[1];
rz(2.7489) q[2];
rz(1.9635) q[3];
rz(2.7489) q[4];
rz(2.7489) q[5];
rz(2.7489) q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];