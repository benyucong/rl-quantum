OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize qubits
h q[0]; // Source qubit
h q[1]; // Intermediate qubit
h q[2]; // Intermediate qubit
h q[3]; // Intermediate qubit
h q[4]; // Sink qubit

// Layer 2: Apply controlled operations based on graph edges
cx q[0], q[2]; // Edge (0 -> 2) with capacity 1
cx q[1], q[2]; // Edge (1 -> 2) with capacity 4
cx q[2], q[4]; // Edge (2 -> 4) with capacity 6
cx q[3], q[2]; // Edge (3 -> 2) with capacity 2

// Layer 3: Apply rotations to encode flow capacities
rz(0.5) q[2]; // Adjusting flow at intermediate node
rz(0.3) q[4]; // Adjusting flow at sink node

// Layer 4: Finalize the state
h q[0];
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