OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// First layer
h q[0]; // Initialize for Min-Cut problem
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Created entangling gates based on the edges for the Min-Cut problem
cx q[0], q[1]; // Edge 0 -> 1
cx q[0], q[4]; // Edge 0 -> 4
cx q[0], q[5]; // Edge 0 -> 5
cx q[0], q[6]; // Edge 0 -> 6
cx q[1], q[2]; // Edge 1 -> 2
cx q[1], q[3]; // Edge 1 -> 3
cx q[1], q[5]; // Edge 1 -> 5
cx q[1], q[6]; // Edge 1 -> 6
cx q[2], q[3]; // Edge 2 -> 3
cx q[2], q[4]; // Edge 2 -> 4
cx q[3], q[4]; // Edge 3 -> 4
cx q[4], q[7]; // Edge 4 -> 7

// Second layer with rotation gates optimizing the encoding
rx(0.5) q[0];
rx(0.5) q[1];
rx(0.5) q[2];
rx(0.5) q[3];
rx(0.5) q[4];
rx(0.5) q[5];
rx(0.5) q[6];
rx(0.5) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];