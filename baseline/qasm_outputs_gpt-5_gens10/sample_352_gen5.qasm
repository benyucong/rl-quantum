OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0]; // Initialize source qubit (0)
h q[1]; // Initialize qubit (1)
h q[2]; // Initialize qubit (2)
h q[3]; // Initialize qubit (3)
h q[4]; // Initialize qubit (4)
h q[5]; // Initialize sink qubit (5)

// Apply controlled rotations based on graph edges
// Source (0) to Node (4)
cx q[0], q[4]; 
rz(1.0472) q[4];

// Node (1) to Node (4)
cx q[1], q[4];
rz(0.7854) q[4];

// Node (2) to Node (3)
cx q[2], q[3];
rz(1.0472) q[3];

// Node (2) to Node (4)
cx q[2], q[4];
rz(1.5708) q[4];

// Node (2) to Node (5)
cx q[2], q[5];
rz(0.7854) q[5];

// Node (3) to Node (2)
cx q[3], q[2];
rz(1.0472) q[2];

// Node (4) to Sink (5)
cx q[4], q[5];
rz(0.5236) q[5];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final layer of entangling gates
cx q[0], q[4];
rz(-0.7854) q[4];
cx q[0], q[4];

cx q[1], q[4];
rz(-0.5236) q[4];
cx q[1], q[4];

cx q[2], q[5];
rz(-1.0472) q[5];
cx q[2], q[5];

cx q[3], q[2];
rz(-0.7854) q[2];
cx q[3], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];