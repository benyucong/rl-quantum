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
rz(0.1832) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1765) q[6];
cx q[0], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1523) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1689) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1427) q[6];
cx q[2], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1358) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1294) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1921) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1783) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1645) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1582) q[6];
cx q[0], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1367) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1514) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1281) q[6];
cx q[2], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1219) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1161) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.6981) q[0];
rx(0.6981) q[1];
rx(0.6981) q[2];
rx(0.6981) q[3];
rx(0.6981) q[4];
rx(0.6981) q[5];
rx(0.6981) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1723) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1598) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1476) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1418) q[6];
cx q[0], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1225) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1357) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1148) q[6];
cx q[2], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1093) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1041) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.6109) q[0];
rx(0.6109) q[1];
rx(0.6109) q[2];
rx(0.6109) q[3];
rx(0.6109) q[4];
rx(0.6109) q[5];
rx(0.6109) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];