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
// Edge (0,1) constraint
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (0,2) constraint
cx q[0], q[2];
rz(0.1987) q[2];
cx q[0], q[2];

// Edge (0,3) constraint
cx q[0], q[3];
rz(0.2231) q[3];
cx q[0], q[3];

// Edge (0,5) constraint
cx q[0], q[5];
rz(0.1852) q[5];
cx q[0], q[5];

// Edge (0,6) constraint
cx q[0], q[6];
rz(0.1768) q[6];
cx q[0], q[6];

// Edge (1,2) constraint
cx q[1], q[2];
rz(0.2063) q[2];
cx q[1], q[2];

// Edge (1,3) constraint
cx q[1], q[3];
rz(0.2317) q[3];
cx q[1], q[3];

// Edge (2,3) constraint
cx q[2], q[3];
rz(0.2194) q[3];
cx q[2], q[3];

// Edge (5,4) constraint
cx q[5], q[4];
rz(0.1925) q[4];
cx q[5], q[4];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];

h q[1];
rz(0.4156) q[1];
h q[1];

h q[2];
rz(0.4289) q[2];
h q[2];

h q[3];
rz(0.4412) q[3];
h q[3];

h q[4];
rz(0.3987) q[4];
h q[4];

h q[5];
rz(0.4073) q[5];
h q[5];

h q[6];
rz(0.3918) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
cx q[0], q[1];
rz(0.1872) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.1734) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1956) q[3];
cx q[0], q[3];

cx q[0], q[5];
rz(0.1621) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.1543) q[6];
cx q[0], q[6];

cx q[1], q[2];
rz(0.1802) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.2028) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.1915) q[3];
cx q[2], q[3];

cx q[5], q[4];
rz(0.1687) q[4];
cx q[5], q[4];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3789) q[0];
h q[0];

h q[1];
rz(0.3632) q[1];
h q[1];

h q[2];
rz(0.3756) q[2];
h q[2];

h q[3];
rz(0.3867) q[3];
h q[3];

h q[4];
rz(0.3489) q[4];
h q[4];

h q[5];
rz(0.3564) q[5];
h q[5];

h q[6];
rz(0.3421) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
cx q[0], q[1];
rz(0.1638) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.1517) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1712) q[3];
cx q[0], q[3];

cx q[0], q[5];
rz(0.1418) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.1351) q[6];
cx q[0], q[6];

cx q[1], q[2];
rz(0.1576) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1775) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.1675) q[3];
cx q[2], q[3];

cx q[5], q[4];
rz(0.1476) q[4];
cx q[5], q[4];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3312) q[0];
h q[0];

h q[1];
rz(0.3178) q[1];
h q[1];

h q[2];
rz(0.3287) q[2];
h q[2];

h q[3];
rz(0.3384) q[3];
h q[3];

h q[4];
rz(0.3052) q[4];
h q[4];

h q[5];
rz(0.3118) q[5];
h q[5];

h q[6];
rz(0.2991) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
cx q[0], q[1];
rz(0.1433) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.1327) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1498) q[3];
cx q[0], q[3];

cx q[0], q[5];
rz(0.1241) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.1182) q[6];
cx q[0], q[6];

cx q[1], q[2];
rz(0.1379) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1553) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.1466) q[3];
cx q[2], q[3];

cx q[5], q[4];
rz(0.1291) q[4];
cx q[5], q[4];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.2898) q[0];
h q[0];

h q[1];
rz(0.2781) q[1];
h q[1];

h q[2];
rz(0.2876) q[2];
h q[2];

h q[3];
rz(0.2961) q[3];
h q[3];

h q[4];
rz(0.2671) q[4];
h q[4];

h q[5];
rz(0.2728) q[5];
h q[5];

h q[6];
rz(0.2617) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];