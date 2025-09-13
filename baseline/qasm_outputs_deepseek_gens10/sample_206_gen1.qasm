OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First QAOA layer - Mixer
rz(0.0) q[0];
rz(0.0) q[1];
rz(0.0) q[2];
rz(0.0) q[3];
rz(0.0) q[4];
rz(0.0) q[5];
rz(0.0) q[6];
rz(0.0) q[7];

// First QAOA layer - Cost Hamiltonian
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.628) q[1];
cx q[0], q[1];

// Edge (1,2) weight=11
cx q[1], q[2];
rz(1.727) q[2];
cx q[1], q[2];

// Edge (1,3) weight=20
cx q[1], q[3];
rz(3.142) q[3];
cx q[1], q[3];

// Edge (1,5) weight=17
cx q[1], q[5];
rz(2.670) q[5];
cx q[1], q[5];

// Edge (2,3) weight=3
cx q[2], q[3];
rz(0.471) q[3];
cx q[2], q[3];

// Edge (2,5) weight=18
cx q[2], q[5];
rz(2.827) q[5];
cx q[2], q[5];

// Edge (4,5) weight=10
cx q[4], q[5];
rz(1.571) q[5];
cx q[4], q[5];

// Edge (4,6) weight=14
cx q[4], q[6];
rz(2.199) q[6];
cx q[4], q[6];

// Second QAOA layer - Mixer
h q[0];
rz(0.785) q[0];
h q[0];
h q[1];
rz(0.785) q[1];
h q[1];
h q[2];
rz(0.785) q[2];
h q[2];
h q[3];
rz(0.785) q[3];
h q[3];
h q[4];
rz(0.785) q[4];
h q[4];
h q[5];
rz(0.785) q[5];
h q[5];
h q[6];
rz(0.785) q[6];
h q[6];
h q[7];
rz(0.785) q[7];
h q[7];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.628) q[1];
cx q[0], q[1];

// Edge (1,2) weight=11
cx q[1], q[2];
rz(1.727) q[2];
cx q[1], q[2];

// Edge (1,3) weight=20
cx q[1], q[3];
rz(3.142) q[3];
cx q[1], q[3];

// Edge (1,5) weight=17
cx q[1], q[5];
rz(2.670) q[5];
cx q[1], q[5];

// Edge (2,3) weight=3
cx q[2], q[3];
rz(0.471) q[3];
cx q[2], q[3];

// Edge (2,5) weight=18
cx q[2], q[5];
rz(2.827) q[5];
cx q[2], q[5];

// Edge (4,5) weight=10
cx q[4], q[5];
rz(1.571) q[5];
cx q[4], q[5];

// Edge (4,6) weight=14
cx q[4], q[6];
rz(2.199) q[6];
cx q[4], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];