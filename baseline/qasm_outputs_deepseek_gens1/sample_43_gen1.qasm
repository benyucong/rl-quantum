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
rz(0.159) q[1];
rz(0.265) q[2];
rz(0.358) q[3];
rz(0.979) q[4];
rz(0.323) q[5];
rz(0.846) q[6];
rz(0.264) q[7];

// Layer 2: Edge interactions and rotations
// Edge (0,1) weight 3
cx q[0], q[1];
rz(0.094) q[1];
cx q[0], q[1];
// Edge (0,5) weight 14
cx q[0], q[5];
rz(0.420) q[5];
cx q[0], q[5];
// Edge (1,4) weight 15
cx q[1], q[4];
rz(0.450) q[4];
cx q[1], q[4];
// Edge (1,3) weight 11
cx q[1], q[3];
rz(0.330) q[3];
cx q[1], q[3];
// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.300) q[3];
cx q[2], q[3];
// Edge (4,5) weight 6
cx q[4], q[5];
rz(0.180) q[5];
cx q[4], q[5];
// Edge (4,6) weight 20
cx q[4], q[6];
rz(0.600) q[6];
cx q[4], q[6];
// Edge (5,6) weight 16
cx q[5], q[6];
rz(0.480) q[6];
cx q[5], q[6];
rz(0.271) q[0];
rz(0.138) q[1];
rz(0.229) q[2];
rz(0.309) q[3];
rz(0.845) q[4];
rz(0.279) q[5];
rz(0.731) q[6];
rz(0.228) q[7];

// Layer 3: Edge interactions and rotations
// Edge (0,1) weight 3
cx q[0], q[1];
rz(0.081) q[1];
cx q[0], q[1];
// Edge (0,5) weight 14
cx q[0], q[5];
rz(0.363) q[5];
cx q[0], q[5];
// Edge (1,4) weight 15
cx q[1], q[4];
rz(0.389) q[4];
cx q[1], q[4];
// Edge (1,3) weight 11
cx q[1], q[3];
rz(0.285) q[3];
cx q[1], q[3];
// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.259) q[3];
cx q[2], q[3];
// Edge (4,5) weight 6
cx q[4], q[5];
rz(0.156) q[5];
cx q[4], q[5];
// Edge (4,6) weight 20
cx q[4], q[6];
rz(0.519) q[6];
cx q[4], q[6];
// Edge (5,6) weight 16
cx q[5], q[6];
rz(0.415) q[6];
cx q[5], q[6];
rz(0.234) q[0];
rz(0.119) q[1];
rz(0.198) q[2];
rz(0.267) q[3];
rz(0.730) q[4];
rz(0.241) q[5];
rz(0.632) q[6];
rz(0.197) q[7];

// Layer 4: Final edge interactions and rotations
// Edge (0,1) weight 3
cx q[0], q[1];
rz(0.070) q[1];
cx q[0], q[1];
// Edge (0,5) weight 14
cx q[0], q[5];
rz(0.314) q[5];
cx q[0], q[5];
// Edge (1,4) weight 15
cx q[1], q[4];
rz(0.336) q[4];
cx q[1], q[4];
// Edge (1,3) weight 11
cx q[1], q[3];
rz(0.246) q[3];
cx q[1], q[3];
// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.224) q[3];
cx q[2], q[3];
// Edge (4,5) weight 6
cx q[4], q[5];
rz(0.135) q[5];
cx q[4], q[5];
// Edge (4,6) weight 20
cx q[4], q[6];
rz(0.449) q[6];
cx q[4], q[6];
// Edge (5,6) weight 16
cx q[5], q[6];
rz(0.359) q[6];
cx q[5], q[6];
rz(0.202) q[0];
rz(0.103) q[1];
rz(0.171) q[2];
rz(0.231) q[3];
rz(0.631) q[4];
rz(0.208) q[5];
rz(0.546) q[6];
rz(0.170) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];