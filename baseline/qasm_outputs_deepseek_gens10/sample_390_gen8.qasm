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

// Edge (0,1) with weight 8
rz(0.16) q[0];
rz(0.16) q[1];
cx q[0], q[1];
rz(-0.16) q[1];
cx q[0], q[1];

// Edge (0,3) with weight 16
rz(0.32) q[0];
rz(0.32) q[3];
cx q[0], q[3];
rz(-0.32) q[3];
cx q[0], q[3];

// Edge (0,5) with weight 16
rz(0.32) q[0];
rz(0.32) q[5];
cx q[0], q[5];
rz(-0.32) q[5];
cx q[0], q[5];

// Edge (1,6) with weight 20
rz(0.40) q[1];
rz(0.40) q[6];
cx q[1], q[6];
rz(-0.40) q[6];
cx q[1], q[6];

// Edge (2,3) with weight 9
rz(0.18) q[2];
rz(0.18) q[3];
cx q[2], q[3];
rz(-0.18) q[3];
cx q[2], q[3];

// Edge (4,5) with weight 3
rz(0.06) q[4];
rz(0.06) q[5];
cx q[4], q[5];
rz(-0.06) q[5];
cx q[4], q[5];

// Edge (4,6) with weight 17
rz(0.34) q[4];
rz(0.34) q[6];
cx q[4], q[6];
rz(-0.34) q[6];
cx q[4], q[6];

// Edge (5,7) with weight 20
rz(0.40) q[5];
rz(0.40) q[7];
cx q[5], q[7];
rz(-0.40) q[7];
cx q[5], q[7];

// Edge (6,7) with weight 1
rz(0.02) q[6];
rz(0.02) q[7];
cx q[6], q[7];
rz(-0.02) q[7];
cx q[6], q[7];

// Layer 2: Mixing and optimization
rx(1.57) q[0];
rx(1.57) q[1];
rx(1.57) q[2];
rx(1.57) q[3];
rx(1.57) q[4];
rx(1.57) q[5];
rx(1.57) q[6];
rx(1.57) q[7];
rx(1.57) q[8];

// Layer 3: Final optimization and measurement
rz(0.85) q[0];
rz(0.92) q[1];
rz(0.78) q[2];
rz(0.95) q[3];
rz(0.81) q[4];
rz(0.97) q[5];
rz(0.93) q[6];
rz(0.88) q[7];
rz(0.75) q[8];
rx(0.42) q[0];
rx(0.38) q[1];
rx(0.45) q[2];
rx(0.36) q[3];
rx(0.44) q[4];
rx(0.35) q[5];
rx(0.37) q[6];
rx(0.39) q[7];
rx(0.46) q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];