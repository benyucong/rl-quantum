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
cx q[0], q[2]; // Flow from source 0 to node 2 with capacity 5
cz q[0], q[3]; // Flow from source 0 to sink 3 with capacity 1
cx q[1], q[2]; // Flow from node 1 to node 2 with capacity 1
cx q[1], q[3]; // Flow from node 1 to sink 3 with capacity 6
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