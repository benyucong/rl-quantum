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

cx q[0], q[1];
rz(-0.1635) q[1];
cx q[0], q[1];

cx q[2], q[3];
rz(0.3348) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.0257) q[4];
cx q[2], q[4];

cx q[4], q[5];
rz(-0.0472) q[5];
cx q[4], q[5];

cx q[5], q[7];
rz(0.1432) q[7];
cx q[5], q[7];

cx q[6], q[7];
rz(-0.1967) q[7];
cx q[6], q[7];

cx q[6], q[8];
rz(0.35) q[8];
cx q[6], q[8];

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

cx q[1], q[0];
rz(-0.1832) q[0];
cx q[1], q[0];

cx q[3], q[2];
rz(0.3582) q[2];
cx q[3], q[2];

cx q[4], q[2];
rz(0.0513) q[2];
cx q[4], q[2];

cx q[5], q[4];
rz(-0.0189) q[4];
cx q[5], q[4];

cx q[7], q[5];
rz(0.1572) q[5];
cx q[7], q[5];

cx q[7], q[6];
rz(-0.2156) q[6];
cx q[7], q[6];

cx q[8], q[6];
rz(0.3745) q[6];
cx q[8], q[6];

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