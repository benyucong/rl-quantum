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

// Layer 1
cx q[0], q[2]; // source to node
rz(-0.4158) q[2]; // edge weight
cx q[0], q[2];

cx q[0], q[7]; // source to sink
rz(-0.5000) q[7]; // edge weight
cx q[0], q[7];

cx q[2], q[4]; // node to node
rz(-0.4158) q[4]; // edge weight
cx q[2], q[4];

cx q[4], q[1]; // node to node
rz(-0.6931) q[1]; // edge weight
cx q[4], q[1];

cx q[4], q[3]; // node to node
rz(-1.2039) q[3]; // edge weight
cx q[4], q[3];

cx q[4], q[5]; // node to node
rz(-0.0000) q[5]; // edge weight
cx q[4], q[5];

cx q[4], q[6]; // node to node
rz(-1.2039) q[6]; // edge weight
cx q[4], q[6];

cx q[4], q[7]; // node to sink
rz(-0.5000) q[7]; // edge weight
cx q[4], q[7];

// Layer 2
h q[0];
rz(0.5000) q[7];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];