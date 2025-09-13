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
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1987) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.2251) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.2318) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2289) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.2273) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.2196) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(1.4821) q[0];
rx(1.4763) q[1];
rx(1.4892) q[2];
rx(1.4915) q[3];
rx(1.4876) q[4];
rx(1.4859) q[5];
rx(1.4837) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.2087) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1924) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.2189) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.2253) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2227) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.2212) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.2138) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.4638) q[0];
rx(1.4582) q[1];
rx(1.4705) q[2];
rx(1.4729) q[3];
rx(1.4691) q[4];
rx(1.4675) q[5];
rx(1.4654) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.2032) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1864) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.2130) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.2191) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2168) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.2154) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.2083) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.4462) q[0];
rx(1.4408) q[1];
rx(1.4525) q[2];
rx(1.4549) q[3];
rx(1.4513) q[4];
rx(1.4498) q[5];
rx(1.4478) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];