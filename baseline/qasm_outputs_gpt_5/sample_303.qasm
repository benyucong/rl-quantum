OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

cx q[0], q[5];  // edge (0, 5)
rz(-0.5) q[5];
cx q[0], q[5];

cx q[1], q[5];  // edge (1, 5)
rz(-0.5) q[5];
cx q[1], q[5];

cx q[2], q[1];  // edge (2, 1)
rz(-0.5) q[1];
cx q[2], q[1];

cx q[2], q[3];  // edge (2, 3)
rz(-0.5) q[3];
cx q[2], q[3];

cx q[2], q[4];  // edge (2, 4)
rz(-0.5) q[4];
cx q[2], q[4];

cx q[3], q[6];  // edge (3, 6)
rz(-0.5) q[6];
cx q[3], q[6];

// Layer 2 (repeating the connections to enhance probability)
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

cx q[0], q[5];  // edge (0, 5)
rz(-0.5) q[5];
cx q[0], q[5];

cx q[1], q[5];  // edge (1, 5)
rz(-0.5) q[5];
cx q[1], q[5];

cx q[2], q[1];  // edge (2, 1)
rz(-0.5) q[1];
cx q[2], q[1];

cx q[2], q[3];  // edge (2, 3)
rz(-0.5) q[3];
cx q[2], q[3];

cx q[2], q[4];  // edge (2, 4)
rz(-0.5) q[4];
cx q[2], q[4];

cx q[3], q[6];  // edge (3, 6)
rz(-0.5) q[6];
cx q[3], q[6];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];