OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[0], q[1];
rz(-0.214) q[1];
cx q[0], q[1];

cx q[0], q[3];
rz(-0.157) q[3];
cx q[0], q[3];

cx q[1], q[2];
rz(0.378) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.557) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.224) q[4];
cx q[1], q[4];

cx q[2], q[4];
rz(0.177) q[4];
cx q[2], q[4];

cx q[3], q[4];
rz(-0.481) q[4];
cx q[3], q[4];

h q[0];
rz(0.032) q[0];
h q[0];
h q[1];
rz(0.117) q[1];
h q[1];
h q[2];
rz(-0.235) q[2];
h q[2];
h q[3];
rz(-0.354) q[3];
h q[3];
h q[4];
rz(0.666) q[4];
h q[4];
h q[5];
rz(-0.120) q[5];
h q[5];
h q[6];
rz(0.227) q[6];
h q[6];
h q[7];
rz(-0.128) q[7];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];