OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled gates to represent edges for k-clique
cx q[0], q[1]; // edge (0, 1)
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[5]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[4]; // edge (1, 4)
cx q[4], q[3]; // edge (4, 3)

// Layer 3: Final rotations to optimize state
rz(1.2345) q[0];
rz(1.5678) q[1];
rz(0.7890) q[2];
rz(0.3456) q[3];
rz(1.8901) q[4];
rz(0.1234) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];