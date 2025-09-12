OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

rx(1.5708) q[0];
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

rx(1.5708) q[1];
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

rx(1.5708) q[2];
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

rx(1.5708) q[3];
cx q[3], q[1];
rz(0.7854) q[1];
cx q[3], q[1];

rx(1.5708) q[4];
cx q[4], q[2];
rz(0.7854) q[2];
cx q[4], q[2];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];