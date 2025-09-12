OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Encoding the edges of the directed graph with controlled rotations
rx(0.7854) q[0]; // rotation based on edge (0 -> 1)
cx q[0], q[1];
rx(1.5708) q[0]; // rotation based on edge (0 -> 3)
cx q[0], q[3];

// Flow from node 1 to node 2
rx(0.7854) q[1]; 
cx q[1], q[2];
rx(0.7854) q[1]; // rotation based on edge (1 -> 5)
cx q[1], q[5];

// Flow from node 2 to nodes 1 and 4
rx(0.7854) q[2]; 
cx q[2], q[1];
rx(0.7854) q[2]; 
cx q[2], q[4];

// Flow from node 4 to nodes 2 and 1
rx(0.7854) q[4]; 
cx q[4], q[1];
rx(0.7854) q[4]; 
cx q[4], q[2];

// Measurement
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