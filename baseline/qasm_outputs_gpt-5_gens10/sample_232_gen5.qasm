OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[0], q[1]; // Connect nodes 0 and 1
cx q[0], q[2]; // Connect nodes 0 and 2
cx q[0], q[3]; // Connect nodes 0 and 3
cx q[1], q[4]; // Connect nodes 1 and 4
cx q[1], q[6]; // Connect nodes 1 and 6
cx q[2], q[6]; // Connect nodes 2 and 6
cx q[3], q[4]; // Connect nodes 3 and 4
cx q[3], q[7]; // Connect nodes 3 and 7
cx q[3], q[5]; // Connect nodes 3 and 5
cx q[4], q[7]; // Connect nodes 4 and 7

// Layer 2
rz(-0.1234) q[0]; // Optimal angle for qubit 0
rz(-0.1234) q[1]; // Optimal angle for qubit 1
rz(-0.1234) q[2]; // Optimal angle for qubit 2
rz(-0.1234) q[3]; // Optimal angle for qubit 3
rz(-0.1234) q[4]; // Optimal angle for qubit 4
rz(-0.1234) q[5]; // Optimal angle for qubit 5
rz(-0.1234) q[6]; // Optimal angle for qubit 6
rz(-0.1234) q[7]; // Optimal angle for qubit 7

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cx q[0], q[1];
cx q[2], q[3];
cx q[4], q[5];
cx q[6], q[7];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];