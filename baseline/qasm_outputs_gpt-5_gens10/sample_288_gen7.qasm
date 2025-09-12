OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2
cx q[0], q[1];
rz(0.5) q[1];
cx q[0], q[1];
cx q[2], q[3];
rz(0.3) q[3];
cx q[2], q[3];

// Layer 3
h q[0];
rz(-0.2) q[0];
h q[0];
h q[1];
rz(-0.4) q[1];
h q[1];

// Layer 4
cx q[1], q[2];
rz(0.1) q[2];
cx q[1], q[2];
cx q[0], q[3];
rz(0.2) q[3];
cx q[0], q[3];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];