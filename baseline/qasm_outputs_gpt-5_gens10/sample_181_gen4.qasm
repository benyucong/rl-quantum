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

// First layer
cx q[0], q[1]; // Edge (0, 1)
rz(-0.3927) q[1]; // Capacity weight for (0, 1)
cx q[0], q[1];

cx q[1], q[2]; // Edge (1, 2)
rz(-0.5792) q[2]; // Capacity weight for (1, 2)
cx q[1], q[2];

cx q[1], q[5]; // Edge (1, 5)
rz(-0.6435) q[5]; // Capacity weight for (1, 5)
cx q[1], q[5];

cx q[2], q[6]; // Edge (2, 6)
rz(-0.1787) q[6]; // Capacity weight for (2, 6)
cx q[2], q[6];

// Second layer
cx q[3], q[1]; // Edge (3, 1)
rz(-0.3927) q[1]; // Capacity weight for (3, 1)
cx q[3], q[1];

cx q[3], q[2]; // Edge (3, 2)
rz(-0.3927) q[2]; // Capacity weight for (3, 2)
cx q[3], q[2];

cx q[4], q[1]; // Edge (4, 1)
rz(-0.4812) q[1]; // Capacity weight for (4, 1)
cx q[4], q[1];

cx q[4], q[3]; // Edge (4, 3)
rz(-0.4812) q[3]; // Capacity weight for (4, 3)
cx q[4], q[3];

cx q[5], q[3]; // Edge (5, 3)
rz(-0.3927) q[3]; // Capacity weight for (5, 3)
cx q[5], q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];