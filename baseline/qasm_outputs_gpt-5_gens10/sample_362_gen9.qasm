OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Encoding edges
cx q[0], q[3]; // from 0 to 3
rz(1.0472) q[3]; // adjusting phase
cx q[1], q[4]; // from 1 to 4
rz(1.0472) q[4]; // adjusting phase
cx q[0], q[5]; // from 0 to 5
rz(0.7854) q[5]; // adjusting phase
cx q[2], q[4]; // from 2 to 4
rz(1.5708) q[4]; // adjusting phase
cx q[2], q[5]; // from 2 to 5
rz(0.7854) q[5]; // adjusting phase
cx q[2], q[3]; // from 2 to 3
rz(1.5708) q[3]; // adjusting phase
cx q[2], q[7]; // from 2 to 7
rz(1.5708) q[7]; // adjusting phase

// Layer 2: Encoded interaction
h q[0];
cx q[0], q[4]; // coupled
h q[1];
cx q[1], q[5]; // coupled
h q[2];
cx q[2], q[6]; // coupled
h q[3];
cx q[3], q[7]; // coupled
rz(-0.5236) q[4]; // adjusting phase
rz(-0.5236) q[5]; // adjusting phase
rz(-0.5236) q[6]; // adjusting phase
rz(-0.5236) q[7]; // adjusting phase

// Layer 3: Final measurement encoding
h q[4];
cx q[4], q[0]; // final interaction
h q[5];
cx q[5], q[1]; // final interaction
h q[6];
cx q[6], q[2]; // final interaction
h q[7];
cx q[7], q[3]; // final interaction

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];