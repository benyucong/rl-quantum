OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// First Layer
h q[0]; // Prepare first left node
h q[1]; // Prepare second left node
h q[2]; // Prepare third left node

cx q[0], q[3]; // Connect left node 0 to right node 3
rz(0.9827) q[3]; // Optimized rotation for edge weight
cx q[0], q[3]; // Reconnect

cx q[0], q[4]; // Connect left node 0 to right node 4
rz(1.3323) q[4]; // Optimized rotation for edge weight
cx q[0], q[4]; // Reconnect

cx q[0], q[6]; // Connect left node 0 to right node 6
rz(1.0175) q[6]; // Optimized rotation for edge weight
cx q[0], q[6]; // Reconnect

cx q[0], q[7]; // Connect left node 0 to right node 7
rz(0.7850) q[7]; // Optimized rotation for edge weight
cx q[0], q[7]; // Reconnect

cx q[1], q[4]; // Connect left node 1 to right node 4
rz(0.7600) q[4]; // Optimized rotation for edge weight
cx q[1], q[4]; // Reconnect

cx q[1], q[3]; // Connect left node 1 to right node 3
rz(0.9100) q[3]; // Optimized rotation for edge weight
cx q[1], q[3]; // Reconnect

cx q[1], q[6]; // Connect left node 1 to right node 6
rz(1.1337) q[6]; // Optimized rotation for edge weight
cx q[1], q[6]; // Reconnect

cx q[2], q[5]; // Connect left node 2 to right node 5
rz(0.5000) q[5]; // Optimized rotation for edge weight
cx q[2], q[5]; // Reconnect

// Second Layer
h q[0]; // Preparing for measurement
h q[1]; // Preparing for measurement
h q[2]; // Preparing for measurement

h q[3]; // Prepare measurements for right nodes
h q[4]; 
h q[5]; 
h q[6]; 
h q[7];

// Final measurements
c[0] = measure q[0]; 
c[1] = measure q[1]; 
c[2] = measure q[2]; 
c[3] = measure q[3]; 
c[4] = measure q[4]; 
c[5] = measure q[5]; 
c[6] = measure q[6]; 
c[7] = measure q[7];