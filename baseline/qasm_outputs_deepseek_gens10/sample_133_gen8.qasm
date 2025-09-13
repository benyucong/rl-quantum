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
rz(0.1987) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2251) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.1923) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.2068) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.2034) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2189) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4312) q[0];
h q[0];
h q[1];
rz(0.3846) q[1];
h q[1];
h q[2];
rz(0.4136) q[2];
h q[2];
h q[3];
rz(0.4213) q[3];
h q[3];
h q[4];
rz(0.4223) q[4];
h q[4];
h q[5];
rz(0.5944) q[5];
h q[5];
h q[6];
rz(0.4440) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1982) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.1841) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2083) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.1782) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1915) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.1884) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2027) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3964) q[0];
h q[0];
h q[1];
rz(0.3564) q[1];
h q[1];
h q[2];
rz(0.3830) q[2];
h q[2];
h q[3];
rz(0.3898) q[3];
h q[3];
h q[4];
rz(0.3906) q[4];
h q[4];
h q[5];
rz(0.5500) q[5];
h q[5];
h q[6];
rz(0.4108) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1835) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.1705) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1929) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.1651) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1773) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.1745) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1877) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3670) q[0];
h q[0];
h q[1];
rz(0.3302) q[1];
h q[1];
h q[2];
rz(0.3546) q[2];
h q[2];
h q[3];
rz(0.3610) q[3];
h q[3];
h q[4];
rz(0.3617) q[4];
h q[4];
h q[5];
rz(0.5093) q[5];
h q[5];
h q[6];
rz(0.3804) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];