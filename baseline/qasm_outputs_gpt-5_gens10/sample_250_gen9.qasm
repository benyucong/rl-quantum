OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

cx q[0], q[1];
rz(0.1548) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.0764) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.1234) q[5];
cx q[1], q[5];
cx q[2], q[5];
rz(0.1893) q[5];
cx q[2], q[5];

cx q[3], q[4];
rz(0.0987) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.0652) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.0543) q[6];
cx q[4], q[6];

h q[0];
rz(-0.0345) q[0];
h q[0];

h q[1];
rz(-0.0456) q[1];
h q[1];

h q[2];
rz(-0.0567) q[2];
h q[2];

h q[3];
rz(-0.0678) q[3];
h q[3];

h q[4];
rz(-0.0789) q[4];
h q[4];

h q[5];
rz(-0.0890) q[5];
h q[5];

h q[6];
rz(-0.0901) q[6];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];