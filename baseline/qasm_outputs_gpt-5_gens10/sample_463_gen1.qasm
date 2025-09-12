OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Initialize nodes with Hadamard gates
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
h q[14];

// Create edges based on the provided graph
// Edges: (0,1), (0,2), (0,3), (1,2), (1,3), (2,5), (4,5), (6,7), (6,8), (9,12), (9,13), (9,14), (10,11), (10,13), (10,14), (11,12), (12,13), (12,14), (13,14)

cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[5];
cx q[4], q[5];
cx q[6], q[7];
cx q[6], q[8];
cx q[9], q[12];
cx q[9], q[13];
cx q[9], q[14];
cx q[10], q[11];
cx q[10], q[13];
cx q[10], q[14];
cx q[11], q[12];
cx q[12], q[13];
cx q[12], q[14];
cx q[13], q[14];

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
c[14] = measure q[14];