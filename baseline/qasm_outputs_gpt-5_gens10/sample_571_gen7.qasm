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

cx q[0], q[5];
rz(-0.0342) q[5];
cx q[0], q[5];

cx q[1], q[5];
rz(-0.0251) q[5];
cx q[1], q[5];

cx q[3], q[5];
rz(-0.0225) q[5];
cx q[3], q[5];

cx q[4], q[5];
rz(-0.0184) q[5];
cx q[4], q[5];

cx q[6], q[7];
rz(-0.0329) q[7];
cx q[6], q[7];

h q[0];
rz(0.0847) q[0];
h q[0];

h q[1];
rz(0.0875) q[1];
h q[1];

h q[2];
rz(0.0783) q[2];
h q[2];

h q[3];
rz(0.0812) q[3];
h q[3];

h q[4];
rz(0.0799) q[4];
h q[4];

h q[5];
rz(0.0888) q[5];
h q[5];

h q[6];
rz(0.0860) q[6];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];