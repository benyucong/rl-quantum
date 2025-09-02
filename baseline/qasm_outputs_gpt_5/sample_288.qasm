OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Prepare the initial state
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply entangling gates according to edges
cx q[0], q[1]; // Edge (0, 1)
cx q[2], q[3]; // Edge (2, 3)
cx q[3], q[4]; // Edge (3, 4)

// Layer 3: Additional controlled rotations to encode data
rz(0.7854) q[1]; // Example rotation
rz(0.7854) q[3]; // Example rotation
cx q[0], q[2]; // Connect components
cx q[1], q[3]; // Connect components

// Layer 4: Uncompute
h q[0];
h q[1];
h q[2];
h q[3];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];