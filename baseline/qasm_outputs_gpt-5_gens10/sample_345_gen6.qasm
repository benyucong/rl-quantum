OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];

// Apply entangling gates based on the graph structure
// Connections
cx q[0], q[3]; // Edge (0,3)
cx q[0], q[4]; // Edge (0,4)
cx q[1], q[2]; // Edge (1,2)
cx q[1], q[3]; // Edge (1,3)
cx q[5], q[6]; // Edge (5,6)
cx q[5], q[8]; // Edge (5,8)
cx q[6], q[8]; // Edge (6,8)
cx q[7], q[9]; // Edge (7,9)
cx q[8], q[9]; // Edge (8,9)
cx q[10], q[12]; // Edge (10,12)
cx q[10], q[13]; // Edge (10,13)
cx q[11], q[12]; // Edge (11,12)
cx q[11], q[14]; // Edge (11,14)
cx q[12], q[14]; // Edge (12,14)

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];