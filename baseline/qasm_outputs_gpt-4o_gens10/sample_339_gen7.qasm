OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled rotations based on the min-cut problem
cx q[0], q[2]; // Connect source to intermediate
rz(1.0472) q[2]; // Rotation for edge (0, 2)
cx q[1], q[3]; // Connect intermediate to sink
rz(1.0472) q[3]; // Rotation for edge (1, 3)
cx q[2], q[1]; // Feedback from intermediate to source
rz(1.0472) q[1]; // Rotation for edge (2, 1)
cx q[2], q[3]; // Final connection to sink
rz(1.0472) q[3]; // Rotation for edge (2, 3)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];