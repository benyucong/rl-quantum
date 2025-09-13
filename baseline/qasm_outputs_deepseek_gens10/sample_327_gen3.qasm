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
rz(0.2231) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.2059) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1863) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1924) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1798) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.2086) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.2013) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];

h q[1];
rz(0.3987) q[1];
h q[1];

h q[2];
rz(0.4215) q[2];
h q[2];

h q[3];
rz(0.4098) q[3];
h q[3];

h q[4];
rz(0.3876) q[4];
h q[4];

h q[5];
rz(0.4152) q[5];
h q[5];

h q[6];
rz(0.4039) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.1763) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.1632) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.1845) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1698) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1537) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1589) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1482) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1719) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1658) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3562) q[0];
h q[0];

h q[1];
rz(0.3287) q[1];
h q[1];

h q[2];
rz(0.3476) q[2];
h q[2];

h q[3];
rz(0.3379) q[3];
h q[3];

h q[4];
rz(0.3195) q[4];
h q[4];

h q[5];
rz(0.3421) q[5];
h q[5];

h q[6];
rz(0.3328) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian (edges)
// Edge (0,1)
cx q[0], q[1];
rz(0.1452) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.1345) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.1521) q[3];
cx q[0], q[3];

// Edge (0,6)
cx q[0], q[6];
rz(0.1398) q[6];
cx q[0], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1267) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.1309) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1221) q[6];
cx q[2], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.1416) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1365) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.2934) q[0];
h q[0];

h q[1];
rz(0.2708) q[1];
h q[1];

h q[2];
rz(0.2863) q[2];
h q[2];

h q[3];
rz(0.2783) q[3];
h q[3];

h q[4];
rz(0.2632) q[4];
h q[4];

h q[5];
rz(0.2817) q[5];
h q[5];

h q[6];
rz(0.2741) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];