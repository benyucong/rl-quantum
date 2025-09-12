OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply controlled-X gates for edges
cx q[0], q[4]; // Edge (0, 4)
cx q[1], q[4]; // Edge (1, 4)
cx q[2], q[4]; // Edge (2, 4)
cx q[3], q[4]; // Edge (3, 4)

// Layer 3: Apply rotations to create superposition
rz(0.5) q[0];
rz(1.0) q[1];
rz(0.8) q[2];
rz(1.5) q[3];
rz(1.2) q[4];

// Layer 4: Final entangling gates
cx q[0], q[1];
cx q[2], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];