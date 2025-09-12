OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];

// Encoding edges with Controlled-X gates based on capacities
cx q[0], q[1]; // 0 -> 1
cx q[0], q[2]; // 0 -> 2
cx q[0], q[4]; // 0 -> 4
cx q[1], q[6]; // 1 -> 6
cx q[2], q[1]; // 2 -> 1
cx q[2], q[4]; // 2 -> 4
cx q[3], q[5]; // 3 -> 5
cx q[4], q[2]; // 4 -> 2
cx q[4], q[6]; // 4 -> 6
cx q[5], q[1]; // 5 -> 1
cx q[5], q[3]; // 5 -> 3

// Layer 2
rx(1.5708) q[7]; // Rotate q[7] to prepare for measurement
rz(0.5) q[5]; // Adjust phase on q[5]
cx q[1], q[6]; // 1 -> 6
rz(-0.5) q[6]; // Phase adjustment for q[6]

// Layer 3
h q[0];
h q[2];
h q[4];
h q[6];

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
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];