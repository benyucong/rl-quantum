OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize qubits
h q[0]; // Prepare source qubit
h q[1]; // Prepare intermediate qubit
h q[2]; // Prepare intermediate qubit
h q[3]; // Prepare intermediate qubit
h q[4]; // Prepare sink qubit

// Layer 2: Apply controlled operations based on the graph edges
// Edge: (0 -> 2) with capacity 6
cx q[0], q[2]; // Control from source to intermediate
rz(0.5) q[2]; // Rotation to encode capacity

// Edge: (1 -> 3) with capacity 1
cx q[1], q[3]; // Control from intermediate to another intermediate
rz(0.1) q[3]; // Rotation to encode capacity

// Edge: (1 -> 4) with capacity 4
cx q[1], q[4]; // Control from intermediate to sink
rz(0.4) q[4]; // Rotation to encode capacity

// Edge: (2 -> 4) with capacity 4
cx q[2], q[4]; // Control from intermediate to sink
rz(0.4) q[4]; // Rotation to encode capacity

// Edge: (3 -> 2) with capacity 3
cx q[3], q[2]; // Control from another intermediate to intermediate
rz(0.3) q[2]; // Rotation to encode capacity

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];