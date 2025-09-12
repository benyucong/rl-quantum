OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Apply controlled operations based on the graph edges
cx q[0], q[1]; // edge (0, 1)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[5]; // edge (1, 5)
cx q[2], q[6]; // edge (2, 6)
cx q[3], q[1]; // edge (3, 1)
cx q[3], q[2]; // edge (3, 2)
cx q[4], q[1]; // edge (4, 1)
cx q[4], q[3]; // edge (4, 3)
cx q[5], q[3]; // edge (5, 3)

// Layer 2: Apply rotations based on edge capacities
rz(0.5) q[1]; // capacity 4 from 1 to 2
rz(0.3) q[2]; // capacity 1 from 2 to 6
rz(0.4) q[3]; // capacity 3 from 3 to 1
rz(0.4) q[4]; // capacity 4 from 4 to 1
rz(0.2) q[5]; // capacity 2 from 5 to 3

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];