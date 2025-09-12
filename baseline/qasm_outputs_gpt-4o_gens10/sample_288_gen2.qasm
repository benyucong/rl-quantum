OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled operations based on edges
cx q[0], q[1]; // Edge (0, 1)
cx q[2], q[3]; // Edge (2, 3)
cx q[3], q[4]; // Edge (3, 4)

// Layer 3: Apply rotations to create entanglement
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];

// Layer 4: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];