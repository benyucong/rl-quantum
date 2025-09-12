OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// First Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First Layer of Controlled Operations
cx q[0], q[3];
cx q[0], q[4];
rz(1.1538) q[3];
cx q[0], q[3];

cx q[1], q[4];
cx q[1], q[5];
rz(0.9023) q[4];
cx q[1], q[4];

cx q[2], q[5];
cx q[2], q[6];
rz(1.1732) q[5];
cx q[2], q[5];

// Second Layer of Controlled Operations
cx q[0], q[3];
rz(-0.35) q[3];
cx q[0], q[3];

cx q[1], q[7];
rz(-0.22) q[4];
cx q[1], q[4];

cx q[5], q[6];
rz(0.1) q[5];
cx q[2], q[5];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];