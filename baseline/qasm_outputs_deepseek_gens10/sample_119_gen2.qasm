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

// Layer 1 - Problem Hamiltonian
// Edge (0,1) weight=5
cx q[0], q[7];
rz(0.625) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.625) q[7];
cx q[1], q[7];

// Edge (0,2) weight=14
cx q[0], q[7];
rz(1.75) q[7];
cx q[0], q[7];
cx q[2], q[7];
rz(1.75) q[7];
cx q[2], q[7];

// Edge (0,6) weight=19
cx q[0], q[7];
rz(2.375) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(2.375) q[7];
cx q[6], q[7];

// Edge (1,4) weight=14
cx q[1], q[7];
rz(1.75) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(1.75) q[7];
cx q[4], q[7];

// Edge (2,3) weight=4
cx q[2], q[7];
rz(0.5) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.5) q[7];
cx q[3], q[7];

// Edge (3,6) weight=20
cx q[3], q[7];
rz(2.5) q[7];
cx q[3], q[7];
cx q[6], q[7];
rz(2.5) q[7];
cx q[6], q[7];

// Edge (3,4) weight=12
cx q[3], q[7];
rz(1.5) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(1.5) q[7];
cx q[4], q[7];

// Edge (4,5) weight=9
cx q[4], q[7];
rz(1.125) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(1.125) q[7];
cx q[5], q[7];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.7854) q[0];
h q[0];
h q[1];
rz(0.7854) q[1];
h q[1];
h q[2];
rz(0.7854) q[2];
h q[2];
h q[3];
rz(0.7854) q[3];
h q[3];
h q[4];
rz(0.7854) q[4];
h q[4];
h q[5];
rz(0.7854) q[5];
h q[5];
h q[6];
rz(0.7854) q[6];
h q[6];
h q[7];
rz(0.7854) q[7];
h q[7];

// Layer 3 - Problem Hamiltonian (repeated with optimized parameters)
// Edge (0,1) weight=5
cx q[0], q[7];
rz(0.3125) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.3125) q[7];
cx q[1], q[7];

// Edge (0,2) weight=14
cx q[0], q[7];
rz(0.875) q[7];
cx q[0], q[7];
cx q[2], q[7];
rz(0.875) q[7];
cx q[2], q[7];

// Edge (0,6) weight=19
cx q[0], q[7];
rz(1.1875) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(1.1875) q[7];
cx q[6], q[7];

// Edge (1,4) weight=14
cx q[1], q[7];
rz(0.875) q[7];
cx q[1], q[7];
cx q[4], q[7];
rz(0.875) q[7];
cx q[4], q[7];

// Edge (2,3) weight=4
cx q[2], q[7];
rz(0.25) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.25) q[7];
cx q[3], q[7];

// Edge (3,6) weight=20
cx q[3], q[7];
rz(1.25) q[7];
cx q[3], q[7];
cx q[6], q[7];
rz(1.25) q[7];
cx q[6], q[7];

// Edge (3,4) weight=12
cx q[3], q[7];
rz(0.75) q[7];
cx q[3], q[7];
cx q[4], q[7];
rz(0.75) q[7];
cx q[4], q[7];

// Edge (4,5) weight=9
cx q[4], q[7];
rz(0.5625) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.5625) q[7];
cx q[5], q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];