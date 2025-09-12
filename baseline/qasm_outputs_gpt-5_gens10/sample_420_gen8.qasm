OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits to superposition
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled-X gates to enforce graph relationships
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[3]; // edge (0, 3)
cx q[2], q[1]; // edge (2, 1)
cx q[2], q[3]; // edge (2, 3)
cx q[1], q[3]; // edge (1, 3)

// Rotation gates to create bias towards possible valid colorings
rz(0.7854) q[0]; // pi/4 rotation for color 1
rz(0.7854) q[1]; // pi/4 rotation for color 2
rz(0.7854) q[2]; // pi/4 rotation for color 3
rz(0.7854) q[3]; // pi/4 rotation for color 1

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];