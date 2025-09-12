OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Apply Hadamard gates to create superposition
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

// Create entanglement for connected components
cx q[0], q[1]; // Edge from 0 to 1
cx q[0], q[2]; // Edge from 0 to 2
cx q[0], q[3]; // Edge from 0 to 3
cx q[1], q[3]; // Edge from 1 to 3
cx q[4], q[5]; // Edge from 4 to 5
cx q[6], q[7]; // Edge from 6 to 7
cx q[8], q[9]; // Edge from 8 to 9
cx q[8], q[11]; // Edge from 8 to 11
cx q[9], q[11]; // Edge from 9 to 11
cx q[10], q[11]; // Edge from 10 to 11

// Measurement to obtain components
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