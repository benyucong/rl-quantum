OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2251) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.2033) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.1924) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.1876) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.1768) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.1892) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.1659) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.1723) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1815) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.1948) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.1687) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.1794) q[8];
cx q[7], q[8];

// Layer 1: Mixer unitary
rx(0.4231) q[0];
rx(0.4357) q[1];
rx(0.3982) q[2];
rx(0.4125) q[3];
rx(0.4298) q[4];
rx(0.4073) q[5];
rx(0.4169) q[6];
rx(0.4214) q[7];
rx(0.4326) q[8];

// Layer 2: Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.2087) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.1932) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2189) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.1976) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.1871) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.1824) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.1719) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.1839) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.1613) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.1675) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1765) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.1894) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.1640) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.1744) q[8];
cx q[7], q[8];

// Layer 2: Mixer unitary
rx(0.4114) q[0];
rx(0.4237) q[1];
rx(0.3872) q[2];
rx(0.4011) q[3];
rx(0.4179) q[4];
rx(0.3960) q[5];
rx(0.4053) q[6];
rx(0.4097) q[7];
rx(0.4206) q[8];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];