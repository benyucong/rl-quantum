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

cx q[0], q[2]; // Edge (0, 2)
rz(0.938) q[2];
cx q[0], q[2];

cx q[0], q[7]; // Edge (0, 7)
rz(0.753) q[7];
cx q[0], q[7];

cx q[1], q[2]; // Edge (1, 2)
rz(0.462) q[2];
cx q[1], q[2];

cx q[1], q[4]; // Edge (1, 4)
rz(0.175) q[4];
cx q[1], q[4];

cx q[1], q[7]; // Edge (1, 7)
rz(0.195) q[7];
cx q[1], q[7];

cx q[3], q[5]; // Edge (3, 5)
rz(0.619) q[5];
cx q[3], q[5];

cx q[3], q[6]; // Edge (3, 6)
rz(0.432) q[6];
cx q[3], q[6];

cx q[3], q[8]; // Edge (3, 8)
rz(0.514) q[8];
cx q[3], q[8];

cx q[4], q[2]; // Edge (4, 2)
rz(0.716) q[2];
cx q[4], q[2];

cx q[4], q[6]; // Edge (4, 6)
rz(0.811) q[6];
cx q[4], q[6];

cx q[6], q[3]; // Edge (6, 3)
rz(0.644) q[3];
cx q[6], q[3];

cx q[6], q[5]; // Edge (6, 5)
rz(0.332) q[5];
cx q[6], q[5];

cx q[7], q[2]; // Edge (7, 2)
rz(0.886) q[2];
cx q[7], q[2];

cx q[7], q[4]; // Edge (7, 4)
rz(0.217) q[4];
cx q[7], q[4];

cx q[7], q[8]; // Edge (7, 8)
rz(0.391) q[8];
cx q[7], q[8];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rz(0.082) q[0];
rz(0.019) q[1];
rz(0.091) q[2];
rz(0.058) q[3];
rz(0.072) q[4];
rz(0.067) q[5];
rz(0.045) q[6];
rz(0.102) q[7];
rz(0.059) q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];