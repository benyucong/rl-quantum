OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;
h q[0];
h q[1];
h q[2];
cx q[0], q[2];
cx q[1], q[2];
rx(1.5708) q[2]; // RY gate for rotation
cx q[1], q[2];
cx q[0], q[2];
h q[2];
h q[1];
h q[0];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];