OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// First layer
h q[0]; // Prepare the source node
h q[1]; // Preparing the intermediate node
h q[2]; // Prepare the first path to the sink
h q[3]; // Prepare another path
h q[4]; // Prepare for connections in between
h q[5]; // Prepare the sink node
h q[6]; // Prepare the final node

// Apply entangling gates
cx q[0], q[5]; // Connect source to one of the channels
rx(1.2203) q[1]; // Activate the intermediate node
rz(0.3452) q[2]; // Modify state towards sink
cx q[2], q[1]; // Connect intermediate nodes
cx q[3], q[6]; // Final path to the sink
rx(1.5122) q[4]; // Connect to the nodes along the path
rz(0.1854) q[5]; // Sink adjustment
cx q[5], q[1]; // Connect sink back to intermediate

// Second layer
h q[5];
h q[6];
rz(0.0564) q[0];
rz(-0.0345) q[1];
rz(0.0712) q[2];
rz(-0.0213) q[3];
rz(0.0478) q[4];
rz(0.0197) q[5];
rz(0.0623) q[6];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];