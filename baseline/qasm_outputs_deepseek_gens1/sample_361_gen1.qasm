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
// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2231) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.2059) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.1863) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2112) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1928) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.2041) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1795) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.2043) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1859) q[5];
cx q[2], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1962) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.2076) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2194) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4289) q[0];
h q[0];
h q[1];
rz(0.3974) q[1];
h q[1];
h q[2];
rz(0.3590) q[2];
h q[2];
h q[3];
rz(0.3934) q[3];
h q[3];
h q[4];
rz(0.4462) q[4];
h q[4];
h q[5];
rz(0.3858) q[5];
h q[5];
h q[6];
rz(0.4388) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.3218) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.2981) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.3347) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.3089) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.2795) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.3168) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2892) q[5];
cx q[1], q[5];
// Edge (1,6)
cx q[1], q[6];
rz(0.3062) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.2693) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.3065) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2789) q[5];
cx q[2], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2943) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.3114) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.3291) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.6434) q[0];
h q[0];
h q[1];
rz(0.5961) q[1];
h q[1];
h q[2];
rz(0.5385) q[2];
h q[2];
h q[3];
rz(0.5901) q[3];
h q[3];
h q[4];
rz(0.6693) q[4];
h q[4];
h q[5];
rz(0.5787) q[5];
h q[5];
h q[6];
rz(0.6582) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];