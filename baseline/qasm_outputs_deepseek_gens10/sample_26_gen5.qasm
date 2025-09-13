OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem unitary for vertex cover
// Edge (0,6)
cx q[0], q[6];
rz(0.2145) q[6];
cx q[0], q[6];
// Edge (1,6)
cx q[1], q[6];
rz(0.1987) q[6];
cx q[1], q[6];
// Edge (1,7)
cx q[1], q[7];
rz(0.2031) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.1923) q[8];
cx q[1], q[8];
// Edge (2,7)
cx q[2], q[7];
rz(0.1876) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.1765) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1892) q[5];
cx q[4], q[5];
// Edge (4,7)
cx q[4], q[7];
rz(0.2018) q[7];
cx q[4], q[7];
// Edge (4,8)
cx q[4], q[8];
rz(0.1954) q[8];
cx q[4], q[8];
// Edge (5,6)
cx q[5], q[6];
rz(0.2089) q[6];
cx q[5], q[6];
// Edge (6,8)
cx q[6], q[8];
rz(0.1972) q[8];
cx q[6], q[8];

// Layer 1: Mixer unitary
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];
rx(0.5236) q[8];

// Layer 2: Problem unitary
// Edge (0,6)
cx q[0], q[6];
rz(0.3218) q[6];
cx q[0], q[6];
// Edge (1,6)
cx q[1], q[6];
rz(0.2981) q[6];
cx q[1], q[6];
// Edge (1,7)
cx q[1], q[7];
rz(0.3047) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.2885) q[8];
cx q[1], q[8];
// Edge (2,7)
cx q[2], q[7];
rz(0.2814) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.2648) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.2838) q[5];
cx q[4], q[5];
// Edge (4,7)
cx q[4], q[7];
rz(0.3027) q[7];
cx q[4], q[7];
// Edge (4,8)
cx q[4], q[8];
rz(0.2931) q[8];
cx q[4], q[8];
// Edge (5,6)
cx q[5], q[6];
rz(0.3134) q[6];
cx q[5], q[6];
// Edge (6,8)
cx q[6], q[8];
rz(0.2958) q[8];
cx q[6], q[8];

// Layer 2: Mixer unitary
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];
rx(0.7854) q[8];

// Layer 3: Problem unitary
// Edge (0,6)
cx q[0], q[6];
rz(0.4290) q[6];
cx q[0], q[6];
// Edge (1,6)
cx q[1], q[6];
rz(0.3975) q[6];
cx q[1], q[6];
// Edge (1,7)
cx q[1], q[7];
rz(0.4062) q[7];
cx q[1], q[7];
// Edge (1,8)
cx q[1], q[8];
rz(0.3846) q[8];
cx q[1], q[8];
// Edge (2,7)
cx q[2], q[7];
rz(0.3752) q[7];
cx q[2], q[7];
// Edge (3,5)
cx q[3], q[5];
rz(0.3530) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.3784) q[5];
cx q[4], q[5];
// Edge (4,7)
cx q[4], q[7];
rz(0.4036) q[7];
cx q[4], q[7];
// Edge (4,8)
cx q[4], q[8];
rz(0.3908) q[8];
cx q[4], q[8];
// Edge (5,6)
cx q[5], q[6];
rz(0.4178) q[6];
cx q[5], q[6];
// Edge (6,8)
cx q[6], q[8];
rz(0.3944) q[8];
cx q[6], q[8];

// Layer 3: Mixer unitary
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];
rx(1.0472) q[8];

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