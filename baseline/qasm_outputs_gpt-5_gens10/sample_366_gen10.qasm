OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// First Layer
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1];
cx q[1], q[3];
cx q[0], q[2];

// Second Layer
rx(1.5708) q[0]; // π/2 rotation
rx(1.0472) q[1]; // π/3 rotation
rx(0.7854) q[2]; // π/4 rotation
rx(0.5236) q[3]; // π/6 rotation
rz(0.1) q[0];
rz(0.1) q[1];
rz(0.1) q[2];
rz(0.1) q[3];

// Third Layer
cx q[2], q[3];
cx q[1], q[3];
cx q[1], q[2];
h q[0];
h q[1];
h q[2];
h q[3];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];