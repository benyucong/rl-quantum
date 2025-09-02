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
cx q[0], q[5]; // source to first edge
cx q[1], q[2]; // edge with capacity 3
cx q[1], q[6]; // edge with capacity 4
cx q[3], q[2]; // capacity from 3 to 2
cx q[4], q[1]; // edge from 4 to 1
cx q[4], q[5]; // edge from 4 to 5
cx q[5], q[2]; // edge from 5 to 2
cx q[5], q[7]; // edge from 5 to 7
cx q[6], q[2]; // edge from 6 to 2
cx q[6], q[5]; // edge from 6 to 5
cx q[6], q[7]; // edge from 6 to 7
cx q[7], q[1]; // edge from 7 to 1
cx q[7], q[3]; // edge from 7 to 3
cx q[7], q[4]; // edge from 7 to 4
cx q[7], q[8]; // edge from 7 to sink
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