OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0]; // Initialize qubit 0
h q[1]; // Initialize qubit 1
h q[2]; // Initialize qubit 2
h q[3]; // Initialize qubit 3
h q[4]; // Initialize qubit 4
h q[5]; // Initialize qubit 5
h q[6]; // Initialize qubit 6
h q[7]; // Initialize qubit 7

// Applying CX gates based on the graph edges
cx q[0], q[1]; // 0 -> 1
cx q[0], q[3]; // 0 -> 3
cx q[0], q[5]; // 0 -> 5
cx q[1], q[2]; // 1 -> 2
cx q[3], q[4]; // 3 -> 4
cx q[5], q[2]; // 5 -> 2
cx q[5], q[3]; // 5 -> 3
cx q[5], q[6]; // 5 -> 6
cx q[5], q[7]; // 5 -> 7
cx q[6], q[4]; // 6 -> 4

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Determining measurement basis based on the problem structure
u3(2.0342, 0.5, 1.2) q[0];
u3(1.9523, -0.4, 2.1) q[1];
u3(1.4196, 1.6, -0.5) q[2];
u3(1.8360, -1.0, 1.3) q[3];
u3(0.9825, 0.0, 0.2) q[4];
u3(1.5090, -0.2, 1.8) q[5];
u3(0.9412, 1.0, -1.5) q[6];
u3(1.1347, 0.2, 1.1) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];