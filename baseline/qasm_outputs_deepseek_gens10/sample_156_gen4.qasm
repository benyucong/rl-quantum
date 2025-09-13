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
rz(0.2256) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1879) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2034) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1967) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1892) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2118) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2053) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2231) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.4521) q[0];
rx(0.4387) q[1];
rx(0.4419) q[2];
rx(0.4473) q[3];
rx(0.4498) q[4];
rx(0.4536) q[5];
rx(0.4502) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.2089) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1924) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.2247) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2192) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1821) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1976) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1910) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1835) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2058) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1994) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2169) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.4382) q[0];
rx(0.4251) q[1];
rx(0.4282) q[2];
rx(0.4334) q[3];
rx(0.4358) q[4];
rx(0.4395) q[5];
rx(0.4362) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.2036) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1864) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.2185) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2131) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1766) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1921) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1856) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1781) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2001) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1938) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2110) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.4246) q[0];
rx(0.4118) q[1];
rx(0.4148) q[2];
rx(0.4198) q[3];
rx(0.4221) q[4];
rx(0.4257) q[5];
rx(0.4225) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];