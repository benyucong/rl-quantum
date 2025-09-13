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
// Edge (0,4)
cx q[0], q[4];
rz(0.2231) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.1852) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2098) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.2317) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1923) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.2254) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2341) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.2189) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2296) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.2217) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.2368) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4523) q[0];
h q[0];
h q[1];
rz(0.4678) q[1];
h q[1];
h q[2];
rz(0.4891) q[2];
h q[2];
h q[3];
rz(0.4756) q[3];
h q[3];
h q[4];
rz(0.4612) q[4];
h q[4];
h q[5];
rz(0.4837) q[5];
h q[5];
h q[6];
rz(0.4924) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1841) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2057) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.1726) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1942) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.2143) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1789) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.2089) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2167) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.2028) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2125) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.2051) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.2192) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4187) q[0];
h q[0];
h q[1];
rz(0.4329) q[1];
h q[1];
h q[2];
rz(0.4526) q[2];
h q[2];
h q[3];
rz(0.4402) q[3];
h q[3];
h q[4];
rz(0.4268) q[4];
h q[4];
h q[5];
rz(0.4475) q[5];
h q[5];
h q[6];
rz(0.4558) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1708) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1905) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.1601) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1798) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1984) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1658) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1934) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2006) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1878) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1967) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1899) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.2029) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3876) q[0];
h q[0];
h q[1];
rz(0.4008) q[1];
h q[1];
h q[2];
rz(0.4191) q[2];
h q[2];
h q[3];
rz(0.4075) q[3];
h q[3];
h q[4];
rz(0.3952) q[4];
h q[4];
h q[5];
rz(0.4143) q[5];
h q[5];
h q[6];
rz(0.4221) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1701) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.1582) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1764) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.1483) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1665) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1837) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1535) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1791) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1858) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1739) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1821) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1758) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1878) q[6];
cx q[5], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];