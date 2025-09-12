OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// First layer of gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[1]; // Edge (0, 1)
cx q[0], q[4]; // Edge (0, 4)
cx q[0], q[5]; // Edge (0, 5)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[1], q[4]; // Edge (1, 4)
cx q[1], q[5]; // Edge (1, 5)
cx q[2], q[4]; // Edge (2, 4)
cx q[3], q[4]; // Edge (3, 4)
cx q[3], q[5]; // Edge (3, 5)
cx q[4], q[5]; // Edge (4, 5)

// Second layer of gates (variational parameters can be adjusted)
rz(0.8134) q[0];
rz(0.5237) q[1];
rz(0.6821) q[2];
rz(0.4443) q[3];
rz(0.7122) q[4];
rz(0.9275) q[5];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];