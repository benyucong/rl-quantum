OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize and create entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[2]; // Edge (0, 2)
cx q[0], q[5]; // Edge (0, 5)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[7]; // Edge (1, 7)
cx q[2], q[3]; // Edge (2, 3)
cx q[2], q[6]; // Edge (2, 6)
cx q[3], q[4]; // Edge (3, 4)
cx q[4], q[5]; // Edge (4, 5)
cx q[5], q[8]; // Edge (5, 8)
cx q[6], q[7]; // Edge (6, 7)
cx q[6], q[8]; // Edge (6, 8)

// Layer 2: Apply rotation gates for optimization
rx(2.35) q[0];
ry(1.47) q[1];
rz(1.25) q[2];
rx(2.10) q[3];
ry(1.97) q[4];
rz(1.32) q[5];
rx(2.45) q[6];
ry(1.70) q[7];
rz(1.20) q[8];

// Measure
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];