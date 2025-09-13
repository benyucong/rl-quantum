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
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.2145) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.2145) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.2145) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.2145) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2145) q[6];
cx q[4], q[6];

// Mixer Hamiltonian Layer 1
rx(0.4289) q[0];
rx(0.4289) q[1];
rx(0.4289) q[2];
rx(0.4289) q[3];
rx(0.4289) q[4];
rx(0.4289) q[5];
rx(0.4289) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.3218) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.3218) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.3218) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.3218) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.3218) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.3218) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.3218) q[6];
cx q[4], q[6];

// Mixer Hamiltonian Layer 2
rx(0.6436) q[0];
rx(0.6436) q[1];
rx(0.6436) q[2];
rx(0.6436) q[3];
rx(0.6436) q[4];
rx(0.6436) q[5];
rx(0.6436) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.4827) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.4827) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.4827) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.4827) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.4827) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.4827) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.4827) q[6];
cx q[4], q[6];

// Mixer Hamiltonian Layer 3
rx(0.9654) q[0];
rx(0.9654) q[1];
rx(0.9654) q[2];
rx(0.9654) q[3];
rx(0.9654) q[4];
rx(0.9654) q[5];
rx(0.9654) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];