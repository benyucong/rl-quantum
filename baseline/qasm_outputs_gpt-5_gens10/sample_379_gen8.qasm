OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Prepare initial state
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled operations based on the graph's edges
cx q[0], q[2]; // edge from 0 to 2
rz(-0.1542) q[2];
cx q[0], q[2];

cx q[0], q[3]; // edge from 0 to 3
rz(-0.1542) q[3];
cx q[0], q[3];

cx q[1], q[2]; // edge from 1 to 2
rz(-0.1542) q[2];
cx q[1], q[2];

cx q[1], q[3]; // edge from 1 to 3
rz(-0.1542) q[3];
cx q[1], q[3];

// Layer 3: Final adjustments and measurements
h q[0];
h q[1];
h q[2];
h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];