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
rz(0.3512) q[3];
cx q[0], q[3];

cx q[0], q[6];
rz(0.6432) q[6];
cx q[0], q[6];

cx q[1], q[4];
rz(0.7675) q[4];
cx q[1], q[4];

cx q[1], q[3];
rz(0.9194) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.1245) q[6];
cx q[1], q[6];

cx q[2], q[5];
rz(0.5523) q[5];
cx q[2], q[5];

cx q[2], q[3];
rz(0.3941) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.8888) q[4];
cx q[2], q[4];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];