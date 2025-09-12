OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer of entangling gates based on the graph edges
cx q[0], q[6]; // edge (0, 6)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 3)
cx q[1], q[6]; // edge (1, 6)
cx q[2], q[3]; // edge (2, 3)
cx q[2], q[4]; // edge (2, 4)
cx q[2], q[6]; // edge (2, 6)
cx q[3], q[5]; // edge (3, 5)
cx q[5], q[6]; // edge (5, 6)

// Second layer of entangling gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

cx q[0], q[6]; // edge (0, 6)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 3)
cx q[1], q[6]; // edge (1, 6)
cx q[2], q[3]; // edge (2, 3)
cx q[2], q[4]; // edge (2, 4)
cx q[2], q[6]; // edge (2, 6)
cx q[3], q[5]; // edge (3, 5)
cx q[5], q[6]; // edge (5, 6)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];