OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Prepare the initial state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply controlled operations based on the graph structure
cx q[0], q[1]; // Source to Node 1
rzz(0.7548) q[1], q[3]; // Interaction based on edge (1, 3)
cx q[0], q[3]; // Source to Node 3
cx q[1], q[4]; // Node 1 to Sink
rzz(0.9023) q[4], q[2]; // Node 2 to Sink interaction
cx q[2], q[3]; // Node 3 and Node 2 interaction

// Layer 3: Final adjustments and measurements
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];