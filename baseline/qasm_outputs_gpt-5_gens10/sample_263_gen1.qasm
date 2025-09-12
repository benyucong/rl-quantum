OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits with Hadamard to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer entangling with controlled-X gates based on the graph structure
cx q[0], q[1]; // edge 0-1
cx q[0], q[2]; // edge 0-2
cx q[0], q[4]; // edge 0-5
cx q[1], q[2]; // edge 1-2
cx q[1], q[3]; // edge 1-4
cx q[2], q[3]; // edge 2-4

// Apply rotations to optimize the state for K-Clique problem
rz(1.0472) q[0];
rz(0.9378) q[1];
rz(1.1589) q[2];
rz(0.7854) q[3];
rz(0.8968) q[4];

// Second layer entangling with controlled-X gates again based on the graph structure
cx q[0], q[1]; // edge 0-1
cx q[0], q[2]; // edge 0-2
cx q[0], q[4]; // edge 0-5
cx q[1], q[2]; // edge 1-2
cx q[1], q[3]; // edge 1-4
cx q[2], q[3]; // edge 2-4

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];