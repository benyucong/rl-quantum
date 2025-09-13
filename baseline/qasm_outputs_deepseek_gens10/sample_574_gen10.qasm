OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First QAOA layer - Problem Hamiltonian
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
rz(0.2198) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.1924) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.2087) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.2019) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.1865) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.1792) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.2113) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.1956) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.1838) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.1891) q[8];
cx q[7], q[8];

// First QAOA layer - Mixer Hamiltonian
rx(0.4321) q[0];
rx(0.4321) q[1];
rx(0.4321) q[2];
rx(0.4321) q[3];
rx(0.4321) q[4];
rx(0.4321) q[5];
rx(0.4321) q[6];
rx(0.4321) q[7];
rx(0.4321) q[8];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.1983) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.1842) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2089) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.1887) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.2039) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.1785) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.1936) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.1873) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.1731) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.1663) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1961) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.1814) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.1705) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.1754) q[8];
cx q[7], q[8];

// Second QAOA layer - Mixer Hamiltonian
rx(0.4012) q[0];
rx(0.4012) q[1];
rx(0.4012) q[2];
rx(0.4012) q[3];
rx(0.4012) q[4];
rx(0.4012) q[5];
rx(0.4012) q[6];
rx(0.4012) q[7];
rx(0.4012) q[8];

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