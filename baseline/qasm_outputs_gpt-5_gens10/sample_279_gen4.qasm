OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initial Hadamard gates to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Entangling operations based on the edge capacities
cx q[0], q[1]; // Capacity between 0 and 1
rz(0.1) q[1];  // Rotation for edge weight tuning
cx q[0], q[3]; // Capacity between 0 and 3
rz(0.05) q[3]; // Rotation for edge weight tuning
cx q[1], q[3]; // Capacity between 1 and 3
rz(0.2) q[3];  // Rotation for edge weight tuning
cx q[1], q[4]; // Capacity between 1 and 4
rz(0.15) q[4]; // Rotation for edge weight tuning

// Layer 3: Final rotations and measurements
rz(0.1) q[0];  // Final rotation for node 0
rz(0.1) q[1];  // Final rotation for node 1
rz(0.1) q[2];  // Final rotation for node 2
rz(0.1) q[3];  // Final rotation for node 3
rz(0.1) q[4];  // Final rotation for node 4

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];