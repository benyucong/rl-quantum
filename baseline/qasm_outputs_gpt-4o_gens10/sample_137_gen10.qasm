OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize qubits
h q[0]; // Prepare source qubit
h q[1]; // Prepare intermediate qubit
h q[2]; // Prepare intermediate qubit
h q[3]; // Prepare intermediate qubit
h q[4]; // Prepare sink qubit

// Layer 2: Apply controlled operations based on the graph edges
cx q[0], q[2]; // Edge (0, 2) with capacity 6
rz(-0.5) q[2]; // Adjust phase for edge (0, 2)

cx q[1], q[3]; // Edge (1, 3) with capacity 1
rz(-0.1) q[3]; // Adjust phase for edge (1, 3)

cx q[1], q[4]; // Edge (1, 4) with capacity 4
rz(-0.4) q[4]; // Adjust phase for edge (1, 4)

cx q[2], q[4]; // Edge (2, 4) with capacity 4
rz(-0.4) q[4]; // Adjust phase for edge (2, 4)

cx q[3], q[2]; // Edge (3, 2) with capacity 3
rz(-0.3) q[2]; // Adjust phase for edge (3, 2)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];