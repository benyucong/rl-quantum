OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial rotation for encoding the problem
rx(1.0) q[0];
rx(1.0) q[1];
rx(1.0) q[2];
rx(1.0) q[3];
rx(1.0) q[4];
rx(1.0) q[5];

// Layer 2: Entangling gates based on the problem edges
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[3]; // edge (0, 3)
cx q[0], q[5]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 3)
cx q[1], q[5]; // edge (1, 5)
cx q[3], q[4]; // edge (3, 4)
cx q[3], q[5]; // edge (3, 5)
cx q[4], q[5]; // edge (4, 5)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];