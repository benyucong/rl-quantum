OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize and apply Hadamard gates to the left nodes
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Apply controlled rotations based on the edges
rx(0.543) q[0];
cx q[0], q[9];
rx(0.543) q[1];
cx q[1], q[10];
rx(0.543) q[2];
cx q[2], q[10];
rx(0.543) q[2];
cx q[2], q[11];
rx(0.543) q[5];
cx q[5], q[10];
rx(0.543) q[6];
cx q[6], q[11];
rx(0.543) q[8];
cx q[8], q[10];

// Layer 3: Apply final Hadamard gates before measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];