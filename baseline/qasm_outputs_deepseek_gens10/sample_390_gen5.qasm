OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Edge interactions with optimal parameters
// Edge (0,1) weight 8
rz(0.64) q[0];
rz(0.64) q[1];
cx q[0], q[1];
rz(-0.64) q[1];
cx q[0], q[1];

// Edge (0,3) weight 16
rz(1.28) q[0];
rz(1.28) q[3];
cx q[0], q[3];
rz(-1.28) q[3];
cx q[0], q[3];

// Edge (0,5) weight 16
rz(1.28) q[0];
rz(1.28) q[5];
cx q[0], q[5];
rz(-1.28) q[5];
cx q[0], q[5];

// Edge (1,6) weight 20
rz(1.60) q[1];
rz(1.60) q[6];
cx q[1], q[6];
rz(-1.60) q[6];
cx q[1], q[6];

// Edge (2,3) weight 9
rz(0.72) q[2];
rz(0.72) q[3];
cx q[2], q[3];
rz(-0.72) q[3];
cx q[2], q[3];

// Edge (4,5) weight 3
rz(0.24) q[4];
rz(0.24) q[5];
cx q[4], q[5];
rz(-0.24) q[5];
cx q[4], q[5];

// Edge (4,6) weight 17
rz(1.36) q[4];
rz(1.36) q[6];
cx q[4], q[6];
rz(-1.36) q[6];
cx q[4], q[6];

// Edge (5,7) weight 20
rz(1.60) q[5];
rz(1.60) q[7];
cx q[5], q[7];
rz(-1.60) q[7];
cx q[5], q[7];

// Edge (6,7) weight 1
rz(0.08) q[6];
rz(0.08) q[7];
cx q[6], q[7];
rz(-0.08) q[7];
cx q[6], q[7];

// Layer 2: Mixing and optimization
rz(0.85) q[0];
rz(0.85) q[1];
rz(0.85) q[2];
rz(0.85) q[3];
rz(0.85) q[4];
rz(0.85) q[5];
rz(0.85) q[6];
rz(0.85) q[7];
rz(0.85) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 3: Final optimization and measurement preparation
rz(1.42) q[0];
rz(1.42) q[1];
rz(1.42) q[2];
rz(1.42) q[3];
rz(1.42) q[4];
rz(1.42) q[5];
rz(1.42) q[6];
rz(1.42) q[7];
rz(1.42) q[8];
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