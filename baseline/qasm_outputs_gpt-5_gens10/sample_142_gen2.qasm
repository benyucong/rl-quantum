OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
h q[0];
h q[1];
h q[2];
h q[3];

rx(1.2345) q[0];
cx q[0], q[2];
rz(0.1234) q[2];
cx q[0], q[2];
cx q[1], q[3];
rz(0.5678) q[3];
cx q[1], q[3];

rx(0.9876) q[2];
cx q[2], q[1];
rz(-0.0423) q[1];
cx q[2], q[1];
cx q[3], q[2];
rz(-0.0567) q[2];
cx q[3], q[2];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];