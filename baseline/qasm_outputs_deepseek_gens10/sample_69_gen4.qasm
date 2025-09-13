OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Parameterized rotations for layer 1
rz(0.142) q[0];
rz(0.138) q[1];
rz(0.135) q[2];
rz(0.149) q[3];
rz(0.131) q[4];
rz(0.144) q[5];
rz(0.147) q[6];
rz(0.152) q[7];
rz(0.141) q[8];

// Problem Hamiltonian implementation for vertex cover
// Edge (0,3)
cx q[0], q[3];
rz(0.036) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.034) q[5];
cx q[0], q[5];

// Edge (0,8)
cx q[0], q[8];
rz(0.038) q[8];
cx q[0], q[8];

// Edge (1,3)
cx q[1], q[3];
rz(0.035) q[3];
cx q[1], q[3];

// Edge (1,7)
cx q[1], q[7];
rz(0.037) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.036) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.033) q[7];
cx q[2], q[7];

// Edge (2,8)
cx q[2], q[8];
rz(0.035) q[8];
cx q[2], q[8];

// Edge (3,6)
cx q[3], q[6];
rz(0.039) q[6];
cx q[3], q[6];

// Edge (3,7)
cx q[3], q[7];
rz(0.038) q[7];
cx q[3], q[7];

// Edge (4,6)
cx q[4], q[6];
rz(0.032) q[6];
cx q[4], q[6];

// Edge (5,7)
cx q[5], q[7];
rz(0.034) q[7];
cx q[5], q[7];

// Layer 2: Mixer Hamiltonian and final rotations
h q[0];
rz(0.071) q[0];
h q[0];
h q[1];
rz(0.069) q[1];
h q[1];
h q[2];
rz(0.068) q[2];
h q[2];
h q[3];
rz(0.075) q[3];
h q[3];
h q[4];
rz(0.066) q[4];
h q[4];
h q[5];
rz(0.072) q[5];
h q[5];
h q[6];
rz(0.074) q[6];
h q[6];
h q[7];
rz(0.076) q[7];
h q[7];
h q[8];
rz(0.071) q[8];
h q[8];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];