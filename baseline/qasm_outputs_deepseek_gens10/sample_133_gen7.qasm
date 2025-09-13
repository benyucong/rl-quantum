OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edges)
// Edge (0,3)
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.228) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.221) q[6];
cx q[0], q[6];

// Edge (1,5)
cx q[1], q[5];
rz(0.192) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.205) q[3];
cx q[2], q[3];

// Edge (4,5)
cx q[4], q[5];
rz(0.198) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.211) q[6];
cx q[4], q[6];

// Layer 1 - Mixing Hamiltonian
h q[0];
rz(0.436) q[0];
h q[0];

h q[1];
rz(0.436) q[1];
h q[1];

h q[2];
rz(0.436) q[2];
h q[2];

h q[3];
rz(0.436) q[3];
h q[3];

h q[4];
rz(0.436) q[4];
h q[4];

h q[5];
rz(0.436) q[5];
h q[5];

h q[6];
rz(0.436) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.187) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.201) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.194) q[6];
cx q[0], q[6];

// Edge (1,5)
cx q[1], q[5];
rz(0.168) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.179) q[3];
cx q[2], q[3];

// Edge (4,5)
cx q[4], q[5];
rz(0.173) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.185) q[6];
cx q[4], q[6];

// Layer 2 - Mixing Hamiltonian
h q[0];
rz(0.382) q[0];
h q[0];

h q[1];
rz(0.382) q[1];
h q[1];

h q[2];
rz(0.382) q[2];
h q[2];

h q[3];
rz(0.382) q[3];
h q[3];

h q[4];
rz(0.382) q[4];
h q[4];

h q[5];
rz(0.382) q[5];
h q[5];

h q[6];
rz(0.382) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.163) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.176) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.169) q[6];
cx q[0], q[6];

// Edge (1,5)
cx q[1], q[5];
rz(0.147) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.156) q[3];
cx q[2], q[3];

// Edge (4,5)
cx q[4], q[5];
rz(0.151) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.162) q[6];
cx q[4], q[6];

// Layer 3 - Mixing Hamiltonian
h q[0];
rz(0.334) q[0];
h q[0];

h q[1];
rz(0.334) q[1];
h q[1];

h q[2];
rz(0.334) q[2];
h q[2];

h q[3];
rz(0.334) q[3];
h q[3];

h q[4];
rz(0.334) q[4];
h q[4];

h q[5];
rz(0.334) q[5];
h q[5];

h q[6];
rz(0.334) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];