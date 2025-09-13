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
rz(0.1921) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1892) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1817) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1953) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.3876) q[1];
h q[1];
h q[2];
rz(0.4012) q[2];
h q[2];
h q[3];
rz(0.3958) q[3];
h q[3];
h q[4];
rz(0.4123) q[4];
h q[4];
h q[5];
rz(0.4367) q[5];
h q[5];
h q[6];
rz(0.4289) q[6];
h q[6];

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
rz(0.2137) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2089) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1741) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1883) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1779) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1634) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1752) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1683) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1808) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3917) q[0];
h q[0];
h q[1];
rz(0.3589) q[1];
h q[1];
h q[2];
rz(0.3714) q[2];
h q[2];
h q[3];
rz(0.3665) q[3];
h q[3];
h q[4];
rz(0.3818) q[4];
h q[4];
h q[5];
rz(0.4043) q[5];
h q[5];
h q[6];
rz(0.3971) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1836) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1706) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.1978) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1934) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1612) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1743) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1647) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1513) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1622) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1558) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1674) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3626) q[0];
h q[0];
h q[1];
rz(0.3322) q[1];
h q[1];
h q[2];
rz(0.3438) q[2];
h q[2];
h q[3];
rz(0.3393) q[3];
h q[3];
h q[4];
rz(0.3535) q[4];
h q[4];
h q[5];
rz(0.3743) q[5];
h q[5];
h q[6];
rz(0.3676) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];