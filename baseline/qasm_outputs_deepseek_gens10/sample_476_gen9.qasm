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

// Layer 1 - Problem Hamiltonian
// Edge (0,1) weight 5
cx q[0], q[1];
rz(0.05) q[1];
cx q[0], q[1];

// Edge (0,3) weight 11
cx q[0], q[3];
rz(0.11) q[3];
cx q[0], q[3];

// Edge (0,2) weight 17
cx q[0], q[2];
rz(0.17) q[2];
cx q[0], q[2];

// Edge (0,5) weight 11
cx q[0], q[5];
rz(0.11) q[5];
cx q[0], q[5];

// Edge (1,2) weight 18
cx q[1], q[2];
rz(0.18) q[2];
cx q[1], q[2];

// Edge (2,3) weight 8
cx q[2], q[3];
rz(0.08) q[3];
cx q[2], q[3];

// Edge (2,4) weight 15
cx q[2], q[4];
rz(0.15) q[4];
cx q[2], q[4];

// Edge (4,5) weight 1
cx q[4], q[5];
rz(0.01) q[5];
cx q[4], q[5];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.7854) q[0];
h q[0];
h q[1];
rz(0.7854) q[1];
h q[1];
h q[2];
rz(0.7854) q[2];
h q[2];
h q[3];
rz(0.7854) q[3];
h q[3];
h q[4];
rz(0.7854) q[4];
h q[4];
h q[5];
rz(0.7854) q[5];
h q[5];
h q[6];
rz(0.7854) q[6];
h q[6];
h q[7];
rz(0.7854) q[7];
h q[7];

// Layer 3 - Problem Hamiltonian (repeated with optimized parameters)
// Edge (0,1) weight 5
cx q[0], q[1];
rz(0.075) q[1];
cx q[0], q[1];

// Edge (0,3) weight 11
cx q[0], q[3];
rz(0.165) q[3];
cx q[0], q[3];

// Edge (0,2) weight 17
cx q[0], q[2];
rz(0.255) q[2];
cx q[0], q[2];

// Edge (0,5) weight 11
cx q[0], q[5];
rz(0.165) q[5];
cx q[0], q[5];

// Edge (1,2) weight 18
cx q[1], q[2];
rz(0.27) q[2];
cx q[1], q[2];

// Edge (2,3) weight 8
cx q[2], q[3];
rz(0.12) q[3];
cx q[2], q[3];

// Edge (2,4) weight 15
cx q[2], q[4];
rz(0.225) q[4];
cx q[2], q[4];

// Edge (4,5) weight 1
cx q[4], q[5];
rz(0.015) q[5];
cx q[4], q[5];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];