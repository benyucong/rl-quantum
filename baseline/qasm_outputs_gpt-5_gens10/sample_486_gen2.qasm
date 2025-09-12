OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initialize and create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply controlled gates representing edges with weights
cx q[0], q[5]; // weight 6
cx q[0], q[8]; // weight 18
cx q[1], q[6]; // weight 6
cx q[2], q[7]; // weight 5
cx q[2], q[12]; // weight 19
cx q[3], q[8]; // weight 7
cx q[3], q[5]; // weight 13
cx q[4], q[9]; // weight 1
cx q[4], q[5]; // weight 14
cx q[4], q[8]; // weight 12

// Layer 3: Finalize state and measure
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
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];