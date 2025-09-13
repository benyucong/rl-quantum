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
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2145) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.2145) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];
// Edge (1,3)
cx q[1], q[3];
rz(0.1428) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.1428) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1428) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.1428) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1428) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1428) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.1428) q[5];
cx q[4], q[5];
// Edge (5,6)
cx q[5], q[6];
rz(0.1428) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(1.428) q[0];
rx(1.428) q[1];
rx(1.428) q[2];
rx(1.428) q[3];
rx(1.428) q[4];
rx(1.428) q[5];
rx(1.428) q[6];

// Layer 2 - Problem Hamiltonian
cx q[0], q[1];
rz(0.1928) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.1928) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1928) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.1928) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(0.1928) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.1928) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1285) q[3];
cx q[1], q[3];
cx q[1], q[6];
rz(0.1285) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.1285) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.1285) q[5];
cx q[2], q[5];
cx q[2], q[6];
rz(0.1285) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.1285) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1285) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.1285) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.285) q[0];
rx(1.285) q[1];
rx(1.285) q[2];
rx(1.285) q[3];
rx(1.285) q[4];
rx(1.285) q[5];
rx(1.285) q[6];

// Layer 3 - Problem Hamiltonian
cx q[0], q[1];
rz(0.1736) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.1736) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1736) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.1736) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(0.1736) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.1736) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1157) q[3];
cx q[1], q[3];
cx q[1], q[6];
rz(0.1157) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.1157) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.1157) q[5];
cx q[2], q[5];
cx q[2], q[6];
rz(0.1157) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.1157) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1157) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.1157) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.157) q[0];
rx(1.157) q[1];
rx(1.157) q[2];
rx(1.157) q[3];
rx(1.157) q[4];
rx(1.157) q[5];
rx(1.157) q[6];

// Layer 4 - Problem Hamiltonian
cx q[0], q[1];
rz(0.1562) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.1562) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.1562) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.1562) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(0.1562) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.1562) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1041) q[3];
cx q[1], q[3];
cx q[1], q[6];
rz(0.1041) q[6];
cx q[1], q[6];
cx q[2], q[3];
rz(0.1041) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(0.1041) q[5];
cx q[2], q[5];
cx q[2], q[6];
rz(0.1041) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.1041) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1041) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(0.1041) q[6];
cx q[5], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];