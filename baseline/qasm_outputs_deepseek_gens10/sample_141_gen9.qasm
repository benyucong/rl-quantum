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

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge (0,1)
cx q[0], q[1];
rz(0.214) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.183) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.197) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.225) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.168) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.142) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.156) q[6];
cx q[4], q[6];

// Layer 1 - Mixing Hamiltonian
rx(0.432) q[0];
rx(0.398) q[1];
rx(0.367) q[2];
rx(0.284) q[3];
rx(0.312) q[4];
rx(0.394) q[5];
rx(0.451) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.198) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.172) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.184) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.208) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.156) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.134) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.148) q[6];
cx q[4], q[6];

// Layer 2 - Mixing Hamiltonian
rx(0.387) q[0];
rx(0.362) q[1];
rx(0.341) q[2];
rx(0.267) q[3];
rx(0.289) q[4];
rx(0.358) q[5];
rx(0.412) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.182) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.161) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.171) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.191) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.144) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.126) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.140) q[6];
cx q[4], q[6];

// Layer 3 - Mixing Hamiltonian
rx(0.342) q[0];
rx(0.326) q[1];
rx(0.315) q[2];
rx(0.250) q[3];
rx(0.266) q[4];
rx(0.322) q[5];
rx(0.373) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];