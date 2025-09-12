OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

cx q[0], q[3];
rz(-0.4671) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(-0.2314) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(-0.5643) q[3];
cx q[2], q[3];
cx q[1], q[2];
rz(-0.1234) q[2];
cx q[1], q[2];

cx q[0], q[4];
rz(-0.3344) q[4];
cx q[0], q[4];
cx q[2], q[3];
rz(-0.5678) q[3];
cx q[2], q[3];

h q[0];
rz(0.6543) q[0];
h q[0];
h q[1];
rz(0.4563) q[1];
h q[1];
h q[2];
rz(0.7890) q[2];
h q[2];
h q[3];
rz(0.3456) q[3];
h q[3];
h q[4];
rz(0.1011) q[4];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];