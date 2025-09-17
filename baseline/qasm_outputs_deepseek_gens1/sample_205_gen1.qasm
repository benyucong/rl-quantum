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
// Edge (0,2)
cx q[0], q[2];
rz(0.1987) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2251) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2318) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1876) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.2034) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2197) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2263) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.2089) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.2156) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2327) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1923) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1891) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.4178) q[1];
h q[1];
h q[2];
rz(0.4125) q[2];
h q[2];
h q[3];
rz(0.4289) q[3];
h q[3];
h q[4];
rz(0.4312) q[4];
h q[4];
h q[5];
rz(0.4012) q[5];
h q[5];
h q[6];
rz(0.3987) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1834) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2082) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2143) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1732) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1879) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2031) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2092) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1931) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1992) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2151) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1776) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1748) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3912) q[0];
h q[0];
h q[1];
rz(0.3862) q[1];
h q[1];
h q[2];
rz(0.3814) q[2];
h q[2];
h q[3];
rz(0.3963) q[3];
h q[3];
h q[4];
rz(0.3984) q[4];
h q[4];
h q[5];
rz(0.3708) q[5];
h q[5];
h q[6];
rz(0.3685) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1832) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1695) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1924) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1981) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1601) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1737) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1877) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1934) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1785) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1842) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1989) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1642) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1616) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3615) q[0];
h q[0];
h q[1];
rz(0.3569) q[1];
h q[1];
h q[2];
rz(0.3524) q[2];
h q[2];
h q[3];
rz(0.3662) q[3];
h q[3];
h q[4];
rz(0.3681) q[4];
h q[4];
h q[5];
rz(0.3427) q[5];
h q[5];
h q[6];
rz(0.3406) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1693) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1566) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1778) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1831) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1479) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1605) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1735) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1788) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1650) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1703) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1838) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1518) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1493) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.3341) q[0];
h q[0];
h q[1];
rz(0.3299) q[1];
h q[1];
h q[2];
rz(0.3257) q[2];
h q[2];
h q[3];
rz(0.3384) q[3];
h q[3];
h q[4];
rz(0.3401) q[4];
h q[4];
h q[5];
rz(0.3167) q[5];
h q[5];
h q[6];
rz(0.3148) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];