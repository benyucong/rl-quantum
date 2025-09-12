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
h q[0];
cx q[0], q[1]; // from node 0 to 1
cx q[0], q[3]; // from node 0 to 3
cx q[0], q[5]; // from node 0 to 5
cx q[1], q[2]; // from node 1 to 2
cx q[1], q[3]; // from node 1 to 3
cx q[1], q[4]; // from node 1 to 4
cx q[1], q[6]; // from node 1 to 6
cx q[2], q[3]; // from node 2 to 3
cx q[2], q[4]; // from node 2 to 4
cx q[2], q[5]; // from node 2 to 5
cx q[2], q[6]; // from node 2 to 6
cx q[4], q[5]; // from node 4 to 5
cx q[4], q[6]; // from node 4 to 6
cx q[5], q[6]; // from node 5 to 6
cx q[7], q[8]; // from node 7 to 8
cx q[7], q[10]; // from node 7 to 10
cx q[7], q[11]; // from node 7 to 11
cx q[8], q[9]; // from node 8 to 9
cx q[8], q[10]; // from node 8 to 10
cx q[9], q[10]; // from node 9 to 10
cx q[9], q[11]; // from node 9 to 11
cx q[10], q[11]; // from node 10 to 11
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