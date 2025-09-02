OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Applying controlled operations based on the edges
cx q[0], q[1]; // Edge (0, 1)
cx q[0], q[7]; // Edge (0, 7)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[1], q[6]; // Edge (1, 6)
cx q[2], q[3]; // Edge (2, 3)
cx q[2], q[4]; // Edge (2, 4)
cx q[3], q[6]; // Edge (3, 6)
cx q[5], q[3]; // Edge (5, 3)
cx q[6], q[4]; // Edge (6, 4)

// Layer 2: Applying rotation gates to encode strengths of edges
rz(0.1) q[0];
rz(0.2) q[1];
rz(0.3) q[2];
rz(0.1) q[3];
rz(0.2) q[4];
rz(0.5) q[5];
rz(0.4) q[6];
rz(0.3) q[7];

// Final Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];