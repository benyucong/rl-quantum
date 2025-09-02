OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Prepare initial state
h q[0];  // Superposition on source
h q[1];  // Superposition on node 1
h q[2];  // Superposition on node 2
h q[3];  // Superposition on sink

// First layer: apply controlled operations based on edges
cx q[0], q[2];  // Edge from source to node 2
rz(-0.2588) q[2]; // Phase rotation for edge weight 5
cx q[0], q[3];  // Edge from source to sink
rz(-1.5708) q[3]; // Phase rotation for edge weight 1
cx q[1], q[2];  // Edge from node 1 to node 2
rz(-0.7854) q[2]; // Phase rotation for edge weight 1
cx q[1], q[3];  // Edge from node 1 to sink
rz(-0.1651) q[3]; // Phase rotation for edge weight 6

// Second layer: additional controlled operations to refine the state
cx q[2], q[0];
rz(0.6934) q[0];
cx q[2], q[1];
rz(0.1745) q[1];
cx q[3], q[0];
rz(0.2785) q[0];
cx q[3], q[1];
rz(0.3221) q[1];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];