OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1 connections based on the edges
cx q[0], q[1]; // 0 -> 1
cx q[1], q[2]; // 1 -> 2
cx q[3], q[4]; // 3 -> 4
cx q[4], q[5]; // 4 -> 5
cx q[4], q[7]; // 4 -> 7
cx q[4], q[8]; // 4 -> 8
cx q[4], q[9]; // 4 -> 9
cx q[5], q[7]; // 5 -> 7
cx q[5], q[9]; // 5 -> 9
cx q[6], q[7]; // 6 -> 7

// Layer 2 connections to build up the entanglement
cx q[1], q[3]; // Connect node 1 to node 3
cx q[5], q[6]; // Connect node 5 to node 6
cx q[7], q[8]; // Connect node 7 to node 8
cx q[8], q[9]; // Connect node 8 to node 9

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];