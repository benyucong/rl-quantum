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

cx q[0], q[4];
rz(0.149) q[4];
cx q[0], q[4];

cx q[1], q[5];
rz(0.125) q[5];
cx q[1], q[5];

cx q[2], q[6];
rz(0.150) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.133) q[4];
cx q[3], q[4];

cx q[3], q[6];
rz(0.175) q[6];
cx q[3], q[6];

cx q[4], q[7];
rz(0.175) q[7];
cx q[4], q[7];

h q[0];
z q[0];
h q[0];
h q[1];
z q[1];
h q[1];
h q[2];
z q[2];
h q[2];
h q[3];
z q[3];
h q[3];
h q[4];
z q[4];
h q[4];
h q[5];
z q[5];
h q[5];
h q[6];
z q[6];
h q[6];
h q[7];
z q[7];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];