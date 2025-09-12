OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialization layer
h q[0]; // Node 0
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4
h q[5]; // Node 5

// First layer of connectivity based on edges
cx q[0], q[1]; // Edge (0, 1)
cx q[0], q[3]; // Edge (0, 3)
cx q[1], q[2]; // Edge (1, 2)
cx q[1], q[3]; // Edge (1, 3)
cx q[4], q[6]; // Edge (4, 6)
cx q[5], q[6]; // Edge (5, 6)

// Second layer of connectivity 
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rz(0.7854) q[5];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];