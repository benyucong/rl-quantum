OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialization based on the flow graph
h q[0]; // Source node
h q[1]; // Intermediate node
h q[2]; // Intermediate node
h q[3]; // Intermediate node
h q[4]; // Sink node

// Encoding edges and capacities
cx q[0], q[3]; // Edge from source 0 to 3
rz(0.321) q[3]; // Phase gate for edge weight
cx q[0], q[3]; // Reapply to encode capacity

cx q[0], q[4]; // Edge from source 0 to 4
rz(0.642) q[4]; // Phase gate for edge weight
cx q[0], q[4]; // Reapply to encode capacity

cx q[1], q[2]; // Edge from 1 to 2
rz(0.321) q[2]; // Phase gate for edge weight
cx q[1], q[2]; // Reapply to encode capacity

cx q[1], q[3]; // Edge from 1 to 3
rz(0.321) q[3]; // Phase gate for edge weight
cx q[1], q[3]; // Reapply to encode capacity

cx q[2], q[1]; // Edge from 2 to 1
rz(0.321) q[1]; // Phase gate for edge weight
cx q[2], q[1]; // Reapply to encode capacity

cx q[2], q[4]; // Edge from 2 to 4
rz(0.642) q[4]; // Phase gate for edge weight
cx q[2], q[4]; // Reapply to encode capacity

cx q[3], q[1]; // Edge from 3 to 1
rz(0.321) q[1]; // Phase gate for edge weight
cx q[3], q[1]; // Reapply to encode capacity

// Layer 2: Final measurement state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];