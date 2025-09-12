OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Applying controlled operations to encode the graph structure
cx q[0], q[3]; // 0 -> 3
cx q[0], q[4]; // 0 -> 4
cx q[1], q[3]; // 1 -> 3
cx q[2], q[3]; // 2 -> 3
cx q[2], q[4]; // 2 -> 4
cx q[3], q[4]; // 3 -> 4
cx q[5], q[7]; // 5 -> 7
cx q[6], q[7]; // 6 -> 7
cx q[7], q[8]; // 7 -> 8

// Measure the qubits to extract the connected components information
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];