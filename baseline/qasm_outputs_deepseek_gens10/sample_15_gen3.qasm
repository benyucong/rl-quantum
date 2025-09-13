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
// Edge (0,6)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1234) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1876) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1765) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1654) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2019) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1543) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1892) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4123) q[2];
h q[2];
h q[3];
rz(0.4456) q[3];
h q[3];
h q[4];
rz(0.3876) q[4];
h q[4];
h q[5];
rz(0.4012) q[5];
h q[5];
h q[6];
rz(0.4234) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1983) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1845) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1156) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1732) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1634) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1541) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1876) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1432) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1754) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3987) q[0];
h q[0];
h q[1];
rz(0.3678) q[1];
h q[1];
h q[2];
rz(0.3812) q[2];
h q[2];
h q[3];
rz(0.4123) q[3];
h q[3];
h q[4];
rz(0.3567) q[4];
h q[4];
h q[5];
rz(0.3712) q[5];
h q[5];
h q[6];
rz(0.3921) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1832) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1712) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1087) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1601) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1512) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1432) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1743) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1321) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1623) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3678) q[0];
h q[0];
h q[1];
rz(0.3391) q[1];
h q[1];
h q[2];
rz(0.3512) q[2];
h q[2];
h q[3];
rz(0.3812) q[3];
h q[3];
h q[4];
rz(0.3289) q[4];
h q[4];
h q[5];
rz(0.3423) q[5];
h q[5];
h q[6];
rz(0.3621) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];