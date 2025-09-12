OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1
h q[0]; // Prepare the source node
h q[1]; // Prepare the second node
h q[2]; // Prepare the third node
h q[3]; // Prepare the fourth node
h q[4]; // Prepare the fifth node
h q[5]; // Prepare the sink node

// Layer 2 - Encode the edges with controlled rotations
cx q[0], q[1];   // Source to node 1
rz(-0.2) q[1];   // Adjust by capacity
cx q[0], q[3];   // Source to node 3
rz(-0.1) q[3];   // Adjust by capacity
cx q[0], q[4];   // Source to node 4
rz(-0.2) q[4];   // Adjust by capacity
cx q[0], q[5];   // Source to sink
rz(-0.3) q[5];   // Adjust by capacity
cx q[1], q[3];   // Node 1 to node 3
rz(-0.1) q[3];   // Adjust by capacity
cx q[1], q[4];   // Node 1 to node 4
rz(-0.2) q[4];   // Adjust by capacity
cx q[1], q[5];   // Node 1 to sink
rz(-0.1) q[5];   // Adjust by capacity
cx q[3], q[2];   // Node 3 to node 2
rz(-0.2) q[2];   // Adjust by capacity
cx q[3], q[4];   // Node 3 to node 4
rz(-0.1) q[4];   // Adjust by capacity
cx q[3], q[5];   // Node 3 to sink
rz(-0.3) q[5];   // Adjust by capacity

// Layer 3 - Final measurements and adjustments
h q[0]; // Restore original state
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];