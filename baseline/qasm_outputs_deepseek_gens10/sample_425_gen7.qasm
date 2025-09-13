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
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.098) q[1];
cx q[0], q[1];

// Edge (0,6) weight 19
cx q[0], q[6];
rz(0.266) q[6];
cx q[0], q[6];

// Edge (0,4) weight 11
cx q[0], q[4];
rz(0.154) q[4];
cx q[0], q[4];

// Edge (1,3) weight 11
cx q[1], q[3];
rz(0.154) q[3];
cx q[1], q[3];

// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.140) q[3];
cx q[2], q[3];

// Edge (3,5) weight 12
cx q[3], q[5];
rz(0.168) q[5];
cx q[3], q[5];

// Edge (3,6) weight 17
cx q[3], q[6];
rz(0.238) q[6];
cx q[3], q[6];

// Edge (4,5) weight 8
cx q[4], q[5];
rz(0.112) q[5];
cx q[4], q[5];

// Layer 2 - Mixer Hamiltonian
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rx(1.047) q[7];

// Layer 3 - Problem Hamiltonian (repeated with optimized parameters)
cx q[0], q[1];
rz(0.084) q[1];
cx q[0], q[1];

cx q[0], q[6];
rz(0.228) q[6];
cx q[0], q[6];

cx q[0], q[4];
rz(0.132) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(0.132) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.120) q[3];
cx q[2], q[3];

cx q[3], q[5];
rz(0.144) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.204) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.096) q[5];
cx q[4], q[5];

// Layer 4 - Final mixer and measurement preparation
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];