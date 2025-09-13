OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled rotations based on edge weights
// Edge (0,3) weight=2
crz(0.3927) q[0], q[3];
// Edge (0,6) weight=20
crz(3.927) q[0], q[6];
// Edge (1,4) weight=5
crz(0.9817) q[1], q[4];
// Edge (1,6) weight=20
crz(3.927) q[1], q[6];
// Edge (1,3) weight=12
crz(2.3562) q[1], q[3];
// Edge (2,5) weight=2
crz(0.3927) q[2], q[5];
// Edge (2,3) weight=11
crz(2.1598) q[2], q[3];
// Edge (2,4) weight=13
crz(2.5536) q[2], q[4];

// Layer 2: Mixing and optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Second layer of controlled rotations
crz(0.7854) q[0], q[3];
crz(7.854) q[0], q[6];
crz(1.9635) q[1], q[4];
crz(7.854) q[1], q[6];
crz(4.7124) q[1], q[3];
crz(0.7854) q[2], q[5];
crz(4.3197) q[2], q[3];
crz(5.1072) q[2], q[4];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];