OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of entangling operations based on the graph edges
cx q[0], q[1]; // from source (0) to (1)
rz(0.5) q[1];  // edge weight modification
cx q[0], q[3]; // from source (0) to (3)
rz(0.5) q[3];  // edge weight modification
cx q[1], q[3]; // from (1) to (3)
rz(0.5) q[3];  // edge weight modification
cx q[1], q[4]; // from (1) to sink (4)
rz(0.5) q[4];  // edge weight modification
cx q[2], q[1]; // from (2) to (1)
rz(0.5) q[1];  // edge weight modification
cx q[3], q[1]; // from (3) to (1)
rz(0.5) q[1];  // edge weight modification

// Intermediate entangling operation
h q[0];
cx q[0], q[1];
h q[0];
h q[1];

// Second layer of adjustments
cx q[1], q[3];
rz(-0.5) q[3]; // adjusting for capacity
cx q[3], q[4];
rz(-0.5) q[4]; // adjusting for capacity
cx q[1], q[2];
rz(-0.5) q[2]; // adjusting for capacity

// Final layer of entangling operations
h q[0];
h q[1];
h q[3];
h q[4];
cx q[0], q[3];
rz(0.5) q[3];
cx q[1], q[4];
rz(0.5) q[4];

// Perform measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];