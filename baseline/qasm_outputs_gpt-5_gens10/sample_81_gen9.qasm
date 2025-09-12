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

rz(0.0461) q[0];
rz(0.0393) q[1];
rz(0.0238) q[2];
rz(0.0526) q[3];
rz(0.0198) q[4];
rz(0.0302) q[5];
rz(0.0601) q[6];
rz(0.0215) q[7];

cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[6];
cx q[3], q[7];

rz(-0.0123) q[4];
rz(-0.0061) q[5];
rz(-0.0345) q[6];
rz(-0.0152) q[7];

cx q[0], q[4];
cx q[1], q[5];
cx q[2], q[6];
cx q[3], q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];