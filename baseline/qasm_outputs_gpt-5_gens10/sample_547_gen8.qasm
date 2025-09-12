OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0]; // Initialize qubit 0 (source)
h q[1]; // Initialize qubit 1
h q[2]; // Initialize qubit 2
h q[3]; // Initialize qubit 3
h q[4]; // Initialize qubit 4
h q[5]; // Initialize qubit 5
h q[6]; // Initialize qubit 6
h q[7]; // Initialize qubit 7
h q[8]; // Initialize qubit 8
h q[9]; // Initialize qubit 9
h q[10]; // Initialize qubit 10
h q[11]; // Initialize qubit 11

// Layer 2
cx q[0], q[6]; // Connect source to node 6
cx q[3], q[8]; // Connect node 3 to node 8
cx q[4], q[8]; // Connect node 4 to node 8
cx q[5], q[10]; // Connect node 5 to node 10

// Layer 3
cx q[6], q[1]; // Connect node 6 to node 1 (target)
cx q[6], q[2]; // Connect node 6 to node 2
cx q[6], q[4]; // Connect node 6 to node 4
cx q[6], q[9]; // Connect node 6 to node 9
cx q[6], q[11]; // Connect node 6 to node 11
cx q[7], q[9]; // Connect node 7 to node 9

// Layer 4
cx q[8], q[5]; // Connect node 8 to node 5
cx q[9], q[6]; // Connect node 9 back to node 6
cx q[10], q[1]; // Connect node 10 to node 1
cx q[10], q[4]; // Connect node 10 to node 4
cx q[10], q[8]; // Connect node 10 to node 8

// Measurements
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