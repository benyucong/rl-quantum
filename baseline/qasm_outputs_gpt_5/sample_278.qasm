OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];  // Initial Hadamard on source node
h q[1];  // Initial Hadamard on intermediate nodes
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Apply controlled operations to create entanglement reflecting the graph structure
cx q[0], q[1]; // Connect source to node 1
cx q[0], q[2]; // Connect source to node 2
cx q[0], q[7]; // Connect source to sink
cx q[1], q[3]; // Node 1 to Node 3
cx q[1], q[5]; // Node 1 to Node 5
cx q[1], q[7]; // Node 1 to sink
cx q[3], q[1]; // Bidirectional edges for completeness
cx q[3], q[2]; // Node 3 to Node 2
cx q[3], q[7]; // Node 3 to sink
cx q[4], q[6]; // Node 4 to Node 6
cx q[5], q[1]; // Node 5 to Node 1
cx q[5], q[2]; // Node 5 to Node 2
cx q[5], q[6]; // Node 5 to Node 6
cx q[6], q[1]; // Node 6 to Node 1

// Layer 2
h q[0];  // Hadamard again to finalize the superposition
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Final entangling operations reflecting capacities
rz(1.2) q[0]; // Optimized rotation corresponding to the graph's capacities
rz(0.7) q[1];
rz(1.0) q[2];
rz(0.5) q[3];
rz(0.3) q[4];
rz(1.5) q[5];
rz(0.9) q[6];
rz(1.8) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];