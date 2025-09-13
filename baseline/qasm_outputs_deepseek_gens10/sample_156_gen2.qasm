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

// Layer 1: Mixer unitary
rx(0.4231) q[0];
rx(0.4231) q[1];
rx(0.4231) q[2];
rx(0.4231) q[3];
rx(0.4231) q[4];
rx(0.4231) q[5];
rx(0.4231) q[6];

// Layer 2: Problem unitary
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
rz(0.2091) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1738) q[4];
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
rz(0.1753) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1685) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1812) q[6];
cx q[5], q[6];

// Layer 2: Mixer unitary
rx(0.3917) q[0];
rx(0.3917) q[1];
rx(0.3917) q[2];
rx(0.3917) q[3];
rx(0.3917) q[4];
rx(0.3917) q[5];
rx(0.3917) q[6];

// Layer 3: Problem unitary
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
rz(0.1979) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1936) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1609) q[4];
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
rz(0.1623) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1560) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1677) q[6];
cx q[5], q[6];

// Layer 3: Mixer unitary
rx(0.3626) q[0];
rx(0.3626) q[1];
rx(0.3626) q[2];
rx(0.3626) q[3];
rx(0.3626) q[4];
rx(0.3626) q[5];
rx(0.3626) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];