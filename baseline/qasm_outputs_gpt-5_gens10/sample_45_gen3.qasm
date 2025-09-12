OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];

// First layer of entangling gates
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[3];
cx q[2], q[3];

// Second layer with rotation gates
rz(0.7854) q[0]; // Rotation for color encoding
rz(1.5708) q[1];
rz(2.3562) q[2];
rz(0.5236) q[3];

// Third layer of entangling gates
cx q[1], q[0];
cx q[2], q[1];
cx q[3], q[2];

// Fourth layer with additional rotation gates
rz(-0.7854) q[0];
rz(-1.5708) q[1];
rz(-2.3562) q[2];
rz(-0.5236) q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];