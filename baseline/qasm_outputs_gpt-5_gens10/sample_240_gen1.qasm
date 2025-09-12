OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// First Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Define entangling gates based on the edges
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[2], q[4];
cx q[3], q[5];

// Second Layer
rz(0.1234) q[0];
rz(0.5678) q[1];
rz(0.9101) q[2];
rz(0.1121) q[3];
rz(0.3141) q[4];
rz(0.5161) q[5];

// Apply last round of entangling gates
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[4];
cx q[3], q[5];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];