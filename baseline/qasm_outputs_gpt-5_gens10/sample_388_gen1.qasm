OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Entangling gates based on graph edges
cx q[0], q[1]; // edge (0, 1)
rz(-0.7854) q[1]; // RZ rotation for edge weight (capacity)
cx q[0], q[1];

cx q[0], q[4]; // edge (0, 4)
rz(-1.5708) q[4]; // RZ rotation for edge weight (capacity)
cx q[0], q[4];

cx q[1], q[2]; // edge (1, 2)
rz(-0.7854) q[2]; // RZ rotation for edge weight (capacity)
cx q[1], q[2];

cx q[3], q[2]; // edge (3, 2)
rz(-0.7854) q[2]; // RZ rotation for edge weight (capacity)
cx q[3], q[2];

cx q[3], q[5]; // edge (3, 5)
rz(-0.7854) q[5]; // RZ rotation for edge weight (capacity)
cx q[3], q[5];

cx q[4], q[5]; // edge (4, 5)
rz(-0.7854) q[5]; // RZ rotation for edge weight (capacity)
cx q[4], q[5];

// Layer 3: Apply Hadamard gates to prepare for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 4: Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];