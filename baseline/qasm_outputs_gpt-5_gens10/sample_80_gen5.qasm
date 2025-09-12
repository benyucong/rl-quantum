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

// Applying the entangling gates based on the edges from the graph
cx q[0], q[1]; // edge (0, 1)
rz(4.0) q[1]; // Adding weight consideration to the qubit states
cx q[0], q[1];

cx q[0], q[3]; // edge (0, 3)
rz(12.0) q[3];
cx q[0], q[3];

cx q[0], q[2]; // edge (0, 2)
rz(14.0) q[2];
cx q[0], q[2];

cx q[2], q[3]; // edge (2, 3)
rz(5.0) q[3];
cx q[2], q[3];

cx q[3], q[6]; // edge (3, 6)
rz(16.0) q[6];
cx q[3], q[6];

cx q[3], q[4]; // edge (3, 4)
rz(20.0) q[4];
cx q[3], q[4];

cx q[4], q[5]; // edge (4, 5)
rz(6.0) q[5];
cx q[4], q[5];

cx q[4], q[7]; // edge (4, 7)
rz(18.0) q[7];
cx q[4], q[7];

cx q[6], q[7]; // edge (6, 7)
rz(9.0) q[7];
cx q[6], q[7];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];