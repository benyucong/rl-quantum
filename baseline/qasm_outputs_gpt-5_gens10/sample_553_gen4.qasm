OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Prepare initial superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply entangling gates based on the graph structure
cx q[0], q[2]; // Edge 0 -> 2
cx q[1], q[2]; // Edge 1 -> 2
cx q[3], q[4]; // Edge 3 -> 4
cx q[4], q[5]; // Edge 4 -> 5

// Layer 3: Apply additional rotations to enhance entanglement
rz(0.1) q[2];
rz(0.2) q[4];
rz(0.1) q[5];

// Layer 4: Measure the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];