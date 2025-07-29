OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Initialize left nodes
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Initialize right nodes
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];

// Apply matching constraints based on edge weights
// Edge 0-7 (weight 4)
rz(0.04) q[0];
rz(0.04) q[7];
cx q[0], q[7];
rz(-0.04) q[7];
cx q[0], q[7];

// Edge 0-9 (weight 19)
rz(0.19) q[0];
rz(0.19) q[9];
cx q[0], q[9];
rz(-0.19) q[9];
cx q[0], q[9];

// Edge 0-12 (weight 17)
rz(0.17) q[0];
rz(0.17) q[12];
cx q[0], q[12];
rz(-0.17) q[12];
cx q[0], q[12];

// Edge 1-8 (weight 6)
rz(0.06) q[1];
rz(0.06) q[8];
cx q[1], q[8];
rz(-0.06) q[8];
cx q[1], q[8];

// Edge 2-9 (weight 5)
rz(0.05) q[2];
rz(0.05) q[9];
cx q[2], q[9];
rz(-0.05) q[9];
cx q[2], q[9];

// Edge 2-12 (weight 12)
rz(0.12) q[2];
rz(0.12) q[12];
cx q[2], q[12];
rz(-0.12) q[12];
cx q[2], q[12];

// Edge 3-10 (weight 7)
rz(0.07) q[3];
rz(0.07) q[10];
cx q[3], q[10];
rz(-0.07) q[10];
cx q[3], q[10];

// Edge 4-11 (weight 2)
rz(0.02) q[4];
rz(0.02) q[11];
cx q[4], q[11];
rz(-0.02) q[11];
cx q[4], q[11];

// Edge 4-7 (weight 15)
rz(0.15) q[4];
rz(0.15) q[7];
cx q[4], q[7];
rz(-0.15) q[7];
cx q[4], q[7];

// Edge 5-12 (weight 4)
rz(0.04) q[5];
rz(0.04) q[12];
cx q[5], q[12];
rz(-0.04) q[12];
cx q[5], q[12];

// Edge 6-13 (weight 9)
rz(0.09) q[6];
rz(0.09) q[13];
cx q[6], q[13];
rz(-0.09) q[13];
cx q[6], q[13];

// Edge 6-9 (weight 15)
rz(0.15) q[6];
rz(0.15) q[9];
cx q[6], q[9];
rz(-0.15) q[9];
cx q[6], q[9];

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
c[13] = measure q[13];