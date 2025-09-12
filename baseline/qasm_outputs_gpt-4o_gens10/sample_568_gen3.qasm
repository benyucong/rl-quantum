OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply controlled operations based on the graph edges
cx q[0], q[5]; // Edge (0, 5)
rz(0.5) q[5];  // Capacity adjustment
cx q[1], q[2]; // Edge (1, 2)
rz(0.5) q[2];  // Capacity adjustment
cx q[1], q[5]; // Edge (1, 5)
rz(0.5) q[5];  // Capacity adjustment
cx q[2], q[4]; // Edge (2, 4)
rz(0.5) q[4];  // Capacity adjustment
cx q[3], q[2]; // Edge (3, 2)
rz(0.5) q[2];  // Capacity adjustment
cx q[3], q[5]; // Edge (3, 5)
rz(0.5) q[5];  // Capacity adjustment

// Layer 2: Apply Hadamard gates again
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Final controlled operations
cx q[0], q[5]; // Edge (0, 5)
rz(0.5) q[5];  // Capacity adjustment
cx q[1], q[2]; // Edge (1, 2)
rz(0.5) q[2];  // Capacity adjustment
cx q[1], q[5]; // Edge (1, 5)
rz(0.5) q[5];  // Capacity adjustment
cx q[2], q[4]; // Edge (2, 4)
rz(0.5) q[4];  // Capacity adjustment
cx q[3], q[2]; // Edge (3, 2)
rz(0.5) q[2];  // Capacity adjustment
cx q[3], q[5]; // Edge (3, 5)
rz(0.5) q[5];  // Capacity adjustment

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];