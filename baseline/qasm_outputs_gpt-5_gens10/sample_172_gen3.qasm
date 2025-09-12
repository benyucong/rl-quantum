OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[3]; // Connection 0 to 3
cx q[0], q[4]; // Connection 0 to 4
cx q[0], q[7]; // Connection 0 to 7
cx q[0], q[8]; // Connection 0 to 8
cx q[1], q[3]; // Connection 1 to 3
cx q[2], q[5]; // Connection 2 to 5
cx q[2], q[6]; // Connection 2 to 6
cx q[3], q[4]; // Connection 3 to 4
cx q[5], q[1]; // Connection 5 to 1
cx q[5], q[2]; // Connection 5 to 2
cx q[7], q[1]; // Connection 7 to 1
cx q[7], q[8]; // Connection 7 to 8

// Layer 2 (apply RZ rotations for optimization)
rz(0.1) q[3];
rz(0.1) q[4];
rz(0.1) q[7];
rz(0.1) q[8];
rz(0.05) q[0];
rz(0.05) q[1];
rz(0.05) q[2];
rz(0.05) q[5];
rz(0.05) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];