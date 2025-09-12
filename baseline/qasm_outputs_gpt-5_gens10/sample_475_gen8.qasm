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

cx q[0], q[7];
rz(-0.0951) q[7];
cx q[0], q[7];

cx q[0], q[10];
rz(-0.0552) q[10];
cx q[0], q[10];

cx q[1], q[8];
rz(-0.0743) q[8];
cx q[1], q[8];

cx q[2], q[9];
rz(-0.0835) q[9];
cx q[2], q[9];

cx q[2], q[12];
rz(-0.0496) q[12];
cx q[2], q[12];

cx q[3], q[10];
rz(-0.0637) q[10];
cx q[3], q[10];

cx q[3], q[12];
rz(-0.0321) q[12];
cx q[3], q[12];

cx q[4], q[11];
rz(-0.0654) q[11];
cx q[4], q[11];

cx q[5], q[12];
rz(-0.0518) q[12];
cx q[5], q[12];

cx q[6], q[7];
rz(-0.0781) q[7];
cx q[6], q[7];

h q[0];
rz(0.1245) q[0];
h q[0];

h q[1];
rz(0.0952) q[1];
h q[1];

h q[2];
rz(0.0897) q[2];
h q[2];

h q[3];
rz(0.1036) q[3];
h q[3];

h q[4];
rz(0.1135) q[4];
h q[4];

h q[5];
rz(0.0789) q[5];
h q[5];

h q[6];
rz(0.0867) q[6];
h q[6];

h q[7];
rz(0.0919) q[7];
h q[7];

h q[8];
rz(0.0745) q[8];
h q[8];

h q[9];
rz(0.0845) q[9];
h q[9];

h q[10];
rz(0.0983) q[10];
h q[10];

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