OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer: Applying RX and RZ rotations based on the connections 
rx(1.5708) q[0]; // 90 degrees
rz(0.7854) q[0]; // 45 degrees
rx(1.5708) q[1]; // 90 degrees
rz(0.7854) q[1]; // 45 degrees
rx(1.5708) q[2]; // 90 degrees
rz(0.7854) q[2]; // 45 degrees
rx(1.5708) q[3]; // 90 degrees
rz(0.7854) q[3]; // 45 degrees
rx(1.5708) q[4]; // 90 degrees
rz(0.7854) q[4]; // 45 degrees
rx(1.5708) q[5]; // 90 degrees
rz(0.7854) q[5]; // 45 degrees

// Entangling operations for the edges
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];
cx q[4], q[5];

// Second layer: Undo and prepare for measurement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rz(0.7854) q[0]; // 45 degrees
rz(0.7854) q[1]; // 45 degrees
rz(0.7854) q[2]; // 45 degrees
rz(0.7854) q[3]; // 45 degrees
rz(0.7854) q[4]; // 45 degrees
rz(0.7854) q[5]; // 45 degrees

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];