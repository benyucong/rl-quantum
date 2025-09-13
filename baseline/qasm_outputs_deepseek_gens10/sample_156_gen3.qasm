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

// Layer 1 - Problem unitary
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
rz(0.1967) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1753) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1892) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1826) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1948) q[6];
cx q[5], q[6];

// Layer 1 - Mixer unitary
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
rz(0.3957) q[3];
h q[3];
h q[4];
rz(0.4123) q[4];
h q[4];
h q[5];
rz(0.4289) q[5];
h q[5];
h q[6];
rz(0.4198) q[6];
h q[6];

// Layer 2 - Problem unitary
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
rz(0.1821) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1624) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1752) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1691) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1804) q[6];
cx q[5], q[6];

// Layer 2 - Mixer unitary
h q[0];
rz(0.3918) q[0];
h q[0];
h q[1];
rz(0.3592) q[1];
h q[1];
h q[2];
rz(0.3716) q[2];
h q[2];
h q[3];
rz(0.3665) q[3];
h q[3];
h q[4];
rz(0.3819) q[4];
h q[4];
h q[5];
rz(0.3972) q[5];
h q[5];
h q[6];
rz(0.3889) q[6];
h q[6];

// Layer 3 - Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1708) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.1979) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.1935) q[6];
cx q[0], q[6];
// Edge (2,4)
cx q[2], q[4];
rz(0.1613) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1745) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1687) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1505) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.1623) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1567) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.1671) q[6];
cx q[5], q[6];

// Layer 3 - Mixer unitary
h q[0];
rz(0.3629) q[0];
h q[0];
h q[1];
rz(0.3327) q[1];
h q[1];
h q[2];
rz(0.3442) q[2];
h q[2];
h q[3];
rz(0.3395) q[3];
h q[3];
h q[4];
rz(0.3537) q[4];
h q[4];
h q[5];
rz(0.3679) q[5];
h q[5];
h q[6];
rz(0.3602) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];