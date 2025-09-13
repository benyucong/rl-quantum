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
// Edge (0,3)
cx q[0], q[3];
rz(0.214) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.312) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.278) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.189) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.156) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.245) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.201) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.523) q[0];
h q[0];
h q[1];
rz(0.467) q[1];
h q[1];
h q[2];
rz(0.398) q[2];
h q[2];
h q[3];
rz(0.612) q[3];
h q[3];
h q[4];
rz(0.589) q[4];
h q[4];
h q[5];
rz(0.734) q[5];
h q[5];
h q[6];
rz(0.655) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.178) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.267) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.231) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.154) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.132) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.201) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.167) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.412) q[0];
h q[0];
h q[1];
rz(0.378) q[1];
h q[1];
h q[2];
rz(0.321) q[2];
h q[2];
h q[3];
rz(0.498) q[3];
h q[3];
h q[4];
rz(0.476) q[4];
h q[4];
h q[5];
rz(0.612) q[5];
h q[5];
h q[6];
rz(0.534) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.145) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.223) q[5];
cx q[0], q[5];
// Edge (0,6)
cx q[0], q[6];
rz(0.198) q[6];
cx q[0], q[6];
// Edge (1,5)
cx q[1], q[5];
rz(0.132) q[5];
cx q[1], q[5];
// Edge (2,3)
cx q[2], q[3];
rz(0.115) q[3];
cx q[2], q[3];
// Edge (4,5)
cx q[4], q[5];
rz(0.178) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.145) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.334) q[0];
h q[0];
h q[1];
rz(0.312) q[1];
h q[1];
h q[2];
rz(0.267) q[2];
h q[2];
h q[3];
rz(0.412) q[3];
h q[3];
h q[4];
rz(0.389) q[4];
h q[4];
h q[5];
rz(0.523) q[5];
h q[5];
h q[6];
rz(0.445) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];