OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[1];
rz(-0.1537) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(-0.1983) q[2];
cx q[0], q[2];

cx q[1], q[3];
rz(-0.1041) q[3];
cx q[1], q[3];

cx q[3], q[4];
rz(-0.1337) q[4];
cx q[3], q[4];

cx q[4], q[5];
rz(-0.1729) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(-0.1219) q[6];
cx q[5], q[6];

cx q[6], q[7];
rz(-0.1124) q[7];
cx q[6], q[7];

cx q[6], q[8];
rz(-0.0789) q[8];
cx q[6], q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

rz(0.0832) q[0];
rz(0.0848) q[1];
rz(0.0949) q[2];
rz(0.0714) q[3];
rz(0.0654) q[4];
rz(0.0758) q[5];
rz(0.0899) q[6];
rz(0.0785) q[7];
rz(0.1198) q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];