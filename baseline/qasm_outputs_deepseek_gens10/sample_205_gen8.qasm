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
rz(0.2322) q[4];
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
rx(1.4832) q[0];
rx(1.4765) q[1];
rx(1.4921) q[2];
rx(1.4689) q[3];
rx(1.4623) q[4];
rx(1.5018) q[5];
rx(1.5047) q[6];

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
rz(0.2081) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2143) q[4];
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
rz(0.2032) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2094) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.1932) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1994) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2147) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1778) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1748) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.3678) q[0];
rx(1.3621) q[1];
rx(1.3789) q[2];
rx(1.3567) q[3];
rx(1.3512) q[4];
rx(1.3865) q[5];
rx(1.3892) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1832) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1693) q[2];
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
rz(0.1602) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1738) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1878) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1935) q[4];
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
rz(0.1984) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1643) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1615) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.2629) q[0];
rx(1.2581) q[1];
rx(1.2736) q[2];
rx(1.2532) q[3];
rx(1.2486) q[4];
rx(1.2801) q[5];
rx(1.2825) q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1693) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1564) q[2];
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
rz(0.1480) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1606) q[2];
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
rz(0.1649) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1702) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.1833) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1518) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1492) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
rx(1.1658) q[0];
rx(1.1618) q[1];
rx(1.1759) q[2];
rx(1.1573) q[3];
rx(1.1533) q[4];
rx(1.1815) q[5];
rx(1.1836) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];