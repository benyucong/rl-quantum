OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Layer 1: Initialize qubits
h q[0]; // Source qubit
h q[1]; // Intermediate qubit
h q[2]; // Intermediate qubit
h q[3]; // Intermediate qubit
h q[4]; // Intermediate qubit
h q[5]; // Sink qubit

// Layer 2: Apply controlled operations based on graph edges
cx q[0], q[2]; // Edge (0, 2) with capacity 3
cx q[1], q[5]; // Edge (1, 5) with capacity 3
cx q[2], q[5]; // Edge (2, 5) with capacity 4
cx q[4], q[1]; // Edge (4, 1) with capacity 4
cx q[4], q[3]; // Edge (4, 3) with capacity 3
cx q[4], q[5]; // Edge (4, 5) with capacity 6

// Layer 3: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure the qubits
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
c[14] = measure q[14];