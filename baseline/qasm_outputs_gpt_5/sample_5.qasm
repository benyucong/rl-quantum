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

rx(1.1345) q[0];
ry(0.7567) q[1];
rx(1.5234) q[2];
ry(0.3452) q[3];
rx(1.8723) q[4];
ry(0.1234) q[5];
rx(1.0356) q[6];
ry(0.8765) q[7];

cx q[0], q[1];
rzz(0.5937) q[1], q[2];
cx q[2], q[3];
rzz(0.7245) q[3], q[0];
cx q[4], q[5];
rzz(0.3335) q[5], q[6];
cx q[6], q[7];

rz(0.0145) q[0];
rx(0.1237) q[1];
rz(0.0583) q[2];
rx(0.6578) q[3];
rz(0.0347) q[4];
rx(0.1093) q[5];
rz(0.0279) q[6];
rx(0.7958) q[7];

cx q[0], q[1];
rxx(0.4422) q[1], q[2];
cx q[2], q[3];
rxx(1.5123) q[3], q[4];
cx q[4], q[5];
rxx(0.6112) q[5], q[6];
cx q[6], q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];