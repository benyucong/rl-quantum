OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Apply controlled rotations based on the edges of the graph
// Edges: (0,1), (0,2), (1,2), (2,4), (4,3)

// Controlled rotation for edge (0,1)
rz(0.5) q[1]; 
cx q[0], q[1];

// Controlled rotation for edge (0,2)
rz(0.5) q[2];
cx q[0], q[2];

// Controlled rotation for edge (1,2)
rz(0.5) q[2];
cx q[1], q[2];

// Controlled rotation for edge (2,4)
rz(0.5) q[4];
cx q[2], q[4];

// Controlled rotation for edge (4,3)
rz(0.5) q[3];
cx q[4], q[3];

// Layer 2: Final layer of rotations to adjust the amplitude
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Second round of controlled rotations
rz(0.5) q[1]; 
cx q[0], q[1];

rz(0.5) q[2];
cx q[0], q[2];

rz(0.5) q[2];
cx q[1], q[2];

rz(0.5) q[4];
cx q[2], q[4];

rz(0.5) q[3];
cx q[4], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];