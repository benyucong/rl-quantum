OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply controlled operations based on the min-cut problem
cx q[0], q[2]; // Edge (0, 2)
rz(0.5) q[2];  // Capacity 3
cx q[1], q[3]; // Edge (1, 3)
rz(0.8) q[3];  // Capacity 5
cx q[2], q[3]; // Edge (2, 3)
rz(0.3) q[3];  // Capacity 2
cx q[2], q[4]; // Edge (2, 4)
rz(0.4) q[4];  // Capacity 2
cx q[3], q[1]; // Edge (3, 1)
rz(0.6) q[1];  // Capacity 6
cx q[3], q[2]; // Edge (3, 2)
rz(0.7) q[2];  // Capacity 4

// Layer 3: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];