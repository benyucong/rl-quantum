OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.229) q[2];
rz(0.186) q[3];
rz(0.143) q[4];
rz(0.100) q[5];
rz(0.057) q[6];
rz(0.014) q[7];

// Layer 1: Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.125) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.125) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.125) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.125) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.125) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.125) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.125) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.125) q[4];
cx q[3], q[4];

// Layer 2: Mixing and parameterized rotations
rx(0.471) q[0];
rx(0.408) q[1];
rx(0.345) q[2];
rx(0.282) q[3];
rx(0.219) q[4];
rx(0.156) q[5];
rx(0.093) q[6];
rx(0.030) q[7];

// Layer 2: Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.094) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.094) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.094) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.094) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.094) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.094) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.094) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.094) q[4];
cx q[3], q[4];

// Layer 3: Final mixing and parameterized rotations
rx(0.628) q[0];
rx(0.545) q[1];
rx(0.462) q[2];
rx(0.379) q[3];
rx(0.296) q[4];
rx(0.213) q[5];
rx(0.130) q[6];
rx(0.047) q[7];

// Layer 3: Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.063) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.063) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.063) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.063) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.063) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.063) q[4];
cx q[1], q[4];
// Edge (2,4)
cx q[2], q[4];
rz(0.063) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.063) q[4];
cx q[3], q[4];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];