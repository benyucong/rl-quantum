OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initialization and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem unitary (edge constraints)
// Edge 0-1
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.2231) q[4];
cx q[0], q[4];
// Edge 1-3
cx q[1], q[3];
rz(0.1869) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.2113) q[4];
cx q[1], q[4];
// Edge 1-6
cx q[1], q[6];
rz(0.2057) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1924) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.2089) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.2032) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.1976) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1918) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.2167) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.2014) q[6];
cx q[5], q[6];

// Layer 2 - Mixing
h q[0];
rz(0.4289) q[0];
h q[0];
h q[1];
rz(0.4135) q[1];
h q[1];
h q[2];
rz(0.4078) q[2];
h q[2];
h q[3];
rz(0.3973) q[3];
h q[3];
h q[4];
rz(0.4226) q[4];
h q[4];
h q[5];
rz(0.4178) q[5];
h q[5];
h q[6];
rz(0.4123) q[6];
h q[6];

// Layer 2 - Problem unitary
// Edge 0-1
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1842) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.2069) q[4];
cx q[0], q[4];
// Edge 1-3
cx q[1], q[3];
rz(0.1738) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.1964) q[4];
cx q[1], q[4];
// Edge 1-6
cx q[1], q[6];
rz(0.1912) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1787) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.1941) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.1887) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.1835) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1781) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.2013) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.1872) q[6];
cx q[5], q[6];

// Layer 3 - Mixing
h q[0];
rz(0.3978) q[0];
h q[0];
h q[1];
rz(0.3837) q[1];
h q[1];
h q[2];
rz(0.3786) q[2];
h q[2];
h q[3];
rz(0.3689) q[3];
h q[3];
h q[4];
rz(0.3924) q[4];
h q[4];
h q[5];
rz(0.3879) q[5];
h q[5];
h q[6];
rz(0.3828) q[6];
h q[6];

// Layer 3 - Problem unitary
// Edge 0-1
cx q[0], q[1];
rz(0.1839) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1709) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.1921) q[4];
cx q[0], q[4];
// Edge 1-3
cx q[1], q[3];
rz(0.1613) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.1823) q[4];
cx q[1], q[4];
// Edge 1-6
cx q[1], q[6];
rz(0.1775) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1658) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.1802) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.1751) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.1703) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1653) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.1868) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.1737) q[6];
cx q[5], q[6];

// Layer 4 - Mixing
h q[0];
rz(0.3692) q[0];
h q[0];
h q[1];
rz(0.3561) q[1];
h q[1];
h q[2];
rz(0.3513) q[2];
h q[2];
h q[3];
rz(0.3423) q[3];
h q[3];
h q[4];
rz(0.3641) q[4];
h q[4];
h q[5];
rz(0.3599) q[5];
h q[5];
h q[6];
rz(0.3552) q[6];
h q[6];

// Layer 4 - Problem unitary
// Edge 0-1
cx q[0], q[1];
rz(0.1707) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1586) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.1783) q[4];
cx q[0], q[4];
// Edge 1-3
cx q[1], q[3];
rz(0.1497) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.1692) q[4];
cx q[1], q[4];
// Edge 1-6
cx q[1], q[6];
rz(0.1647) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1538) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.1672) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.1625) q[6];
cx q[2], q[6];
// Edge 3-5
cx q[3], q[5];
rz(0.1580) q[5];
cx q[3], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1534) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.1733) q[5];
cx q[4], q[5];
// Edge 5-6
cx q[5], q[6];
rz(0.1612) q[6];
cx q[5], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];