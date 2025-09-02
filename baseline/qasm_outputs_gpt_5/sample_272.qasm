OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize Hadamard gates to create superposition
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled-X gates based on the bipartite matching graph
cx q[0], q[4]; // match node 0 with node 4
cx q[0], q[6]; // match node 0 with node 6
cx q[1], q[5]; // match node 1 with node 5
cx q[1], q[8]; // match node 1 with node 8
cx q[2], q[6]; // match node 2 with node 6
cx q[2], q[7]; // match node 2 with node 7
cx q[2], q[4]; // match node 2 with node 4
cx q[3], q[7]; // match node 3 with node 7
cx q[3], q[6]; // match node 3 with node 6

// Layer 3: Apply final Hadamard gates to map to computational basis
h q[0];
h q[1];
h q[2];
h q[3];

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