OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[0], q[8];
rz(1.2478) q[8];
cx q[0], q[8];

cx q[1], q[9];
rz(1.2345) q[9];
cx q[1], q[9];

cx q[2], q[10];
rz(1.1123) q[10];
cx q[2], q[10];

cx q[3], q[11];
rz(1.3025) q[11];
cx q[3], q[11];

cx q[3], q[12];
rz(1.1111) q[12];
cx q[3], q[12];

cx q[4], q[12];
rz(1.5678) q[12];
cx q[4], q[12];

cx q[5], q[13];
rz(1.2341) q[13];
cx q[5], q[13];

cx q[6], q[14];
rz(1.3456) q[14];
cx q[6], q[14];

h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];

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
c[11] = measure q[11];