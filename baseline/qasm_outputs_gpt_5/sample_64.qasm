OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// First layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[2];
rx(1.255) q[2];
cx q[0], q[2];

cx q[0], q[7];
rx(1.155) q[7];
cx q[0], q[7];

cx q[1], q[2];
rx(0.945) q[2];
cx q[1], q[2];

cx q[1], q[4];
rx(0.785) q[4];
cx q[1], q[4];

cx q[1], q[7];
rx(0.787) q[7];
cx q[1], q[7];

cx q[3], q[5];
rx(1.175) q[5];
cx q[3], q[5];

cx q[3], q[6];
rx(1.085) q[6];
cx q[3], q[6];

cx q[3], q[8];
rx(0.905) q[8];
cx q[3], q[8];

cx q[4], q[2];
rx(1.045) q[2];
cx q[4], q[2];

cx q[4], q[6];
rx(1.025) q[6];
cx q[4], q[6];

cx q[7], q[2];
rx(1.125) q[2];
cx q[7], q[2];

cx q[7], q[4];
rx(1.205) q[4];
cx q[7], q[4];

// Second layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[2];
rx(2.255) q[2];
cx q[0], q[2];

cx q[0], q[7];
rx(2.155) q[7];
cx q[0], q[7];

cx q[1], q[2];
rx(1.945) q[2];
cx q[1], q[2];

cx q[1], q[4];
rx(1.785) q[4];
cx q[1], q[4];

cx q[1], q[7];
rx(1.787) q[7];
cx q[1], q[7];

cx q[3], q[5];
rx(2.175) q[5];
cx q[3], q[5];

cx q[3], q[6];
rx(2.085) q[6];
cx q[3], q[6];

cx q[3], q[8];
rx(1.905) q[8];
cx q[3], q[8];

cx q[4], q[2];
rx(2.045) q[2];
cx q[4], q[2];

cx q[4], q[6];
rx(2.025) q[6];
cx q[4], q[6];

cx q[7], q[2];
rx(2.125) q[2];
cx q[7], q[2];

cx q[7], q[4];
rx(2.205) q[4];
cx q[7], q[4];

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