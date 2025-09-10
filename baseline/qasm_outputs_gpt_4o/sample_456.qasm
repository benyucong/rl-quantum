OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled operations based on the min-cut problem
cx q[0], q[1]; // Edge (0, 1)
rz(0.5) q[1]; // Capacity 3
cx q[0], q[3]; // Edge (0, 3)
rz(0.2) q[3]; // Capacity 1
cx q[0], q[4]; // Edge (0, 4)
rz(0.4) q[4]; // Capacity 2
cx q[0], q[5]; // Edge (0, 5)
rz(0.4) q[5]; // Capacity 2
cx q[1], q[3]; // Edge (1, 3)
rz(0.8) q[3]; // Capacity 4
cx q[1], q[4]; // Edge (1, 4)
rz(0.6) q[4]; // Capacity 3
cx q[1], q[5]; // Edge (1, 5)
rz(0.2) q[5]; // Capacity 1
cx q[3], q[2]; // Edge (3, 2)
rz(0.8) q[2]; // Capacity 5
cx q[3], q[4]; // Edge (3, 4)
rz(0.2) q[4]; // Capacity 1
cx q[3], q[5]; // Edge (3, 5)
rz(0.8) q[5]; // Capacity 4

// Layer 3: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];