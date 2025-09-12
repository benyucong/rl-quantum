OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[4];
rz(-0.4281) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(-0.4281) q[5];
cx q[0], q[5];

cx q[1], q[5];
rz(-0.6981) q[5];
cx q[1], q[5];

cx q[2], q[1];
rz(-0.3864) q[1];
cx q[2], q[1];

cx q[2], q[4];
rz(-0.2352) q[4];
cx q[2], q[4];

cx q[3], q[1];
rz(-0.5432) q[1];
cx q[3], q[1];

cx q[3], q[2];
rz(-0.5120) q[2];
cx q[3], q[2];

cx q[3], q[4];
rz(-0.3480) q[4];
cx q[3], q[4];

h q[5];
rz(0.1524) q[5];
h q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];