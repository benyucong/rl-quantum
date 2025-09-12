OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of operations - encoding the graph structure
cx q[0], q[1]; // edge from 0 to 1
cx q[0], q[4]; // edge from 0 to 4
cx q[0], q[5]; // edge from 0 to 5
cx q[0], q[6]; // edge from 0 to 6
cx q[1], q[2]; // edge from 1 to 2
cx q[1], q[3]; // edge from 1 to 3
cx q[1], q[5]; // edge from 1 to 5
cx q[1], q[6]; // edge from 1 to 6
cx q[2], q[3]; // edge from 2 to 3
cx q[2], q[4]; // edge from 2 to 4
cx q[3], q[4]; // edge from 3 to 4
cx q[4], q[7]; // edge from 4 to 7
cx q[5], q[1]; // edge from 5 to 1
cx q[5], q[2]; // edge from 5 to 2
cx q[5], q[3]; // edge from 5 to 3
cx q[6], q[3]; // edge from 6 to 3
cx q[6], q[4]; // edge from 6 to 4

// Second layer of operations - applying phase shifts
rz(-0.5) q[0];
rz(-0.5) q[1];
rz(-0.5) q[2];
rz(-0.5) q[3];
rz(-0.5) q[4];
rz(-0.5) q[5];
rz(-0.5) q[6];
rz(-0.5) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];