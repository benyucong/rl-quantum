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
// Edge (0,1) with weight 7
cx q[0], q[1];
rz(0.245) q[1];
cx q[0], q[1];

// Edge (0,6) with weight 19
cx q[0], q[6];
rz(0.665) q[6];
cx q[0], q[6];

// Edge (0,4) with weight 11
cx q[0], q[4];
rz(0.385) q[4];
cx q[0], q[4];

// Edge (1,3) with weight 11
cx q[1], q[3];
rz(0.385) q[3];
cx q[1], q[3];

// Edge (2,3) with weight 10
cx q[2], q[3];
rz(0.35) q[3];
cx q[2], q[3];

// Edge (3,5) with weight 12
cx q[3], q[5];
rz(0.42) q[5];
cx q[3], q[5];

// Edge (3,6) with weight 17
cx q[3], q[6];
rz(0.595) q[6];
cx q[3], q[6];

// Edge (4,5) with weight 8
cx q[4], q[5];
rz(0.28) q[5];
cx q[4], q[5];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(1.57) q[0];
h q[0];
h q[1];
rz(1.57) q[1];
h q[1];
h q[2];
rz(1.57) q[2];
h q[2];
h q[3];
rz(1.57) q[3];
h q[3];
h q[4];
rz(1.57) q[4];
h q[4];
h q[5];
rz(1.57) q[5];
h q[5];
h q[6];
rz(1.57) q[6];
h q[6];
h q[7];
rz(1.57) q[7];
h q[7];

// Layer 3 - Problem Hamiltonian (repeated with optimized parameters)
cx q[0], q[1];
rz(0.42) q[1];
cx q[0], q[1];
cx q[0], q[6];
rz(1.14) q[6];
cx q[0], q[6];
cx q[0], q[4];
rz(0.66) q[4];
cx q[0], q[4];
cx q[1], q[3];
rz(0.66) q[3];
cx q[1], q[3];
cx q[2], q[3];
rz(0.6) q[3];
cx q[2], q[3];
cx q[3], q[5];
rz(0.72) q[5];
cx q[3], q[5];
cx q[3], q[6];
rz(1.02) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.48) q[5];
cx q[4], q[5];

// Layer 4 - Final mixer with optimal parameters
h q[0];
rz(0.89) q[0];
h q[0];
h q[1];
rz(0.89) q[1];
h q[1];
h q[2];
rz(0.89) q[2];
h q[2];
h q[3];
rz(0.89) q[3];
h q[3];
h q[4];
rz(0.89) q[4];
h q[4];
h q[5];
rz(0.89) q[5];
h q[5];
h q[6];
rz(0.89) q[6];
h q[6];
h q[7];
rz(0.89) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];