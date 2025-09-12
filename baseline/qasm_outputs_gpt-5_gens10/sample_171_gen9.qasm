OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Prepare the initial state
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

// Encode the connections from the graph
// 0 is connected to 1, 3, 5
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[5];

// 1 is connected to 2, 3, 4, 6
cx q[1], q[2];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];

// 2 is connected to 3, 4, 5, 6
cx q[2], q[3];
cx q[2], q[4];
cx q[2], q[5];
cx q[2], q[6];

// 4 is connected to 5, 6
cx q[4], q[5];
cx q[4], q[6];

// 5 is connected to 6
cx q[5], q[6];

// For the second component starting at node 7
// 7 is connected to 8, 10, 11
cx q[7], q[8];
cx q[7], q[10];
cx q[7], q[11];

// 8 is connected to 9, 10
cx q[8], q[9];
cx q[8], q[10];

// 9 is connected to 10, 11
cx q[9], q[10];
cx q[9], q[11];

// 10 is connected to 11
cx q[10], q[11];

// Measure the output states
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