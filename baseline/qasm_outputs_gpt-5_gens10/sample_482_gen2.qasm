OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
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

cx q[0], q[9];
rz(0.0534) q[9];
cx q[0], q[9];

cx q[1], q[3];
rz(0.0423) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.0226) q[4];
cx q[1], q[4];

cx q[2], q[1];
rz(0.0387) q[1];
cx q[2], q[1];

cx q[2], q[10];
rz(0.0456) q[10];
cx q[2], q[10];

cx q[3], q[4];
rz(0.0589) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.0345) q[5];
cx q[3], q[5];

// Layer 2
h q[0];
rz(0.0578) q[0];
h q[0];

h q[1];
rz(0.0624) q[1];
h q[1];

h q[2];
rz(0.0563) q[2];
h q[2];

h q[3];
rz(0.0482) q[3];
h q[3];

h q[4];
rz(0.0521) q[4];
h q[4];

h q[5];
rz(0.0605) q[5];
h q[5];

h q[6];
rz(0.0531) q[6];
h q[6];

h q[7];
rz(0.0554) q[7];
h q[7];

h q[8];
rz(0.0487) q[8];
h q[8];

h q[9];
rz(0.0419) q[9];
h q[9];

h q[10];
rz(0.0525) q[10];
h q[10];

// Measurement
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