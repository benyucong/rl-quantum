OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.2251) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1923) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.1839) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.2076) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.1764) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.1892) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.1689) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.1953) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.1721) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.1815) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.1847) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.1978) q[6];
cx q[4], q[6];

// Mixer unitary layer 1
rx(1.4231) q[0];
rx(1.3857) q[1];
rx(1.4019) q[2];
rx(1.3672) q[3];
rx(1.4125) q[4];
rx(1.3783) q[5];
rx(1.3946) q[6];

// Layer 2
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1841) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.2087) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1782) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.1705) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.1924) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.1637) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.1753) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.1564) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.1812) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.1596) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.1683) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.1712) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.1834) q[6];
cx q[4], q[6];

// Mixer unitary layer 2
rx(1.3178) q[0];
rx(1.2845) q[1];
rx(1.2992) q[2];
rx(1.2679) q[3];
rx(1.3094) q[4];
rx(1.2776) q[5];
rx(1.2923) q[6];

// Layer 3
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1706) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.1934) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1652) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.1581) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.1783) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.1517) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.1624) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.1449) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.1679) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.1479) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.1559) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.1586) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.1699) q[6];
cx q[4], q[6];

// Mixer unitary layer 3
rx(1.2209) q[0];
rx(1.1903) q[1];
rx(1.2037) q[2];
rx(1.1748) q[3];
rx(1.2129) q[4];
rx(1.1834) q[5];
rx(1.1968) q[6];

// Layer 4
// Problem unitary for edge (0,1)
cx q[0], q[1];
rz(0.1702) q[1];
cx q[0], q[1];

// Problem unitary for edge (0,3)
cx q[0], q[3];
rz(0.1581) q[3];
cx q[0], q[3];

// Problem unitary for edge (0,4)
cx q[0], q[4];
rz(0.1792) q[4];
cx q[0], q[4];

// Problem unitary for edge (0,6)
cx q[0], q[6];
rz(0.1531) q[6];
cx q[0], q[6];

// Problem unitary for edge (1,3)
cx q[1], q[3];
rz(0.1465) q[3];
cx q[1], q[3];

// Problem unitary for edge (1,4)
cx q[1], q[4];
rz(0.1652) q[4];
cx q[1], q[4];

// Problem unitary for edge (1,5)
cx q[1], q[5];
rz(0.1405) q[5];
cx q[1], q[5];

// Problem unitary for edge (1,6)
cx q[1], q[6];
rz(0.1505) q[6];
cx q[1], q[6];

// Problem unitary for edge (2,3)
cx q[2], q[3];
rz(0.1342) q[3];
cx q[2], q[3];

// Problem unitary for edge (2,4)
cx q[2], q[4];
rz(0.1555) q[4];
cx q[2], q[4];

// Problem unitary for edge (2,5)
cx q[2], q[5];
rz(0.1370) q[5];
cx q[2], q[5];

// Problem unitary for edge (3,6)
cx q[3], q[6];
rz(0.1444) q[6];
cx q[3], q[6];

// Problem unitary for edge (4,5)
cx q[4], q[5];
rz(0.1469) q[5];
cx q[4], q[5];

// Problem unitary for edge (4,6)
cx q[4], q[6];
rz(0.1574) q[6];
cx q[4], q[6];

// Mixer unitary layer 4
rx(1.1312) q[0];
rx(1.1029) q[1];
rx(1.1151) q[2];
rx(1.0883) q[3];
rx(1.1238) q[4];
rx(1.0967) q[5];
rx(1.1089) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];