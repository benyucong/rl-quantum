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

// Layer 2: Encoded operations according to the matching problem weights
// Couplings based on the edges given in the matching problem
cx q[0], q[1]; // Edge (0, 1) with weight 4
rz(0.2240) q[1];
cx q[0], q[1];

cx q[0], q[7]; // Edge (0, 7) with weight 11
rz(0.2240) q[7];
cx q[0], q[7];

cx q[1], q[4]; // Edge (1, 4) with weight 20
rz(0.2240) q[4];
cx q[1], q[4];

cx q[1], q[7]; // Edge (1, 7) with weight 15
rz(0.2240) q[7];
cx q[1], q[7];

cx q[2], q[3]; // Edge (2, 3) with weight 9
rz(0.2240) q[3];
cx q[2], q[3];

cx q[2], q[4]; // Edge (2, 4) with weight 15
rz(0.2240) q[4];
cx q[2], q[4];

cx q[3], q[5]; // Edge (3, 5) with weight 13
rz(0.2240) q[5];
cx q[3], q[5];

cx q[4], q[5]; // Edge (4, 5) with weight 10
rz(0.2240) q[5];
cx q[4], q[5];

cx q[6], q[7]; // Edge (6, 7) with weight 7
rz(0.2240) q[7];
cx q[6], q[7];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];