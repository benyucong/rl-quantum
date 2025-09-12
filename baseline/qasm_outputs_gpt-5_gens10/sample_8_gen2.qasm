OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Layer 1: Prepare initial state
h q[0]; // Hadamard on q[0]
h q[1]; // Hadamard on q[1]
h q[2]; // Hadamard on q[2]

// Layer 2: Apply controlled operations to encode the problem
cx q[0], q[2]; // Control q[0] to target q[2]
cx q[1], q[2]; // Control q[1] to target q[2]

// Layer 3: Final adjustments
h q[2]; // Hadamard on q[2] to create superposition
cx q[1], q[0]; // Additional control between q[1] and q[0]

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];