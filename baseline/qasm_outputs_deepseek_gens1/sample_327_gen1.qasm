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

// Layer 1 - Problem Hamiltonian (edges)
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
rz(0.2031) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1892) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1756) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1923) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1814) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1678) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1795) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];

h q[1];
rz(0.3876) q[1];
h q[1];

h q[2];
rz(0.4352) q[2];
h q[2];

h q[3];
rz(0.4018) q[3];
h q[3];

h q[4];
rz(0.3569) q[4];
h q[4];

h q[5];
rz(0.4127) q[5];
h q[5];

h q[6];
rz(0.3984) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian (edges)
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
rz(0.1879) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1752) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1627) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1781) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1683) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1554) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1662) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3918) q[0];
h q[0];

h q[1];
rz(0.3592) q[1];
h q[1];

h q[2];
rz(0.4031) q[2];
h q[2];

h q[3];
rz(0.3721) q[3];
h q[3];

h q[4];
rz(0.3306) q[4];
h q[4];

h q[5];
rz(0.3823) q[5];
h q[5];

h q[6];
rz(0.3691) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.1709) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.1741) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1623) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1507) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1650) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1559) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1440) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1540) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3629) q[0];
h q[0];

h q[1];
rz(0.3327) q[1];
h q[1];

h q[2];
rz(0.3734) q[2];
h q[2];

h q[3];
rz(0.3447) q[3];
h q[3];

h q[4];
rz(0.3062) q[4];
h q[4];

h q[5];
rz(0.3541) q[5];
h q[5];

h q[6];
rz(0.3419) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];