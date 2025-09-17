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

// Edge (0,5)
cx q[0], q[5];
rz(0.2312) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.2258) q[6];
cx q[0], q[6];

// Edge (2,4)
cx q[2], q[4];
rz(0.1876) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.2034) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1921) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1893) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1819) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1957) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.4231) q[0];
rx(0.4231) q[1];
rx(0.4231) q[2];
rx(0.4231) q[3];
rx(0.4231) q[4];
rx(0.4231) q[5];
rx(0.4231) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];

// Edge (0,3)
cx q[0], q[3];
rz(0.1842) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.2138) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.2087) q[6];
cx q[0], q[6];

// Edge (2,4)
cx q[2], q[4];
rz(0.1734) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1881) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1776) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1632) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1751) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1682) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1810) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.3912) q[0];
rx(0.3912) q[1];
rx(0.3912) q[2];
rx(0.3912) q[3];
rx(0.3912) q[4];
rx(0.3912) q[5];
rx(0.3912) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1834) q[1];
cx q[0], q[1];

// Edge (0,3)
cx q[0], q[3];
rz(0.1704) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.1978) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.1930) q[6];
cx q[0], q[6];

// Edge (2,4)
cx q[2], q[4];
rz(0.1604) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1740) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1643) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1510) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1620) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1556) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1674) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.3618) q[0];
rx(0.3618) q[1];
rx(0.3618) q[2];
rx(0.3618) q[3];
rx(0.3618) q[4];
rx(0.3618) q[5];
rx(0.3618) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];