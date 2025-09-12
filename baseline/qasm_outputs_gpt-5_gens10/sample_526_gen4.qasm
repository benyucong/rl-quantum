OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 2
rz(1.4578) q[0];
rz(1.1234) q[1];
rz(0.7896) q[2];
rz(1.8906) q[3];
rz(0.4444) q[4];
rz(1.2345) q[5];
rz(0.5678) q[6];

// Controlled gates based on graph edges
cx q[0], q[1]; // edge (0, 1)
cx q[0], q[4]; // edge (0, 4)
cx q[0], q[5]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[5]; // edge (1, 5)
cx q[2], q[3]; // edge (2, 3)
cx q[3], q[5]; // edge (3, 5)
cx q[4], q[5]; // edge (4, 5)

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];