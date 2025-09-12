OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1
cx q[0], q[2]; // source to intermediate
rz(0.6018) q[2]; // Apply rotation based on capacity
cx q[1], q[3]; // Another edge from node 1 to 3
rz(0.2358) q[3];
cx q[1], q[4]; // Node 1 to sink 
rz(0.3292) q[4];
cx q[2], q[4]; // Node 2 to sink
rz(0.4619) q[4];
cx q[3], q[2]; // Node 3 to Node 2
rz(0.1273) q[2];

// Layer 2
h q[0];
rz(0.0764) q[0];
h q[0];
h q[1];
rz(0.0764) q[1];
h q[1];
h q[2];
rz(0.0764) q[2];
h q[2];
h q[3];
rz(0.0764) q[3];
h q[3];
h q[4];
rz(0.0764) q[4];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];