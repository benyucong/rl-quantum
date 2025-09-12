OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2 - Encoding capacities as controlled rotations
cu1(1.5708) q[0], q[1]; // 90 degrees between source and 1
cu1(1.5708) q[0], q[2]; // 90 degrees between source and 2
cu1(0.6435) q[0], q[5]; // 90 degrees between source and 5
cu1(0.6435) q[0], q[6]; // 90 degrees between source and 6
cu1(0.6435) q[1], q[2]; // 90 degrees between 1 and 2
cu1(0.6435) q[1], q[5]; // 90 degrees between 1 and 5
cu1(0.6435) q[1], q[6]; // 90 degrees between 1 and 6
cu1(1.5708) q[2], q[3]; // 90 degrees between 2 and 3
cu1(1.5708) q[2], q[5]; // 90 degrees between 2 and 5
cu1(1.5708) q[2], q[6]; // 90 degrees between 2 and 6
cu1(1.0472) q[2], q[7]; // 60 degrees between 2 and sink
cu1(0.6435) q[3], q[6]; // 90 degrees between 3 and 6
cu1(1.0472) q[4], q[3]; // 60 degrees between 4 and 3
cu1(1.0472) q[4], q[6]; // 60 degrees between 4 and 6

// Layer 3 - Final measurements
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];