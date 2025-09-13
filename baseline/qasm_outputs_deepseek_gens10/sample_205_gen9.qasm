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
rz(0.2198) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2265) q[4];
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
rz(0.4523) q[0];
h q[0];
h q[1];
rz(0.4378) q[1];
h q[1];
h q[2];
rz(0.4231) q[2];
h q[2];
h q[3];
rz(0.4689) q[3];
h q[3];
h q[4];
rz(0.4821) q[4];
h q[4];
h q[5];
rz(0.4015) q[5];
h q[5];
h q[6];
rz(0.3957) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1832) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2087) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2149) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1734) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1881) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2036) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2098) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1934) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1996) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2157) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1779) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1748) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4187) q[0];
h q[0];
h q[1];
rz(0.4051) q[1];
h q[1];
h q[2];
rz(0.3914) q[2];
h q[2];
h q[3];
rz(0.4342) q[3];
h q[3];
h q[4];
rz(0.4463) q[4];
h q[4];
h q[5];
rz(0.3712) q[5];
h q[5];
h q[6];
rz(0.3661) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1834) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1695) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1932) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1989) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1604) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1741) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1885) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1942) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1790) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1847) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1996) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1646) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1617) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3874) q[0];
h q[0];
h q[1];
rz(0.3748) q[1];
h q[1];
h q[2];
rz(0.3621) q[2];
h q[2];
h q[3];
rz(0.4019) q[3];
h q[3];
h q[4];
rz(0.4131) q[4];
h q[4];
h q[5];
rz(0.3434) q[5];
h q[5];
h q[6];
rz(0.3388) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1697) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1568) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1787) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1841) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1484) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1611) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1744) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1798) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1656) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1710) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1847) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1523) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1496) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.3584) q[0];
h q[0];
h q[1];
rz(0.3468) q[1];
h q[1];
h q[2];
rz(0.3351) q[2];
h q[2];
h q[3];
rz(0.3719) q[3];
h q[3];
h q[4];
rz(0.3822) q[4];
h q[4];
h q[5];
rz(0.3177) q[5];
h q[5];
h q[6];
rz(0.3135) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];