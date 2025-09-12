OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize qubits and create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply controlled rotations based on the edges of the graph
cx q[0], q[1]; // Edge (0, 1)
rz(0.5) q[1];  // Rotation for edge (0, 1)
cx q[0], q[1];

cx q[0], q[2]; // Edge (0, 2)
rz(0.5) q[2];  // Rotation for edge (0, 2)
cx q[0], q[2];

cx q[0], q[4]; // Edge (0, 5)
rz(0.5) q[4];  // Rotation for edge (0, 5)
cx q[0], q[4];

cx q[1], q[2]; // Edge (1, 2)
rz(0.5) q[2];  // Rotation for edge (1, 2)
cx q[1], q[2];

cx q[1], q[3]; // Edge (1, 4)
rz(0.5) q[3];  // Rotation for edge (1, 4)
cx q[1], q[3];

cx q[2], q[3]; // Edge (2, 4)
rz(0.5) q[3];  // Rotation for edge (2, 4)
cx q[2], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];