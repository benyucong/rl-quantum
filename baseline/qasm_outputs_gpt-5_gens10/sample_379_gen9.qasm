OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialization
h q[0]; // Prepare superposition
h q[1];
h q[2];
h q[3];

// First layer of entangling gates
cx q[0], q[2]; // connect source to a node
cx q[1], q[2]; // connect additional node to a node
cx q[0], q[3]; // connect source to sink
cx q[1], q[3]; // connect additional node to sink

// Second layer of rotations
rz(0.3284) q[2];
rz(0.6813) q[3];
rz(-0.2142) q[0];
rz(0.9992) q[1];

// Third layer of entangling gates
cx q[2], q[3];
cx q[0], q[2];
cx q[1], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];