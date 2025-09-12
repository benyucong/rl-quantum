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

// Layer 1: Apply controlled operations based on the graph edges
cx q[0], q[5]; // Edge (0, 5)
rz(-0.5) q[5]; // Capacity 4
cx q[1], q[3]; // Edge (1, 3)
rz(-0.5) q[3]; // Capacity 2
cx q[2], q[4]; // Edge (2, 4)
rz(-0.5) q[4]; // Capacity 2
cx q[3], q[2]; // Edge (3, 2)
rz(-0.5) q[2]; // Capacity 5
cx q[3], q[5]; // Edge (3, 5)
rz(-0.5) q[5]; // Capacity 1
cx q[4], q[3]; // Edge (4, 3)
rz(-0.5) q[3]; // Capacity 4

// Layer 2: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];