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
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];

// Edge (0,7)
cx q[0], q[7];
rz(0.2251) q[7];
cx q[0], q[7];

// Edge (1,3)
cx q[1], q[3];
rz(0.1832) q[3];
cx q[1], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1924) q[4];
cx q[2], q[4];

// Edge (3,4)
cx q[3], q[4];
rz(0.1768) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.2053) q[5];
cx q[4], q[5];

// Edge (5,8)
cx q[5], q[8];
rz(0.2219) q[8];
cx q[5], q[8];

// Edge (6,7)
cx q[6], q[7];
rz(0.1896) q[7];
cx q[6], q[7];

// Edge (6,8)
cx q[6], q[8];
rz(0.1972) q[8];
cx q[6], q[8];

// First QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];

h q[1];
rz(0.4156) q[1];
h q[1];

h q[2];
rz(0.3987) q[2];
h q[2];

h q[3];
rz(0.4213) q[3];
h q[3];

h q[4];
rz(0.4098) q[4];
h q[4];

h q[5];
rz(0.4267) q[5];
h q[5];

h q[6];
rz(0.4032) q[6];
h q[6];

h q[7];
rz(0.4189) q[7];
h q[7];

h q[8];
rz(0.4115) q[8];
h q[8];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1873) q[1];
cx q[0], q[1];

// Edge (0,3)
cx q[0], q[3];
rz(0.1732) q[3];
cx q[0], q[3];

// Edge (0,7)
cx q[0], q[7];
rz(0.1968) q[7];
cx q[0], q[7];

// Edge (1,3)
cx q[1], q[3];
rz(0.1594) q[3];
cx q[1], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1681) q[4];
cx q[2], q[4];

// Edge (3,4)
cx q[3], q[4];
rz(0.1542) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1793) q[5];
cx q[4], q[5];

// Edge (5,8)
cx q[5], q[8];
rz(0.1937) q[8];
cx q[5], q[8];

// Edge (6,7)
cx q[6], q[7];
rz(0.1658) q[7];
cx q[6], q[7];

// Edge (6,8)
cx q[6], q[8];
rz(0.1721) q[8];
cx q[6], q[8];

// Second QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.3784) q[0];
h q[0];

h q[1];
rz(0.3629) q[1];
h q[1];

h q[2];
rz(0.3482) q[2];
h q[2];

h q[3];
rz(0.3681) q[3];
h q[3];

h q[4];
rz(0.3578) q[4];
h q[4];

h q[5];
rz(0.3726) q[5];
h q[5];

h q[6];
rz(0.3521) q[6];
h q[6];

h q[7];
rz(0.3659) q[7];
h q[7];

h q[8];
rz(0.3594) q[8];
h q[8];

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