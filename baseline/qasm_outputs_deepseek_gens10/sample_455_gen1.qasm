OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initial Hadamard and problem-specific unitaries
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
h q[11];
h q[12];

// Edge interaction terms (layer 1)
// Edge (0,4)
cx q[0], q[4];
rz(0.2145) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1732) q[2];
cx q[1], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.2251) q[4];
cx q[1], q[4];

// Edge (1,6)
cx q[1], q[6];
rz(0.2068) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1893) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.2317) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.2174) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.2229) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.2036) q[4];
cx q[3], q[4];

// Edge (3,6)
cx q[3], q[6];
rz(0.1958) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.2112) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.2283) q[6];
cx q[4], q[6];

// Layer 2: Mixing terms
h q[0];
rz(0.4321) q[0];
h q[0];

h q[1];
rz(0.4157) q[1];
h q[1];

h q[2];
rz(0.3982) q[2];
h q[2];

h q[3];
rz(0.4219) q[3];
h q[3];

h q[4];
rz(0.4463) q[4];
h q[4];

h q[5];
rz(0.4298) q[5];
h q[5];

h q[6];
rz(0.4376) q[6];
h q[6];

h q[7];
rz(0.4085) q[7];
h q[7];

h q[8];
rz(0.4123) q[8];
h q[8];

h q[9];
rz(0.4197) q[9];
h q[9];

h q[10];
rz(0.4254) q[10];
h q[10];

h q[11];
rz(0.4312) q[11];
h q[11];

h q[12];
rz(0.4238) q[12];
h q[12];

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
c[11] = measure q[11];
c[12] = measure q[12];