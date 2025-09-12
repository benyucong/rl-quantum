OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

cx q[4], q[7];
rz(-0.0316) q[7];
cx q[4], q[7];

cx q[0], q[3];
rz(-0.0382) q[3];
cx q[0], q[3];

cx q[5], q[6];
rz(-0.0123) q[6];
cx q[5], q[6];

cx q[10], q[6];
rz(-0.0158) q[6];
cx q[10], q[6];

cx q[1], q[10];
rz(-0.0146) q[10];
cx q[1], q[10];

cx q[0], q[2];
rz(-0.0201) q[2];
cx q[0], q[2];

cx q[10], q[3];
rz(-0.0285) q[3];
cx q[10], q[3];

cx q[10], q[5];
rz(-0.0359) q[5];
cx q[10], q[5];

cx q[1], q[9];
rz(-0.0224) q[9];
cx q[1], q[9];

cx q[9], q[10];
rz(-0.0272) q[10];
cx q[9], q[10];

cx q[3], q[4];
rz(-0.0133) q[4];
cx q[3], q[4];

cx q[1], q[3];
rz(-0.0265) q[3];
cx q[1], q[3];

cx q[9], q[2];
rz(-0.0164) q[2];
cx q[9], q[2];

cx q[4], q[5];
rz(-0.0235) q[5];
cx q[4], q[5];

cx q[2], q[10];
rz(-0.0327) q[10];
cx q[2], q[10];

cx q[0], q[10];
rz(-0.0119) q[10];
cx q[0], q[10];

cx q[2], q[6];
rz(-0.0187) q[6];
cx q[2], q[6];

cx q[8], q[7];
rz(-0.0248) q[7];
cx q[8], q[7];

cx q[1], q[2];
rz(-0.0293) q[2];
cx q[1], q[2];

cx q[3], q[6];
rz(-0.0168) q[6];
cx q[3], q[6];

cx q[0], q[6];
rz(-0.0304) q[6];
cx q[0], q[6];

cx q[6], q[7];
rz(-0.0112) q[7];
cx q[6], q[7];

cx q[8], q[10];
rz(-0.0253) q[10];
cx q[8], q[10];

cx q[8], q[4];
rz(-0.0279) q[4];
cx q[8], q[4];

cx q[0], q[5];
rz(-0.0120) q[5];
cx q[0], q[5];

cx q[8], q[2];
rz(-0.0137) q[2];
cx q[8], q[2];

cx q[0], q[7];
rz(-0.0142) q[7];
cx q[0], q[7];

cx q[5], q[7];
rz(-0.0199) q[7];
cx q[5], q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];