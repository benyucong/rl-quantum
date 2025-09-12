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

cx q[0], q[3];
rz(-0.0245) q[3];
cx q[0], q[3];
cx q[0], q[6];
rz(-0.0245) q[6];
cx q[0], q[6];

cx q[1], q[2];
rz(-0.0299) q[2];
cx q[1], q[2];
cx q[2], q[3];
rz(-0.0299) q[3];
cx q[2], q[3];

cx q[3], q[5];
rz(-0.0264) q[5];
cx q[3], q[5];
cx q[3], q[4];
rz(-0.0264) q[4];
cx q[3], q[4];

h q[0];
rz(0.0723) q[0];
h q[0];

h q[1];
rz(0.0711) q[1];
h q[1];

h q[2];
rz(0.0898) q[2];
h q[2];

h q[3];
rz(0.0712) q[3];
h q[3];

h q[4];
rz(0.0725) q[4];
h q[4];

h q[5];
rz(0.0734) q[5];
h q[5];

h q[6];
rz(0.0758) q[6];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];