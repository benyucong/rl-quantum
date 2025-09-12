OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0]; // Initialize source
h q[1]; // Auxiliary nodes
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8]; // Initialize sink

// Apply controlled operations based on capacities
cx q[0], q[4]; // 0 -> 4, capacity 2
cx q[0], q[5]; // 0 -> 5, capacity 1
cx q[0], q[8]; // 0 -> 8, capacity 2
cx q[1], q[2]; // 1 -> 2, capacity 2
cx q[2], q[3]; // 2 -> 3, capacity 2
cx q[2], q[4]; // 2 -> 4, capacity 1
cx q[2], q[5]; // 2 -> 5, capacity 2
cx q[2], q[7]; // 2 -> 7, capacity 1
cx q[3], q[4]; // 3 -> 4, capacity 2
cx q[3], q[5]; // 3 -> 5, capacity 2
cx q[3], q[7]; // 3 -> 7, capacity 2
cx q[4], q[5]; // 4 -> 5, capacity 2
cx q[6], q[2]; // 6 -> 2, capacity 2
cx q[6], q[4]; // 6 -> 4, capacity 1
cx q[7], q[5]; // 7 -> 5, capacity 2
cx q[7], q[8]; // 7 -> 8, capacity 2

// Layer 2
h q[0];
rz(-0.124) q[0];
h q[0];

h q[1];
rz(-0.042) q[1];
h q[1];

h q[2];
rz(-0.069) q[2];
h q[2];

h q[3];
rz(-0.054) q[3];
h q[3];

h q[4];
rz(-0.087) q[4];
h q[4];

h q[5];
rz(-0.063) q[5];
h q[5];

h q[6];
rz(-0.050) q[6];
h q[6];

h q[7];
rz(-0.038) q[7];
h q[7];

h q[8];
rz(-0.072) q[8];
h q[8];

// Measure
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];