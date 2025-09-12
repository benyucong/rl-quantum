OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

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

cx q[0], q[6]; // 0 -> 6
cx q[0], q[8]; // 0 -> 8
cx q[1], q[4]; // 1 -> 4
cx q[1], q[5]; // 1 -> 5
cx q[1], q[6]; // 1 -> 6
cx q[1], q[7]; // 1 -> 7
cx q[2], q[8]; // 2 -> 8
cx q[3], q[2]; // 3 -> 2

// Layer 2
cx q[4], q[5]; // 4 <-> 5
cx q[4], q[7]; // 4 <-> 7
cx q[6], q[5]; // 6 <-> 5
cx q[6], q[7]; // 6 <-> 7
cx q[7], q[3]; // 7 <-> 3
cx q[7], q[4]; // 7 <-> 4
cx q[7], q[5]; // 7 <-> 5

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