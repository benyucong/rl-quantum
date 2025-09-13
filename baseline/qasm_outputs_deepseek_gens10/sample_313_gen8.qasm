OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2251) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1923) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1836) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2079) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1764) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1952) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1891) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1818) q[6];
cx q[4], q[6];

// Layer 1: Mixer unitary
rx(0.4236) q[0];
rx(0.4236) q[1];
rx(0.4236) q[2];
rx(0.4236) q[3];
rx(0.4236) q[4];
rx(0.4236) q[5];
rx(0.4236) q[6];

// Layer 2: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1982) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1841) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2083) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1782) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1701) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1927) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1634) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1808) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1752) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1684) q[6];
cx q[4], q[6];

// Layer 2: Mixer unitary
rx(0.3921) q[0];
rx(0.3921) q[1];
rx(0.3921) q[2];
rx(0.3921) q[3];
rx(0.3921) q[4];
rx(0.3921) q[5];
rx(0.3921) q[6];

// Layer 3: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1835) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1706) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1930) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1651) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1576) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1785) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1514) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1675) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1623) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1560) q[6];
cx q[4], q[6];

// Layer 3: Mixer unitary
rx(0.3632) q[0];
rx(0.3632) q[1];
rx(0.3632) q[2];
rx(0.3632) q[3];
rx(0.3632) q[4];
rx(0.3632) q[5];
rx(0.3632) q[6];

// Layer 4: Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1700) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1581) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.1788) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1530) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1460) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1654) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.1403) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1552) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1504) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1445) q[6];
cx q[4], q[6];

// Layer 4: Mixer unitary
rx(0.3365) q[0];
rx(0.3365) q[1];
rx(0.3365) q[2];
rx(0.3365) q[3];
rx(0.3365) q[4];
rx(0.3365) q[5];
rx(0.3365) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];