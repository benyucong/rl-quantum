OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Preparation Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of entangling gates based on the k-clique connections
cx q[0], q[1]; // Edge (0, 1)
cx q[0], q[2]; // Edge (0, 2)
cx q[0], q[3]; // Edge (0, 3)
cx q[0], q[4]; // Edge (0, 5)
cx q[0], q[5]; // Edge (0, 6)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[2], q[3]; // Edge (2, 3)
cx q[2], q[4]; // Edge (2, 5)
cx q[3], q[5]; // Edge (3, 6)

// Second layer of rotations to refine the state
rz(0.7854) q[0]; // Rotation to optimize on qubit 0
rz(0.7854) q[1]; // Rotation to optimize on qubit 1
rz(0.7854) q[2]; // Rotation to optimize on qubit 2
rz(0.7854) q[3]; // Rotation to optimize on qubit 3
rz(0.7854) q[4]; // Rotation to optimize on qubit 5
rz(0.7854) q[5]; // Rotation to optimize on qubit 6

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];