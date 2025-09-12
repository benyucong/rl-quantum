OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[4]; // source to node 4
cx q[1], q[4]; // node 1 to node 4
cx q[2], q[3]; // node 2 to node 3
cx q[2], q[4]; // node 2 to node 4
cx q[2], q[5]; // node 2 to sink
cx q[3], q[2]; // reverse edge from node 3 to node 2
cx q[4], q[5]; // node 4 to sink
rz(0.2961) q[0];
rz(0.4829) q[1];
rz(0.1568) q[2];
rz(0.3931) q[3];
rz(0.6742) q[4];
rz(0.2761) q[5];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
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