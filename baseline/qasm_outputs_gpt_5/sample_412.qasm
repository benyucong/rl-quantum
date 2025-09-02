OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2
cx q[0], q[4];
rz(-0.0658) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(-0.0513) q[3];
cx q[1], q[3];

cx q[2], q[4];
rz(-0.0571) q[4];
cx q[2], q[4];

// Layer 3
cx q[3], q[1];
rz(-0.0462) q[1];
cx q[3], q[1];

cx q[3], q[2];
rz(-0.0499) q[2];
cx q[3], q[2];

// Layer 4
cx q[4], q[5];
rz(-0.0345) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];