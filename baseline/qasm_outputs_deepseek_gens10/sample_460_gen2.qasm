OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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
h q[9];

// Layer 1: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.2251) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1832) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.2076) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1923) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2198) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1894) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2132) q[6];
cx q[4], q[6];

// Layer 1: Mixing
rx(0.1243) q[0];
rx(0.1327) q[1];
rx(0.1189) q[2];
rx(0.1076) q[3];
rx(0.1412) q[4];
rx(0.1158) q[5];
rx(0.1524) q[6];
rx(0.0987) q[7];
rx(0.1035) q[8];
rx(0.0963) q[9];

// Layer 2: Phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.1982) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1834) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.2087) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1691) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1925) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1779) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2036) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1632) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1753) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1974) q[6];
cx q[4], q[6];

// Layer 2: Mixing
rx(0.1152) q[0];
rx(0.1228) q[1];
rx(0.1101) q[2];
rx(0.0994) q[3];
rx(0.1307) q[4];
rx(0.1072) q[5];
rx(0.1411) q[6];
rx(0.0913) q[7];
rx(0.0958) q[8];
rx(0.0891) q[9];

// Layer 3: Phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.1832) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1696) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.1932) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1564) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1782) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1647) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1885) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1511) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1622) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1827) q[6];
cx q[4], q[6];

// Layer 3: Mixing
rx(0.1066) q[0];
rx(0.1136) q[1];
rx(0.1019) q[2];
rx(0.0920) q[3];
rx(0.1210) q[4];
rx(0.0992) q[5];
rx(0.1306) q[6];
rx(0.0845) q[7];
rx(0.0886) q[8];
rx(0.0825) q[9];

// Layer 4: Phase separation
// Edge (0,1)
cx q[0], q[1];
rz(0.1695) q[1];
cx q[0], q[1];
// Edge (0,4)
cx q[0], q[4];
rz(0.1570) q[4];
cx q[0], q[4];
// Edge (0,6)
cx q[0], q[6];
rz(0.1788) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1447) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1649) q[6];
cx q[1], q[6];
// Edge (2,5)
cx q[2], q[5];
rz(0.1524) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1744) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1398) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1501) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1691) q[6];
cx q[4], q[6];

// Layer 4: Final mixing
rx(0.0987) q[0];
rx(0.1052) q[1];
rx(0.0943) q[2];
rx(0.0851) q[3];
rx(0.1120) q[4];
rx(0.0918) q[5];
rx(0.1209) q[6];
rx(0.0782) q[7];
rx(0.0820) q[8];
rx(0.0763) q[9];

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
c[9] = measure q[9];