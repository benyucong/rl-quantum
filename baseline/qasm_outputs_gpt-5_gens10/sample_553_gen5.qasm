OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First Layer
cx q[0], q[2]; // Connect 0 to 2
cx q[1], q[2]; // Connect 1 to 2
cx q[3], q[4]; // Connect 3 to 4

// Second Layer
rz(1.2) q[2];  // Rotate around Z on qubit 2
cx q[2], q[3]; // Connect the component on node 2 to node 3

// Third Layer
rz(0.8) q[4];  // Rotate around Z on qubit 4
cx q[4], q[5]; // Connect node 4 to node 5

// Fourth Layer
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