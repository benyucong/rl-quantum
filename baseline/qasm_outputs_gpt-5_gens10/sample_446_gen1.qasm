OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;
h q[0];
h q[1];
h q[2];
rx(1.5708) q[0]; // 90 degrees
cx q[0], q[2];
rx(1.5708) q[1]; // 90 degrees
cx q[1], q[2];
rx(1.5708) q[2]; // 90 degrees
cx q[0], q[1];
h q[0];
h q[1];
h q[2];
rx(0.7854) q[0]; // 45 degrees
rz(-0.5) q[0];
rx(0.7854) q[1]; // 45 degrees
rz(-0.5) q[1];
rx(0.7854) q[2]; // 45 degrees
rz(-0.5) q[2];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];