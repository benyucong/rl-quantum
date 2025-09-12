OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
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

rx(0.5) q[0];
rx(0.3) q[1];
rx(0.7) q[2];
rx(0.4) q[3];
rx(0.2) q[4];
rx(0.6) q[5];
rx(0.1) q[6];
rx(0.8) q[7];
rx(0.5) q[8];
rx(0.3) q[9];
rx(0.4) q[10];

// Entangling operations based on graph edges
cx q[0], q[9]; // edge 0->9
cx q[1], q[3]; // edge 1->3
cx q[1], q[4]; // edge 1->4
cx q[2], q[1]; // edge 2->1
cx q[2], q[10]; // edge 2->10
cx q[3], q[4]; // edge 3->4
cx q[3], q[5]; // edge 3->5
cx q[3], q[8]; // edge 3->8
cx q[4], q[10]; // edge 4->10
cx q[5], q[10]; // edge 5->10
cx q[6], q[7]; // edge 6->7
cx q[6], q[8]; // edge 6->8
cx q[7], q[1]; // edge 7->1
cx q[7], q[2]; // edge 7->2
cx q[7], q[3]; // edge 7->3
cx q[8], q[5]; // edge 8->5
cx q[8], q[7]; // edge 8->7
cx q[9], q[1]; // edge 9->1
cx q[9], q[4]; // edge 9->4
cx q[9], q[8]; // edge 9->8

// Layer 2
rx(0.6) q[0];
rx(0.8) q[1];
rx(0.1) q[2];
rx(0.2) q[3];
rx(0.5) q[4];
rx(0.4) q[5];
rx(0.3) q[6];
rx(0.7) q[7];
rx(0.4) q[8];
rx(0.2) q[9];
rx(0.1) q[10];

// Final measurement
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