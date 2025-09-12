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
cx q[0], q[1]; // source to node 1
rz(-0.1338) q[1]; // capacity 7
cx q[0], q[8]; // source to sink
rz(-0.1338) q[8]; // capacity 3
cx q[1], q[2]; // node 1 to node 2
rz(-0.1338) q[2]; // capacity 3
cx q[1], q[3]; // node 1 to node 3
rz(-0.1338) q[3]; // capacity 7
cx q[1], q[5]; // node 1 to node 5
rz(-0.0800) q[5]; // capacity 2
cx q[1], q[7]; // node 1 to node 7
rz(-0.1338) q[7]; // capacity 7
cx q[2], q[4]; // node 2 to node 4
rz(-0.0800) q[4]; // capacity 2
cx q[2], q[5]; // node 2 to node 5
rz(-0.1338) q[5]; // capacity 6
cx q[2], q[7]; // node 2 to node 7
rz(-0.1338) q[7]; // capacity 5
cx q[3], q[6]; // node 3 to node 6
rz(-0.1338) q[6]; // capacity 6
cx q[3], q[7]; // node 3 to node 7
rz(-0.1338) q[7]; // capacity 4
cx q[3], q[8]; // node 3 to sink
rz(-0.1338) q[8]; // capacity 4
cx q[4], q[6]; // node 4 to node 6
rz(-0.0800) q[6]; // capacity 3
cx q[5], q[2]; // node 5 to node 2
rz(-0.1338) q[2]; // capacity 3
cx q[5], q[3]; // node 5 to node 3
rz(-0.1338) q[3]; // capacity 4
cx q[5], q[8]; // node 5 to sink
rz(-0.0800) q[8]; // capacity 1
cx q[6], q[2]; // node 6 to node 2
rz(-0.1338) q[2]; // capacity 7
cx q[7], q[2]; // node 7 to node 2
rz(-0.1338) q[2]; // capacity 3
cx q[7], q[4]; // node 7 to node 4
rz(-0.0800) q[4]; // capacity 4
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