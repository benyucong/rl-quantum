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

cx q[0], q[1];
rz(-1.183) q[1];
cx q[0], q[1];

cx q[0], q[3];
rz(-0.976) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-1.023) q[4];
cx q[0], q[4];

cx q[0], q[6];
rz(-0.812) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(-1.047) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(-0.930) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(-1.074) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(-0.862) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(-0.770) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-1.201) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(-0.895) q[5];
cx q[2], q[5];

cx q[3], q[6];
rz(-1.045) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(-0.935) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(-1.014) q[6];
cx q[4], q[6];

h q[0];
rz(0.543) q[0];
h q[0];

h q[1];
rz(0.654) q[1];
h q[1];

h q[2];
rz(0.467) q[2];
h q[2];

h q[3];
rz(0.723) q[3];
h q[3];

h q[4];
rz(0.842) q[4];
h q[4];

h q[5];
rz(0.975) q[5];
h q[5];

h q[6];
rz(0.400) q[6];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];