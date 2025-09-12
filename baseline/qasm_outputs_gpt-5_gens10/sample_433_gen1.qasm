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
cx q[5], q[0]; // hyperedge [0, 1, 5]
cx q[5], q[1];
cx q[5], q[2]; // hyperedge [0, 2]
cx q[5], q[3]; // hyperedge [3, 5]
cx q[5], q[4]; // hyperedge [4, 5]
cx q[7], q[6]; // hyperedge [6, 7]
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];