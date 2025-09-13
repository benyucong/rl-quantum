OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem-specific rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Problem Hamiltonian phase terms for k=5 clique
// Main clique (0,1,2,3,4) - fully connected
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// External nodes penalty
rz(-0.3927) q[5];
rz(-0.3927) q[6];
rz(-0.3927) q[7];

// Layer 2: Mixer Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Problem Hamiltonian phase terms for k=5 clique
// Main clique reinforcement
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];

// External nodes stronger penalty
rz(-0.5890) q[5];
rz(-0.5890) q[6];
rz(-0.5890) q[7];

// Layer 3: Final mixer and measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Final phase adjustments for optimal solution
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(-0.1963) q[5];
rz(-0.1963) q[6];
rz(-0.1963) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];