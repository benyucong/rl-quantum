OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initialization and entanglement
h q[0]; // Initialize source qubit
h q[1]; // Initialize qubit 1
h q[2]; // Initialize qubit 2
h q[3]; // Initialize qubit 3
h q[4]; // Initialize qubit 4
h q[5]; // Initialize qubit 5
h q[6]; // Initialize qubit 6
h q[7]; // Initialize sink qubit

// Create entanglement based on graph edges
cx q[0], q[1]; // Edge (0, 1)
cu1(0.7854) q[0], q[3]; // Edge (0, 3)
cu1(0.7854) q[0], q[5]; // Edge (0, 5)
cx q[1], q[2]; // Edge (1, 2)
cu1(0.7854) q[3], q[4]; // Edge (3, 4)
cx q[5], q[2]; // Edge (5, 2)
cx q[5], q[3]; // Edge (5, 3)
cx q[5], q[6]; // Edge (5, 6)
cx q[5], q[7]; // Edge (5, 7)
cx q[6], q[4]; // Edge (6, 4)

// Layer 2 - Rotation for optimal measurement
rz(0.8727) q[0]; // Rotate for more contribution from source
rz(0.6283) q[1]; // Rotations to optimize circuits
rz(0.4637) q[2];
rz(0.3464) q[3];
rz(0.7854) q[4];
rz(0.6109) q[5];
rz(0.7854) q[6];
rz(0.3486) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];