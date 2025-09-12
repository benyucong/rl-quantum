OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize the qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled operations based on the graph edges
// Edge 0 -> 2
cx q[0], q[2];
rz(1.5708) q[2]; // Rotate to encode capacity
cx q[0], q[2];
// Edge 1 -> 3
cx q[1], q[3];
rz(1.5708) q[3]; // Rotate to encode capacity
cx q[1], q[3];
// Edge 2 -> 1
cx q[2], q[1];
rz(1.5708) q[1]; // Rotate to encode capacity
cx q[2], q[1];
// Edge 2 -> 3
cx q[2], q[3];
rz(1.5708) q[3]; // Rotate to encode capacity
cx q[2], q[3];

// Layer 3: Uncompute and Measurement
h q[0];
h q[1];
h q[2];
h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];