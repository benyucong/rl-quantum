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
// Edge (0,2)
cx q[0], q[2];
rz(0.214) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.198) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.225) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.231) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.208) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.192) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.205) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.423) q[0];
h q[0];

h q[1];
rz(0.436) q[1];
h q[1];

h q[2];
rz(0.411) q[2];
h q[2];

h q[3];
rz(0.398) q[3];
h q[3];

h q[4];
rz(0.429) q[4];
h q[4];

h q[5];
rz(0.445) q[5];
h q[5];

h q[6];
rz(0.432) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.312) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.298) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.325) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.331) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.308) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.292) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.305) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.523) q[0];
h q[0];

h q[1];
rz(0.536) q[1];
h q[1];

h q[2];
rz(0.511) q[2];
h q[2];

h q[3];
rz(0.498) q[3];
h q[3];

h q[4];
rz(0.529) q[4];
h q[4];

h q[5];
rz(0.545) q[5];
h q[5];

h q[6];
rz(0.532) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.412) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.398) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.425) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.431) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.408) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.392) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.405) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.623) q[0];
h q[0];

h q[1];
rz(0.636) q[1];
h q[1];

h q[2];
rz(0.611) q[2];
h q[2];

h q[3];
rz(0.598) q[3];
h q[3];

h q[4];
rz(0.629) q[4];
h q[4];

h q[5];
rz(0.645) q[5];
h q[5];

h q[6];
rz(0.632) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];