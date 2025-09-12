OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Preparing the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled operations based on the edges
cx q[0], q[1]; // Source to Node 1
cx q[0], q[5]; // Source to Sink
cx q[1], q[5]; // Node 1 to Sink
cx q[2], q[4]; // Node 2 to Node 4
cx q[3], q[4]; // Node 3 to Node 4
cx q[4], q[1]; // Node 4 to Node 1
cx q[4], q[3]; // Node 4 to Node 3
cx q[4], q[5]; // Node 4 to Sink

// Layer 3: Measure the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];