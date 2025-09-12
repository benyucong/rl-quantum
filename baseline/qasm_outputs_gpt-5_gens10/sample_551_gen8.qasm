OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0];  // Prepare the source node
h q[1];  // Prepare intermediate node
h q[2];  // Prepare intermediate node
h q[3];  // Prepare intermediate node
h q[4];  // Prepare sink node
cx q[0], q[5];  // Connect source to sink with capacity of 4
cx q[1], q[3];  // Connect node 1 to node 3 with capacity of 2
cx q[2], q[4];  // Connect node 2 to node 4 with capacity of 2
cx q[3], q[2];  // Connect node 3 to node 2 with capacity of 5
cx q[3], q[5];  // Connect node 3 to sink with capacity of 1
cx q[4], q[3];  // Connect node 4 to node 3 with capacity of 4

// Layer 2
rz(0.5) q[0];  // Optimize connection from source
rz(0.5) q[1];  // Optimize connection of node 1
rz(0.5) q[2];  // Optimize connection of node 2
rz(0.5) q[3];  // Optimize connection of node 3
rz(0.5) q[4];  // Optimize connection to sink
h q[0];  // Finalize
h q[1];
h q[2];
h q[3];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];