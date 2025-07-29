OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1 - Initialization and first mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1 - Problem unitary (edges)
// Edge 0-5 (weight 8)
cx q[0], q[5];
rz(0.16) q[5];
cx q[0], q[5];
// Edge 1-6 (weight 1)
cx q[1], q[6];
rz(0.02) q[6];
cx q[1], q[6];
// Edge 1-5 (weight 15)
cx q[1], q[5];
rz(0.3) q[5];
cx q[1], q[5];
// Edge 2-7 (weight 7)
cx q[2], q[7];
rz(0.14) q[7];
cx q[2], q[7];
// Edge 2-8 (weight 14)
cx q[2], q[8];
rz(0.28) q[8];
cx q[2], q[8];
// Edge 2-6 (weight 17)
cx q[2], q[6];
rz(0.34) q[6];
cx q[2], q[6];
// Edge 3-8 (weight 1)
cx q[3], q[8];
rz(0.02) q[8];
cx q[3], q[8];
// Edge 3-7 (weight 19)
cx q[3], q[7];
rz(0.38) q[7];
cx q[3], q[7];
// Edge 3-5 (weight 11)
cx q[3], q[5];
rz(0.22) q[5];
cx q[3], q[5];

// Layer 2 - Mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2 - Problem unitary (edges)
// Edge 0-5 (weight 8)
cx q[0], q[5];
rz(0.24) q[5];
cx q[0], q[5];
// Edge 1-6 (weight 1)
cx q[1], q[6];
rz(0.03) q[6];
cx q[1], q[6];
// Edge 1-5 (weight 15)
cx q[1], q[5];
rz(0.45) q[5];
cx q[1], q[5];
// Edge 2-7 (weight 7)
cx q[2], q[7];
rz(0.21) q[7];
cx q[2], q[7];
// Edge 2-8 (weight 14)
cx q[2], q[8];
rz(0.42) q[8];
cx q[2], q[8];
// Edge 2-6 (weight 17)
cx q[2], q[6];
rz(0.51) q[6];
cx q[2], q[6];
// Edge 3-8 (weight 1)
cx q[3], q[8];
rz(0.03) q[8];
cx q[3], q[8];
// Edge 3-7 (weight 19)
cx q[3], q[7];
rz(0.57) q[7];
cx q[3], q[7];
// Edge 3-5 (weight 11)
cx q[3], q[5];
rz(0.33) q[5];
cx q[3], q[5];

// Layer 3 - Final mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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