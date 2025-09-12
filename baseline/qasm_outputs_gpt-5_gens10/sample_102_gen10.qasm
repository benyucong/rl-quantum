OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1
h q[0];                   // Prepare the source qubit
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Encodings for edges with controlled rotations
cx q[0], q[2];           // Source to Node 2
ry(1.0) q[2];            // Enhance node 2 with rotation
cx q[0], q[3];           // Source to Node 3
ry(1.0) q[3];            // Enhance node 3 with rotation
cx q[0], q[4];           // Source to Node 4
ry(1.0) q[4];            // Enhance node 4 with rotation
cx q[0], q[5];           // Source to Sink (Node 5)
ry(1.0) q[5];            // Enhance sink with rotation
cx q[2], q[3];           // Node 2 to Node 3
ry(1.0) q[3];            // Rotate Node 3
cx q[2], q[5];           // Node 2 to Sink
ry(1.0) q[5];            // Rotate Sink
cx q[3], q[1];           // Node 3 to Node 1
ry(1.0) q[1];            // Rotate Node 1
cx q[3], q[4];           // Node 3 to Node 4
ry(1.0) q[4];            // Rotate Node 4

// Layer 2
h q[0];                   // Prepare source qubit again
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final round of controlled gates
cx q[0], q[5];           // Final interaction with Sink
ry(1.0) q[5];            // Final rotation to sink
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