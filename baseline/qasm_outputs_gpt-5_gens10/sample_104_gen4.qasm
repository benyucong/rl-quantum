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
cx q[0], q[2]; // edge from 0 to 2
cx q[0], q[6]; // edge from 0 to 6
cx q[1], q[3]; // edge from 1 to 3
cx q[2], q[4]; // edge from 2 to 4
cx q[3], q[1]; // edge from 3 to 1
cx q[3], q[2]; // edge from 3 to 2
cx q[3], q[4]; // edge from 3 to 4
cx q[5], q[1]; // edge from 5 to 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];