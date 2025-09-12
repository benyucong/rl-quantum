OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initializing the left nodes
h q[0];
h q[1];
h q[2];
h q[3];

// Encoding the edges of the bipartite graph
cx q[0], q[4]; // weight 9
cx q[0], q[6]; // weight 11
cx q[1], q[5]; // weight 10
cx q[1], q[6]; // weight 16
cx q[1], q[7]; // weight 14
cx q[2], q[6]; // weight 6
cx q[2], q[7]; // weight 11
cx q[2], q[5]; // weight 14
cx q[3], q[7]; // weight 10

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