OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem unitary for vertex cover
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.2251) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.2318) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2432) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.2076) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2193) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1924) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2357) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.2289) q[6];
cx q[5], q[6];

// Layer 1 - Mixer unitary
rx(1.4823) q[0];
rx(1.4967) q[1];
rx(1.4731) q[2];
rx(1.4892) q[3];
rx(1.4678) q[4];
rx(1.4519) q[5];
rx(1.5034) q[6];

// Layer 2 - Problem unitary
// Edge (0,2)
cx q[0], q[2];
rz(0.1982) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1841) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.2087) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.2149) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2254) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.1923) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2032) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1783) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2184) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.2121) q[6];
cx q[5], q[6];

// Layer 2 - Mixer unitary
rx(1.5237) q[0];
rx(1.5374) q[1];
rx(1.5142) q[2];
rx(1.5298) q[3];
rx(1.5089) q[4];
rx(1.4936) q[5];
rx(1.5441) q[6];

// Layer 3 - Problem unitary
// Edge (0,2)
cx q[0], q[2];
rz(0.1836) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1706) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.1934) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.1992) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2089) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.1782) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1883) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1652) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.2024) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1965) q[6];
cx q[5], q[6];

// Layer 3 - Mixer unitary
rx(1.5618) q[0];
rx(1.5748) q[1];
rx(1.5529) q[2];
rx(1.5672) q[3];
rx(1.5476) q[4];
rx(1.5331) q[5];
rx(1.5815) q[6];

// Layer 4 - Problem unitary
// Edge (0,2)
cx q[0], q[2];
rz(0.1701) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1581) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.1792) q[2];
cx q[1], q[2];
// Edge (1,4)
cx q[1], q[4];
rz(0.1846) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1936) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.1651) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1745) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1531) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1875) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1821) q[6];
cx q[5], q[6];

// Layer 4 - Mixer unitary
rx(1.5967) q[0];
rx(1.6089) q[1];
rx(1.5884) q[2];
rx(1.6013) q[3];
rx(1.5831) q[4];
rx(1.5694) q[5];
rx(1.6156) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];