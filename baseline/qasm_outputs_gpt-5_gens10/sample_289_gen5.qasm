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
h q[8];
cx q[0], q[1]; // 0-1 edge
cx q[2], q[3]; // 2-3 edge
cx q[2], q[4]; // 2-4 edge
cx q[2], q[5]; // 2-5 edge
cx q[3], q[4]; // 3-4 edge
cx q[3], q[6]; // 3-6 edge
cx q[7], q[8]; // 7-8 edge
cx q[7], q[9]; // 7-9 edge
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];