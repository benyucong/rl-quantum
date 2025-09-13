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
// Edge (0,2)
cx q[0], q[2];
rz(0.1987) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2231) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2059) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1923) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2184) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2016) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1872) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.2087) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1954) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1829) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.2118) q[4];
cx q[3], q[4];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4363) q[0];
h q[0];
h q[1];
rz(0.4363) q[1];
h q[1];
h q[2];
rz(0.4363) q[2];
h q[2];
h q[3];
rz(0.4363) q[3];
h q[3];
h q[4];
rz(0.4363) q[4];
h q[4];
h q[5];
rz(0.4363) q[5];
h q[5];
h q[6];
rz(0.4363) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1982) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1837) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2061) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1904) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1778) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2019) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1863) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1731) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1929) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1806) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1691) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1957) q[4];
cx q[3], q[4];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4032) q[0];
h q[0];
h q[1];
rz(0.4032) q[1];
h q[1];
h q[2];
rz(0.4032) q[2];
h q[2];
h q[3];
rz(0.4032) q[3];
h q[3];
h q[4];
rz(0.4032) q[4];
h q[4];
h q[5];
rz(0.4032) q[5];
h q[5];
h q[6];
rz(0.4032) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1832) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1698) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1905) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1760) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1644) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1866) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1722) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1600) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1783) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1670) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1563) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1809) q[4];
cx q[3], q[4];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3727) q[0];
h q[0];
h q[1];
rz(0.3727) q[1];
h q[1];
h q[2];
rz(0.3727) q[2];
h q[2];
h q[3];
rz(0.3727) q[3];
h q[3];
h q[4];
rz(0.3727) q[4];
h q[4];
h q[5];
rz(0.3727) q[5];
h q[5];
h q[6];
rz(0.3727) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];