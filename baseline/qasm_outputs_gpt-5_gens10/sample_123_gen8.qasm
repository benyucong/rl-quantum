OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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

rx(1.431) q[0];
ry(0.659) q[1];
rz(-0.342) q[2];
rx(2.456) q[3];
ry(1.237) q[4];
rz(0.841) q[5];
rx(0.654) q[6];
ry(1.895) q[7];
rz(1.163) q[8];
rx(2.171) q[9];

cx q[0], q[7];
cx q[1], q[8];
cx q[2], q[9];
cx q[3], q[10];
cx q[4], q[11];
cx q[5], q[8];
cx q[6], q[7];

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