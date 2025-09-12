OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled rotations based on edges
cx q[0], q[2]; // Edge (0, 2)
rz(0.5) q[2];  // Rotation for vertex cover consideration
cx q[1], q[2]; // Edge (1, 2)
rz(0.5) q[2];  // Rotation for vertex cover consideration
cx q[1], q[3]; // Edge (1, 3)
rz(0.5) q[3];  // Rotation for vertex cover consideration

// Layer 3: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];