OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

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
h q[9];
h q[10];

// Edge interaction terms (layer 1)
// Edge 0-1
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];

// Edge 0-3
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];

// Edge 0-4
cx q[0], q[9];
rz(0.2312) q[9];
cx q[0], q[9];

// Edge 0-5
cx q[0], q[10];
rz(0.2256) q[10];
cx q[0], q[10];

// Edge 0-6
cx q[0], q[1];
rz(0.2089) q[1];
cx q[0], q[1];

// Edge 1-2
cx q[1], q[2];
rz(0.1923) q[2];
cx q[1], q[2];

// Edge 1-4
cx q[1], q[4];
rz(0.2034) q[4];
cx q[1], q[4];

// Edge 2-3
cx q[2], q[3];
rz(0.1876) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.1967) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.1892) q[6];
cx q[2], q[6];

// Edge 4-6
cx q[4], q[6];
rz(0.2118) q[6];
cx q[4], q[6];

// Layer 2: Mixing terms
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.3854) q[2];
h q[2];
h q[3];
rz(0.3769) q[3];
h q[3];
h q[4];
rz(0.4123) q[4];
h q[4];
h q[5];
rz(0.4012) q[5];
h q[5];
h q[6];
rz(0.3945) q[6];
h q[6];
h q[7];
rz(0.4289) q[7];
h q[7];
h q[8];
rz(0.3976) q[8];
h q[8];
h q[9];
rz(0.4318) q[9];
h q[9];
h q[10];
rz(0.4267) q[10];
h q[10];

// Layer 3: Final edge interactions
// Edge 0-1
cx q[0], q[7];
rz(0.3218) q[7];
cx q[0], q[7];

// Edge 0-3
cx q[0], q[8];
rz(0.2981) q[8];
cx q[0], q[8];

// Edge 0-4
cx q[0], q[9];
rz(0.3468) q[9];
cx q[0], q[9];

// Edge 0-5
cx q[0], q[10];
rz(0.3384) q[10];
cx q[0], q[10];

// Edge 0-6
cx q[0], q[1];
rz(0.3134) q[1];
cx q[0], q[1];

// Edge 1-2
cx q[1], q[2];
rz(0.2885) q[2];
cx q[1], q[2];

// Edge 1-4
cx q[1], q[4];
rz(0.3051) q[4];
cx q[1], q[4];

// Edge 2-3
cx q[2], q[3];
rz(0.2814) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.2951) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.2838) q[6];
cx q[2], q[6];

// Edge 4-6
cx q[4], q[6];
rz(0.3177) q[6];
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
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];