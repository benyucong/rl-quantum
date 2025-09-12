OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of parameterized gates
rx(1.548) q[0];
rx(2.430) q[1];
rx(1.853) q[2];
rx(0.745) q[3];
rx(1.923) q[4];
rx(1.682) q[5];

// Controlled rotations based on the graph structure
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[1], q[3];
cx q[1], q[5];
cx q[2], q[4];
cx q[2], q[5];
cx q[3], q[5];

// Second layer of parameterized gates
rz(0.845) q[0];
rz(0.432) q[1];
rz(1.090) q[2];
rz(0.647) q[3];
rz(1.203) q[4];
rz(0.892) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];