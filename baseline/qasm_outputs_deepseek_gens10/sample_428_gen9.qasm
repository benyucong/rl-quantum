OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// First QAOA layer - Problem Hamiltonian
// Edge (0,1) weight 10
cx q[0], q[1];
rz(0.5) q[1];
cx q[0], q[1];

// Edge (0,4) weight 20
cx q[0], q[4];
rz(1.0) q[4];
cx q[0], q[4];

// Edge (0,6) weight 14
cx q[0], q[6];
rz(0.7) q[6];
cx q[0], q[6];

// Edge (1,8) weight 13
cx q[1], q[8];
rz(0.65) q[8];
cx q[1], q[8];

// Edge (2,3) weight 3
cx q[2], q[3];
rz(0.15) q[3];
cx q[2], q[3];

// Edge (2,5) weight 11
cx q[2], q[5];
rz(0.55) q[5];
cx q[2], q[5];

// Edge (4,5) weight 2
cx q[4], q[5];
rz(0.1) q[5];
cx q[4], q[5];

// Edge (6,7) weight 5
cx q[6], q[7];
rz(0.25) q[7];
cx q[6], q[7];

// Edge (7,9) weight 17
cx q[7], q[9];
rz(0.85) q[9];
cx q[7], q[9];

// Edge (8,9) weight 10
cx q[8], q[9];
rz(0.5) q[9];
cx q[8], q[9];

// First Mixer Hamiltonian layer
h q[0];
rz(1.0) q[0];
h q[0];
h q[1];
rz(1.0) q[1];
h q[1];
h q[2];
rz(1.0) q[2];
h q[2];
h q[3];
rz(1.0) q[3];
h q[3];
h q[4];
rz(1.0) q[4];
h q[4];
h q[5];
rz(1.0) q[5];
h q[5];
h q[6];
rz(1.0) q[6];
h q[6];
h q[7];
rz(1.0) q[7];
h q[7];
h q[8];
rz(1.0) q[8];
h q[8];
h q[9];
rz(1.0) q[9];
h q[9];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,1) weight 10
cx q[0], q[1];
rz(0.5) q[1];
cx q[0], q[1];

// Edge (0,4) weight 20
cx q[0], q[4];
rz(1.0) q[4];
cx q[0], q[4];

// Edge (0,6) weight 14
cx q[0], q[6];
rz(0.7) q[6];
cx q[0], q[6];

// Edge (1,8) weight 13
cx q[1], q[8];
rz(0.65) q[8];
cx q[1], q[8];

// Edge (2,3) weight 3
cx q[2], q[3];
rz(0.15) q[3];
cx q[2], q[3];

// Edge (2,5) weight 11
cx q[2], q[5];
rz(0.55) q[5];
cx q[2], q[5];

// Edge (4,5) weight 2
cx q[4], q[5];
rz(0.1) q[5];
cx q[4], q[5];

// Edge (6,7) weight 5
cx q[6], q[7];
rz(0.25) q[7];
cx q[6], q[7];

// Edge (7,9) weight 17
cx q[7], q[9];
rz(0.85) q[9];
cx q[7], q[9];

// Edge (8,9) weight 10
cx q[8], q[9];
rz(0.5) q[9];
cx q[8], q[9];

// Second Mixer Hamiltonian layer
h q[0];
rz(1.0) q[0];
h q[0];
h q[1];
rz(1.0) q[1];
h q[1];
h q[2];
rz(1.0) q[2];
h q[2];
h q[3];
rz(1.0) q[3];
h q[3];
h q[4];
rz(1.0) q[4];
h q[4];
h q[5];
rz(1.0) q[5];
h q[5];
h q[6];
rz(1.0) q[6];
h q[6];
h q[7];
rz(1.0) q[7];
h q[7];
h q[8];
rz(1.0) q[8];
h q[8];
h q[9];
rz(1.0) q[9];
h q[9];

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
c[9] = measure q[9];