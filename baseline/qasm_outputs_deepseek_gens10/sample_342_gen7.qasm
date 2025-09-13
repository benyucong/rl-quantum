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

// Edge cost phase encoding
// Edge (0,1) weight=5
cx q[0], q[8];
rz(0.15625) q[8];
cx q[0], q[8];
cx q[1], q[8];
rz(0.15625) q[8];
cx q[1], q[8];

// Edge (1,4) weight=13
cx q[1], q[8];
rz(0.40625) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(0.40625) q[8];
cx q[4], q[8];

// Edge (1,2) weight=18
cx q[1], q[8];
rz(0.5625) q[8];
cx q[1], q[8];
cx q[2], q[8];
rz(0.5625) q[8];
cx q[2], q[8];

// Edge (2,3) weight=10
cx q[2], q[8];
rz(0.3125) q[8];
cx q[2], q[8];
cx q[3], q[8];
rz(0.3125) q[8];
cx q[3], q[8];

// Edge (2,6) weight=14
cx q[2], q[8];
rz(0.4375) q[8];
cx q[2], q[8];
cx q[6], q[8];
rz(0.4375) q[8];
cx q[6], q[8];

// Edge (2,7) weight=11
cx q[2], q[8];
rz(0.34375) q[8];
cx q[2], q[8];
cx q[7], q[8];
rz(0.34375) q[8];
cx q[7], q[8];

// Edge (4,5) weight=2
cx q[4], q[8];
rz(0.0625) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.0625) q[8];
cx q[5], q[8];

// Edge (5,6) weight=19
cx q[5], q[8];
rz(0.59375) q[8];
cx q[5], q[8];
cx q[6], q[8];
rz(0.59375) q[8];
cx q[6], q[8];

// Edge (6,7) weight=1
cx q[6], q[8];
rz(0.03125) q[8];
cx q[6], q[8];
cx q[7], q[8];
rz(0.03125) q[8];
cx q[7], q[8];

// Layer 2: Mixing and optimization
// Mixing layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Final cost function phase
rz(0.7854) q[8];

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