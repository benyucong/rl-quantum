OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Cost Hamiltonian implementation (edge weights)
// Edge (0,1): weight 8
rz(0.16) q[0];
rz(0.16) q[1];
cx q[0], q[1];
rz(-0.08) q[1];
cx q[0], q[1];

// Edge (0,3): weight 16
rz(0.32) q[0];
rz(0.32) q[3];
cx q[0], q[3];
rz(-0.16) q[3];
cx q[0], q[3];

// Edge (0,5): weight 16
rz(0.32) q[0];
rz(0.32) q[5];
cx q[0], q[5];
rz(-0.16) q[5];
cx q[0], q[5];

// Edge (1,6): weight 20
rz(0.4) q[1];
rz(0.4) q[6];
cx q[1], q[6];
rz(-0.2) q[6];
cx q[1], q[6];

// Edge (2,3): weight 9
rz(0.18) q[2];
rz(0.18) q[3];
cx q[2], q[3];
rz(-0.09) q[3];
cx q[2], q[3];

// Edge (4,5): weight 3
rz(0.06) q[4];
rz(0.06) q[5];
cx q[4], q[5];
rz(-0.03) q[5];
cx q[4], q[5];

// Edge (4,6): weight 17
rz(0.34) q[4];
rz(0.34) q[6];
cx q[4], q[6];
rz(-0.17) q[6];
cx q[4], q[6];

// Edge (5,7): weight 20
rz(0.4) q[5];
rz(0.4) q[7];
cx q[5], q[7];
rz(-0.2) q[7];
cx q[5], q[7];

// Edge (6,7): weight 1
rz(0.02) q[6];
rz(0.02) q[7];
cx q[6], q[7];
rz(-0.01) q[7];
cx q[6], q[7];

// Layer 2: Mixer Hamiltonian
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.25) q[0];
rz(0.25) q[1];
rz(0.25) q[2];
rz(0.25) q[3];
rz(0.25) q[4];
rz(0.25) q[5];
rz(0.25) q[6];
rz(0.25) q[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 3: Final cost Hamiltonian and measurement preparation
// Repeat cost terms with optimized parameters
rz(0.12) q[0];
rz(0.12) q[1];
cx q[0], q[1];
rz(-0.06) q[1];
cx q[0], q[1];

rz(0.24) q[0];
rz(0.24) q[3];
cx q[0], q[3];
rz(-0.12) q[3];
cx q[0], q[3];

rz(0.24) q[0];
rz(0.24) q[5];
cx q[0], q[5];
rz(-0.12) q[5];
cx q[0], q[5];

rz(0.3) q[1];
rz(0.3) q[6];
cx q[1], q[6];
rz(-0.15) q[6];
cx q[1], q[6];

rz(0.135) q[2];
rz(0.135) q[3];
cx q[2], q[3];
rz(-0.0675) q[3];
cx q[2], q[3];

rz(0.045) q[4];
rz(0.045) q[5];
cx q[4], q[5];
rz(-0.0225) q[5];
cx q[4], q[5];

rz(0.255) q[4];
rz(0.255) q[6];
cx q[4], q[6];
rz(-0.1275) q[6];
cx q[4], q[6];

rz(0.3) q[5];
rz(0.3) q[7];
cx q[5], q[7];
rz(-0.15) q[7];
cx q[5], q[7];

rz(0.015) q[6];
rz(0.015) q[7];
cx q[6], q[7];
rz(-0.0075) q[7];
cx q[6], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];