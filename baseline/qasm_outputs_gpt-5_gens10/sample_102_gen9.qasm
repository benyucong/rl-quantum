OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Initialization
h q[0]; // Start with superposition at source
h q[1]; // Prepare second layer
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Encode flow from source to nodes
cx q[0], q[2]; // Source to node 2
cx q[0], q[3]; // Source to node 3
cx q[0], q[4]; // Source to node 4
cx q[0], q[5]; // Source to sink

// Layer 2: Encode flow between nodes and towards sink
cx q[2], q[3]; // Node 2 to Node 3
cx q[2], q[5]; // Node 2 to sink
cx q[3], q[1]; // Node 3 to Node 1 (part of the flow)
cx q[3], q[4]; // Node 3 to Node 4

// Measurement to extract the flow results
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];