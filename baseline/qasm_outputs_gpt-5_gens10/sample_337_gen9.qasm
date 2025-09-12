OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initializing qubits with Hadamard gates to create superposition
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

// Applying Controlled NOT gates based on the provided bipartite matching edges
cx q[0], q[7]; // Edge: 0 - 7
cx q[1], q[8]; // Edge: 1 - 8
cx q[2], q[9]; // Edge: 2 - 9
cx q[2], q[8]; // Edge: 2 - 8
cx q[2], q[12]; // Edge: 2 - 12
cx q[2], q[13]; // Edge: 2 - 13
cx q[3], q[10]; // Edge: 3 - 10
cx q[3], q[13]; // Edge: 3 - 13
cx q[4], q[11]; // Edge: 4 - 11
cx q[5], q[12]; // Edge: 5 - 12
cx q[6], q[13]; // Edge: 6 - 13
cx q[6], q[8]; // Edge: 6 - 8

// Final measurements to obtain the solution
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