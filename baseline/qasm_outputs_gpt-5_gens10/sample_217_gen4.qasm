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

// First layer of entanglement corresponding to capacities
// Mapping edge capacities to angles
cx q[0], q[4]; // source(0) to node(4) with capacity 3
rz(-0.6361) q[4];
cx q[0], q[4];

cx q[1], q[5]; // source(1) to node(5) with capacity 2
rz(-0.4930) q[5];
cx q[1], q[5];

cx q[2], q[6]; // source(2) to node(6) with capacity 3
rz(-0.6361) q[6];
cx q[2], q[6];

cx q[3], q[4]; // source(3) to node(4) with capacity 1
rz(-0.1591) q[4];
cx q[3], q[4];

cx q[3], q[6]; // source(3) to node(6) with capacity 2
rz(-0.4930) q[6];
cx q[3], q[6];

cx q[3], q[7]; // source(3) to sink(7) with capacity 3
rz(-0.6361) q[7];
cx q[3], q[7]; 

// Second layer of entanglement for flow
h q[4];
h q[5];
h q[6];
h q[7];

cx q[4], q[1]; // node(4) to source(1)
rz(-0.4930) q[1];
cx q[4], q[1];

cx q[4], q[2]; // node(4) to source(2)
rz(-0.1591) q[2];
cx q[4], q[2];

cx q[4], q[3]; // node(4) to source(3)
rz(-0.4930) q[3];
cx q[4], q[3];

cx q[4], q[7]; // node(4) to sink(7)
rz(-0.6361) q[7];
cx q[4], q[7];

cx q[5], q[4]; // node(5) to node(4)
rz(-0.1591) q[4];
cx q[5], q[4];

cx q[6], q[3]; // node(6) to source(3)
rz(-0.1591) q[3];
cx q[6], q[3];

cx q[6], q[7]; // node(6) to sink(7)
rz(-0.4930) q[7];
cx q[6], q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];