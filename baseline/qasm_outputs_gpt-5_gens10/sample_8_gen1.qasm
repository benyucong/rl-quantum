OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];

// Layer 1: Apply controlled rotations to entangle qubits
rz(0.4) q[0];
cx q[0], q[2];
rz(0.3) q[1];
cx q[1], q[2];

// Layer 2: Further entangling operations
h q[0];
cx q[0], q[1];
h q[1];

// Layer 3: Final adjustments before measurement
rz(0.2) q[1];
cx q[1], q[2];
h q[2];

// Measure the output states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];