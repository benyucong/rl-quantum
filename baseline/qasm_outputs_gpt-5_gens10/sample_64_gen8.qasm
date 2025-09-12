OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialization
h q[0]; // layer 1
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First Layer – apply controlled rotations based on edges
cx q[0], q[2]; // connection from 0 to 2
rz(0.7175) q[2]; // rotation based on capacity
cx q[0], q[2];

cx q[0], q[7]; // connection from 0 to 7
rz(0.7175) q[7];
cx q[0], q[7];

cx q[1], q[2]; // connection from 1 to 2
rz(0.2269) q[2];
cx q[1], q[2];

cx q[1], q[4]; // connection from 1 to 4
rz(0.2269) q[4];
cx q[1], q[4];

cx q[1], q[7]; // connection from 1 to 7
rz(0.2269) q[7];
cx q[1], q[7];

cx q[2], q[1]; // connection from 2 to 1
rz(0.2269) q[1];
cx q[2], q[1];

// Second Layer – more controlled rotations
cx q[3], q[5]; // connection from 3 to 5
rz(0.5975) q[5];
cx q[3], q[5];

cx q[3], q[6]; // connection from 3 to 6
rz(0.2654) q[6];
cx q[3], q[6];

cx q[3], q[8]; // connection from 3 to 8
rz(0.9071) q[8];
cx q[3], q[8];

cx q[4], q[2]; // connection from 4 to 2
rz(0.7175) q[2];
cx q[4], q[2];

cx q[4], q[6]; // connection from 4 to 6
rz(0.7175) q[6];
cx q[4], q[6];

cx q[6], q[3]; // connection from 6 to 3
rz(0.7175) q[3];
cx q[6], q[3];

cx q[6], q[5]; // connection from 6 to 5
rz(0.7175) q[5];
cx q[6], q[5];

cx q[7], q[2]; // connection from 7 to 2
rz(0.2269) q[2];
cx q[7], q[2];

cx q[7], q[4]; // connection from 7 to 4
rz(0.2269) q[4];
cx q[7], q[4];

cx q[7], q[8]; // connection from 7 to 8
rz(0.2654) q[8];
cx q[7], q[8];

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