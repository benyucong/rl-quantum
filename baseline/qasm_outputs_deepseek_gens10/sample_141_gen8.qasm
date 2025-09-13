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
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1832) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1976) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.2051) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1689) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1763) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1924) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.4321) q[0];
rx(0.3987) q[1];
rx(0.4156) q[2];
rx(0.4238) q[3];
rx(0.4072) q[4];
rx(0.4193) q[5];
rx(0.3865) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.3287) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.2945) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.3128) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.3216) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.2873) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.2951) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.3089) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.5678) q[0];
rx(0.5342) q[1];
rx(0.5519) q[2];
rx(0.5593) q[3];
rx(0.5436) q[4];
rx(0.5561) q[5];
rx(0.5237) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.4123) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.3789) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.3967) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.4052) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.3728) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.3801) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.3945) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.6789) q[0];
rx(0.6453) q[1];
rx(0.6632) q[2];
rx(0.6708) q[3];
rx(0.6547) q[4];
rx(0.6674) q[5];
rx(0.6349) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];