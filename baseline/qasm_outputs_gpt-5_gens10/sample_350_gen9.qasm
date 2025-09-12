OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Apply entangling operations corresponding to edges
cx q[0], q[2]; // (0, 2)
cx q[0], q[5]; // (0, 5)
cx q[1], q[2]; // (1, 2)
cx q[1], q[7]; // (1, 7)
cx q[2], q[3]; // (2, 3)
cx q[2], q[6]; // (2, 6)
cx q[3], q[4]; // (3, 4)
cx q[4], q[5]; // (4, 5)
cx q[5], q[8]; // (5, 8)
cx q[6], q[7]; // (6, 7)
cx q[6], q[8]; // (6, 8)

// Layer 2
rx(1.57) q[0];
rx(1.57) q[1];
rx(1.57) q[2];
rx(1.57) q[3];
rx(1.57) q[4];
rx(1.57) q[5];
rx(1.57) q[6];
rx(1.57) q[7];
rx(1.57) q[8];

// Apply inverse entangling operations to recover states
cx q[6], q[8];
cx q[6], q[7];
cx q[5], q[8];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[6];
cx q[2], q[3];
cx q[1], q[7];
cx q[1], q[2];
cx q[0], q[5];
cx q[0], q[2];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];