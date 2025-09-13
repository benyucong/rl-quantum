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

// Edge (1,2)
cx q[1], q[2];
rz(0.1832) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1978) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.2056) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1689) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1567) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1623) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.4321) q[0];
rx(0.3987) q[1];
rx(0.4123) q[2];
rx(0.3876) q[3];
rx(0.4012) q[4];
rx(0.4234) q[5];
rx(0.3956) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1987) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1724) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1845) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.1923) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1578) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1456) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1512) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.3876) q[0];
rx(0.3564) q[1];
rx(0.3721) q[2];
rx(0.3489) q[3];
rx(0.3623) q[4];
rx(0.3845) q[5];
rx(0.3578) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1834) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1621) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1723) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.1801) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1476) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1354) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1410) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.3543) q[0];
rx(0.3256) q[1];
rx(0.3421) q[2];
rx(0.3214) q[3];
rx(0.3345) q[4];
rx(0.3567) q[5];
rx(0.3309) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];