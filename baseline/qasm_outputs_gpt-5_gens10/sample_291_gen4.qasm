OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1 - Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2 - First set of entangling gates
cx q[0], q[2]; // 0 -> 2
cx q[0], q[4]; // 0 -> 4
cx q[1], q[2]; // 1 -> 2
cx q[1], q[3]; // 1 -> 3

// Layer 3 - RZ and additional entangling gates
rz(0.5) q[2]; 
rz(0.5) q[4]; 
cx q[2], q[1]; // 2 -> 1
cx q[3], q[1]; // 3 -> 1
rz(0.3) q[3]; 

// Layer 4 - Final rotations and measurements
rz(0.5) q[0];
rz(0.5) q[1];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];