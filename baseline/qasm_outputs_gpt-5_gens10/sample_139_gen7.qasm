OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialization and entangling gates
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
rx(0.785) q[0]; // Rotation to encode community structure
rx(0.785) q[1]; 
rx(0.785) q[2]; 
rx(0.785) q[3];

// Layer 2: Entangling and final rotations
cx q[0], q[2]; 
cx q[1], q[3];
rz(1.5708) q[2]; // Similar rotations to enhance community detection
rz(1.5708) q[3];
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];