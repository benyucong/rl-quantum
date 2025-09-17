OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

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
h q[9];
h q[10];

// First QAOA layer - Cost Hamiltonian
// Edge (0,1)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];
// Edge (0,4)
cx q[0], q[7];
rz(0.1987) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.2031) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.1872) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.1924) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[7];
rz(0.2056) q[7];
cx q[1], q[7];
// Edge (1,5)
cx q[1], q[8];
rz(0.2113) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[7];
rz(0.1895) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[7];
rz(0.1968) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[8];
rz(0.2022) q[8];
cx q[3], q[8];
// Edge (4,5)
cx q[4], q[8];
rz(0.2087) q[8];
cx q[4], q[8];

// First QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.4231) q[1];
h q[1];
h q[2];
rz(0.4231) q[2];
h q[2];
h q[3];
rz(0.4231) q[3];
h q[3];
h q[4];
rz(0.4231) q[4];
h q[4];
h q[5];
rz(0.4231) q[5];
h q[5];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,1)
cx q[0], q[6];
rz(0.3218) q[6];
cx q[0], q[6];
// Edge (0,4)
cx q[0], q[7];
rz(0.2981) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.3047) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.2808) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.2886) q[10];
cx q[1], q[10];
// Edge (1,4)
cx q[1], q[7];
rz(0.3084) q[7];
cx q[1], q[7];
// Edge (1,5)
cx q[1], q[8];
rz(0.3170) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[7];
rz(0.2843) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[7];
rz(0.2952) q[7];
cx q[3], q[7];
// Edge (3,5)
cx q[3], q[8];
rz(0.3033) q[8];
cx q[3], q[8];
// Edge (4,5)
cx q[4], q[8];
rz(0.3131) q[8];
cx q[4], q[8];

// Second QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.6347) q[0];
h q[0];
h q[1];
rz(0.6347) q[1];
h q[1];
h q[2];
rz(0.6347) q[2];
h q[2];
h q[3];
rz(0.6347) q[3];
h q[3];
h q[4];
rz(0.6347) q[4];
h q[4];
h q[5];
rz(0.6347) q[5];
h q[5];

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
c[9] = measure q[9];
c[10] = measure q[10];