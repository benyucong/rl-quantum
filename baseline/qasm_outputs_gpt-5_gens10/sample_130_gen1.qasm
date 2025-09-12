OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Entangling operations based on graph edges
cx q[0], q[2]; // source to node 2
rz(0.1423) q[2]; // control on node 2
cx q[2], q[4];  // node 2 to node 4
rz(0.0871) q[4]; // control on node 4
cx q[4], q[1];  // node 4 to sink node
rz(0.0563) q[1]; // control on sink node

cx q[4], q[3];  // node 4 to intermediate node
rz(0.1526) q[3]; // control on intermediate node
cx q[4], q[5];  // node 4 to another node
rz(0.0943) q[5]; // control on another node
cx q[4], q[6];  // node 4 to node 6
rz(0.1012) q[6]; // control on node 6
cx q[4], q[7];  // node 4 to sink
rz(0.1135) q[7]; // control on sink node

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Final parameterized rotations
rz(-0.0951) q[0];
rz(-0.0764) q[1];
rz(-0.1045) q[2];
rz(0.0347) q[3];
rz(-0.1233) q[4];
rz(0.0789) q[5];
rz(0.0456) q[6];
rz(-0.0892) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];