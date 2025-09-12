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

cx q[0], q[6]; // Source to node 6
cx q[0], q[8]; // Source to sink
cx q[1], q[3]; // Node 1 to node 3
cx q[1], q[5]; // Node 1 to node 5
cx q[2], q[7]; // Node 2 to node 7
cx q[2], q[8]; // Node 2 to sink
cx q[3], q[1]; // Node 3 back to node 1
cx q[4], q[6]; // Node 4 to node 6
cx q[4], q[7]; // Node 4 to node 7
cx q[5], q[1]; // Node 5 to node 1
cx q[5], q[6]; // Node 5 to node 6
cx q[6], q[2]; // Node 6 to node 2
cx q[7], q[1]; // Node 7 to node 1
cx q[7], q[2]; // Node 7 to node 2
cx q[7], q[6]; // Node 7 to node 6
cx q[7], q[8]; // Node 7 to sink

rz(-0.0461) q[0];
rz(-0.0785) q[1];
rz(-0.0327) q[2];
rz(-0.0592) q[3];
rz(-0.0115) q[4];
rz(-0.0238) q[5];
rz(-0.0549) q[6];
rz(-0.0674) q[7];
rz(-0.0578) q[8];

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