OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Apply controlled rotations based on the graph's flow capacities
cu3(0.4, 0.2, 0.3) q[0], q[5]; // Edge 0 -> 5
cu3(0.3, 0.1, 0.2) q[1], q[2]; // Edge 1 -> 2
cu3(0.1, 0.3, 0.1) q[1], q[5]; // Edge 1 -> 5
cu3(0.2, 0.5, 0.2) q[2], q[4]; // Edge 2 -> 4
cu3(0.4, 0.2, 0.5) q[3], q[2]; // Edge 3 -> 2
cu3(0.5, 0.4, 0.3) q[3], q[5]; // Edge 3 -> 5

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure final state
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];