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

// First layer of gates based on the min_cut problem
cx q[0], q[3];
rz(-0.175) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.110) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(-0.225) q[5];
cx q[0], q[5];

cx q[1], q[5];
rz(-0.150) q[5];
cx q[1], q[5];

cx q[1], q[2];
rz(-0.120) q[2];
cx q[1], q[2];

cx q[2], q[6];
rz(-0.175) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(-0.160) q[5];
cx q[3], q[5];

// Second layer of gates
h q[0];
rz(0.075) q[0];
h q[0];

h q[1];
rz(0.080) q[1];
h q[1];

h q[2];
rz(0.090) q[2];
h q[2];

h q[3];
rz(0.100) q[3];
h q[3];

h q[4];
rz(0.110) q[4];
h q[4];

h q[5];
rz(0.120) q[5];
h q[5];

h q[6];
rz(0.130) q[6];
h q[6];

h q[7];
rz(0.140) q[7];
h q[7];

h q[8];
rz(0.150) q[8];
h q[8];

h q[9];
rz(0.160) q[9];
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