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

// Edge (0,6)
cx q[0], q[6];
rz(0.2059) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1876) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1923) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.2018) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1765) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1894) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(1.2347) q[0];
rx(1.2456) q[1];
rx(1.1987) q[2];
rx(1.2678) q[3];
rx(1.1876) q[4];
rx(1.2234) q[5];
rx(1.2109) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.1845) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.2067) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1902) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1734) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1789) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1872) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1632) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1756) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.1456) q[0];
rx(1.1567) q[1];
rx(1.1123) q[2];
rx(1.1789) q[3];
rx(1.1034) q[4];
rx(1.1345) q[5];
rx(1.1234) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1842) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.1712) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.1923) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1765) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1612) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1667) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1745) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1518) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1634) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.0678) q[0];
rx(1.0789) q[1];
rx(1.0376) q[2];
rx(1.0987) q[3];
rx(1.0289) q[4];
rx(1.0567) q[5];
rx(1.0456) q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];