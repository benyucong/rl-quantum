OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

cx q[0], q[2]; // edge (0, 2)
cx q[0], q[5]; // edge (0, 5)
cx q[0], q[8]; // edge (0, 8)
cx q[1], q[4]; // edge (1, 4)
cx q[1], q[5]; // edge (1, 5)
cx q[1], q[7]; // edge (1, 7)
cx q[2], q[1]; // edge (2, 1)
cx q[2], q[4]; // edge (2, 4)
cx q[2], q[5]; // edge (2, 5)
cx q[2], q[6]; // edge (2, 6)
cx q[2], q[7]; // edge (2, 7)
cx q[3], q[4]; // edge (3, 4)
cx q[3], q[5]; // edge (3, 5)
cx q[3], q[6]; // edge (3, 6)
cx q[3], q[7]; // edge (3, 7)
cx q[3], q[8]; // edge (3, 8)
cx q[4], q[5]; // edge (4, 5)
cx q[4], q[6]; // edge (4, 6)
cx q[5], q[3]; // edge (5, 3)
cx q[5], q[6]; // edge (5, 6)
cx q[5], q[7]; // edge (5, 7)
cx q[6], q[7]; // edge (6, 7)
cx q[7], q[3]; // edge (7, 3)
cx q[7], q[6]; // edge (7, 6)
cx q[7], q[8]; // edge (7, 8)

// Layer 2: Final state preparation
rz(0.5237) q[0];
rz(0.5237) q[1];
rz(0.5237) q[2];
rz(0.5237) q[3];
rz(0.5237) q[4];
rz(0.5237) q[5];
rz(0.5237) q[6];
rz(0.5237) q[7];
rz(0.5237) q[8];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];