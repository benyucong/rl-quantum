OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// First Layer
h q[0]; // Initialize source qubit to superposition
h q[1]; // Initialize intermediate qubit
h q[2]; // Initialize intermediate qubit
h q[3]; // Initialize intermediate qubit
h q[4]; // Initialize intermediate qubit
h q[5]; // Initialize target qubit
h q[6]; // Initialize sink qubit

// Apply controlled operations representing edges
cx q[0], q[5];  // 0 -> 5
cx q[1], q[5];  // 1 -> 5
cx q[1], q[4];  // 1 -> 4
cx q[2], q[1];  // 2 -> 1
cx q[2], q[3];  // 2 -> 3
cx q[2], q[4];  // 2 -> 4
cx q[3], q[6];  // 3 -> 6
cx q[4], q[1];  // 4 -> 1
cx q[4], q[2];  // 4 -> 2
cx q[4], q[3];  // 4 -> 3
cx q[5], q[1];  // 5 -> 1
cx q[5], q[2];  // 5 -> 2
cx q[5], q[6];  // 5 -> 6

// Second Layer
h q[0]; // Apply Hadamard again
h q[1]; // Apply Hadamard again
h q[2]; // Apply Hadamard again
h q[3]; // Apply Hadamard again
h q[4]; // Apply Hadamard again
h q[5]; // Apply Hadamard again
h q[6]; // Apply Hadamard again

// Measure the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];