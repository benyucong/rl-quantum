OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Initialize qubits for source (0), intermediate nodes (1-5), and sink (6)
h q[0];   // Source node
h q[4];   // Intermediate node 4
h q[5];   // Intermediate node 5
h q[1];   // Intermediate node 1
h q[2];   // Intermediate node 2
h q[3];   // Intermediate node 3
h q[6];   // Sink node

// Layer 1: Connect source to intermediate nodes
cx q[0], q[4];  // Source to node 4 (capacity 3)
rz(-0.1) q[4];
cx q[0], q[5];  // Source to node 5 (capacity 2)
rz(-0.2) q[5];

// Layer 2: Connect intermediate nodes
cx q[1], q[2];  // Node 1 to node 2 (capacity 1)
rz(-0.1) q[2];
cx q[2], q[3];  // Node 2 to node 3 (capacity 1)
rz(-0.1) q[3];

// Layer 3: Connect back to source nodes
cx q[3], q[5];  // Node 3 to node 5 (capacity 1)
rz(-0.1) q[5];
cx q[4], q[2];  // Node 4 to node 2 (capacity 3)
rz(-0.2) q[2];
cx q[4], q[6];  // Node 4 to sink (capacity 1)
rz(-0.1) q[6];

// Layer 4: Final connections
cx q[5], q[2];  // Node 5 to node 2 (capacity 1)
rz(-0.1) q[2];
cx q[5], q[3];  // Node 5 to node 3 (capacity 2)
rz(-0.1) q[3];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];