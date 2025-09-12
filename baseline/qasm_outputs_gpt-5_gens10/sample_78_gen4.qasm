OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[4]; // Connects node 0 to node 4
cx q[1], q[4]; // Connects node 1 to node 4
cx q[2], q[3]; // Connects node 2 to node 3
cx q[2], q[4]; // Connects node 2 to node 4
cx q[5], q[6]; // Connects node 5 to node 6
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];