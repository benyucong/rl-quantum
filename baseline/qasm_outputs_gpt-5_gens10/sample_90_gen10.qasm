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
cx q[0], q[2]; // connect source to intermediate
rz(-0.596) q[2]; // optimization parameter for edge (0->2)
cx q[0], q[5]; // connect source to sink
rz(-0.394) q[5]; // optimization parameter for edge (0->5)
cx q[2], q[1]; // connection from intermediate to node 1
rz(-0.598) q[1]; // optimization parameter for edge (2->1)
cx q[2], q[4]; // connection from intermediate to node 4
rz(-0.591) q[4]; // optimization parameter for edge (2->4)
cx q[3], q[2]; // connection from node 3 to intermediate
rz(-0.595) q[2]; // optimization parameter for edge (3->2)
cx q[3], q[5]; // connection from node 3 to sink
rz(-0.592) q[5]; // optimization parameter for edge (3->5)
cx q[4], q[1]; // connection from node 4 to node 1
rz(-0.599) q[1]; // optimization parameter for edge (4->1)
cx q[4], q[3]; // connection from node 4 to node 3
rz(-0.590) q[3]; // optimization parameter for edge (4->3)
cx q[4], q[5]; // connection from node 4 to sink
rz(-0.393) q[5]; // optimization parameter for edge (4->5)
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