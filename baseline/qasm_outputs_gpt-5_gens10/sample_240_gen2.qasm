OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply controlled rotations based on edges
rz(0.4358) q[0]; // Connection to q[1]
cx q[0], q[1]; 

rz(0.4321) q[0]; // Connection to q[2]
cx q[0], q[2]; 

rz(0.4298) q[0]; // Connection to q[3]
cx q[0], q[3]; 

rz(0.4248) q[0]; // Connection to q[4]
cx q[0], q[4]; 

rz(0.4223) q[0]; // Connection to q[5]
cx q[0], q[5]; 

rz(0.4201) q[1]; // Connection to q[2]
cx q[1], q[2];

rz(0.3983) q[1]; // Connection to q[3]
cx q[1], q[3]; 

rz(0.4174) q[2]; // Connection to q[3]
cx q[2], q[3]; 

rz(0.4153) q[2]; // Connection to q[4]
cx q[2], q[4]; 

rz(0.4182) q[3]; // Connection to q[5]
cx q[3], q[5];

// Layer 2: Apply further rotations and entangling operations
h q[0];
rz(0.0764) q[0];
h q[0];

h q[1];
rz(0.0764) q[1];
h q[1];

h q[2];
rz(0.0764) q[2];
h q[2];

h q[3];
rz(0.0764) q[3];
h q[3];

h q[4];
rz(0.0764) q[4];
h q[4];

h q[5];
rz(0.0764) q[5];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];