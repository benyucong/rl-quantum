OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem Hamiltonian (edge constraints)
// Edge (0,1)
cx q[0], q[5];
rz(0.2145) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(0.2145) q[5];
cx q[1], q[5];

// Edge (0,3)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];
cx q[3], q[6];
rz(0.1987) q[6];
cx q[3], q[6];

// Edge (0,4)
cx q[0], q[7];
rz(0.2312) q[7];
cx q[0], q[7];
cx q[4], q[7];
rz(0.2312) q[7];
cx q[4], q[7];

// Edge (1,2)
cx q[1], q[5];
rz(0.1876) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(0.1876) q[5];
cx q[2], q[5];

// Edge (1,3)
cx q[1], q[6];
rz(0.2053) q[6];
cx q[1], q[6];
cx q[3], q[6];
rz(0.2053) q[6];
cx q[3], q[6];

// Edge (1,4)
cx q[1], q[7];
rz(0.1924) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(0.1924) q[7];
cx q[4], q[7];

// Edge (2,4)
cx q[2], q[7];
rz(0.1768) q[7];
cx q[2], q[7];
cx q[4], q[7];
rz(0.1768) q[7];
cx q[4], q[7];

// Edge (3,4)
cx q[3], q[7];
rz(0.1891) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(0.1891) q[7];
cx q[4], q[7];

// Layer 1: Mixing Hamiltonian
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

// Layer 2: Problem Hamiltonian
// Edge (0,1)
cx q[0], q[5];
rz(0.3218) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(0.3218) q[5];
cx q[1], q[5];

// Edge (0,3)
cx q[0], q[6];
rz(0.2981) q[6];
cx q[0], q[6];
cx q[3], q[6];
rz(0.2981) q[6];
cx q[3], q[6];

// Edge (0,4)
cx q[0], q[7];
rz(0.3468) q[7];
cx q[0], q[7];
cx q[4], q[7];
rz(0.3468) q[7];
cx q[4], q[7];

// Edge (1,2)
cx q[1], q[5];
rz(0.2814) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(0.2814) q[5];
cx q[2], q[5];

// Edge (1,3)
cx q[1], q[6];
rz(0.3080) q[6];
cx q[1], q[6];
cx q[3], q[6];
rz(0.3080) q[6];
cx q[3], q[6];

// Edge (1,4)
cx q[1], q[7];
rz(0.2886) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(0.2886) q[7];
cx q[4], q[7];

// Edge (2,4)
cx q[2], q[7];
rz(0.2652) q[7];
cx q[2], q[7];
cx q[4], q[7];
rz(0.2652) q[7];
cx q[4], q[7];

// Edge (3,4)
cx q[3], q[7];
rz(0.2837) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(0.2837) q[7];
cx q[4], q[7];

// Layer 2: Mixing Hamiltonian
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

// Layer 3: Problem Hamiltonian
// Edge (0,1)
cx q[0], q[5];
rz(0.4827) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(0.4827) q[5];
cx q[1], q[5];

// Edge (0,3)
cx q[0], q[6];
rz(0.4472) q[6];
cx q[0], q[6];
cx q[3], q[6];
rz(0.4472) q[6];
cx q[3], q[6];

// Edge (0,4)
cx q[0], q[7];
rz(0.5202) q[7];
cx q[0], q[7];
cx q[4], q[7];
rz(0.5202) q[7];
cx q[4], q[7];

// Edge (1,2)
cx q[1], q[5];
rz(0.4221) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(0.4221) q[5];
cx q[2], q[5];

// Edge (1,3)
cx q[1], q[6];
rz(0.4620) q[6];
cx q[1], q[6];
cx q[3], q[6];
rz(0.4620) q[6];
cx q[3], q[6];

// Edge (1,4)
cx q[1], q[7];
rz(0.4329) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(0.4329) q[7];
cx q[4], q[7];

// Edge (2,4)
cx q[2], q[7];
rz(0.3978) q[7];
cx q[2], q[7];
cx q[4], q[7];
rz(0.3978) q[7];
cx q[4], q[7];

// Edge (3,4)
cx q[3], q[7];
rz(0.4256) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(0.4256) q[7];
cx q[4], q[7];

// Layer 3: Final mixing
h q[0];
rz(0.8462) q[0];
h q[0];
h q[1];
rz(0.8462) q[1];
h q[1];
h q[2];
rz(0.8462) q[2];
h q[2];
h q[3];
rz(0.8462) q[3];
h q[3];
h q[4];
rz(0.8462) q[4];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];