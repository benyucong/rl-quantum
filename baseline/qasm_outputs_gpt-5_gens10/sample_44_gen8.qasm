OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Entangling operations based on edges
cx q[0], q[5]; // edge (0, 5)
cx q[0], q[6]; // edge (0, 6)
cx q[1], q[6]; // edge (1, 6)
cx q[1], q[7]; // edge (1, 7)
cx q[1], q[8]; // edge (1, 8)
cx q[2], q[5]; // edge (2, 5)
cx q[2], q[7]; // edge (2, 7)
cx q[3], q[5]; // edge (3, 5)
cx q[3], q[8]; // edge (3, 8)

// Layer 3: Measurement preparation
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 4: Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];