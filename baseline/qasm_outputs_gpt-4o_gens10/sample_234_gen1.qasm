OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize qubits
h q[0]; // Source
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4
h q[5]; // Node 5
h q[6]; // Node 6
h q[7]; // Sink

// Layer 2: Apply controlled operations based on edges
// Edges from source
cx q[0], q[1]; // 0 -> 1
cx q[0], q[2]; // 0 -> 2

// Edges from nodes
cx q[1], q[6]; // 1 -> 6
cx q[2], q[5]; // 2 -> 5
cx q[3], q[4]; // 3 -> 4
cx q[3], q[7]; // 3 -> 7
cx q[4], q[7]; // 4 -> 7
cx q[5], q[1]; // 5 -> 1
cx q[5], q[3]; // 5 -> 3
cx q[5], q[7]; // 5 -> 7
cx q[6], q[1]; // 6 -> 1
cx q[6], q[5]; // 6 -> 5
cx q[6], q[7]; // 6 -> 7

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];