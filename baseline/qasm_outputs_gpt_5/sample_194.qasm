OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

cx q[0], q[3]; // Capacity: 2
cx q[0], q[5]; // Capacity: 1
cx q[1], q[2]; // Capacity: 1
cx q[1], q[4]; // Capacity: 1
cx q[3], q[1]; // Capacity: 2
cx q[3], q[5]; // Capacity: 2
cx q[4], q[1]; // Capacity: 1
cx q[4], q[2]; // Capacity: 2

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rx(1.5708) q[0]; // Rotate for measurement preparation
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];