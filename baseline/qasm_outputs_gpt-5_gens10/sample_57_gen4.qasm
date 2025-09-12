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
cx q[0], q[5]; // Edge between 0 and 5
cx q[0], q[6]; // Edge between 0 and 6
cx q[1], q[6]; // Edge between 1 and 6
cx q[1], q[7]; // Edge between 1 and 7
cx q[2], q[7]; // Edge between 2 and 7
cx q[3], q[8]; // Edge between 3 and 8
cx q[3], q[7]; // Edge between 3 and 7
cx q[4], q[5]; // Edge between 4 and 5
cx q[4], q[6]; // Edge between 4 and 6

// Layer 2
rz(-0.76319) q[0];
rz(-0.76319) q[1];
rz(-0.76319) q[2];
rz(-0.76319) q[3];
rz(-0.76319) q[4];
cx q[0], q[5];
cx q[1], q[6];
cx q[2], q[7];
cx q[3], q[8];
cx q[4], q[5];

// Layer 3
rx(1.75758) q[0];
rx(1.75758) q[1];
rx(1.75758) q[2];
rx(1.75758) q[3];
rx(1.75758) q[4];
rz(0.46365) q[5];
rz(0.46365) q[6];
rz(0.46365) q[7];
rz(0.46365) q[8];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];