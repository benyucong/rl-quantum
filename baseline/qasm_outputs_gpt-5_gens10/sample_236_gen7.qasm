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

cx q[0], q[3];
cx q[1], q[4];
cx q[1], q[9];
cx q[1], q[3];
cx q[2], q[5];
cx q[2], q[9];
cx q[2], q[10];
cx q[2], q[4];

rz(0.8299) q[3];
rz(1.1267) q[4];
rz(0.7832) q[5];
rz(1.5128) q[9];
rz(0.9765) q[10];

cx q[0], q[3];
cx q[1], q[4];
cx q[1], q[9];
cx q[1], q[3];
cx q[2], q[5];
cx q[2], q[9];
cx q[2], q[10];
cx q[2], q[4];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[0], q[3];
cx q[1], q[4];
cx q[1], q[9];
cx q[1], q[3];
cx q[2], q[5];
cx q[2], q[9];
cx q[2], q[10];
cx q[2], q[4];

rz(0.7351) q[3];
rz(1.3124) q[4];
rz(1.8973) q[5];
rz(1.9511) q[9];
rz(0.8890) q[10];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];