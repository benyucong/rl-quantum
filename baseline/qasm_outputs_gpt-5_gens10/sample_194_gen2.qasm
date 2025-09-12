OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// First Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rx(1.5708) q[0]; // rotation for source node
rx(0.7854) q[1]; // rotation for intermediate node
rx(1.5708) q[2]; // rotation for intermediate node
ry(1.0472) q[3]; // rotation for intermediate node
ry(0.7854) q[4]; // rotation for intermediate node
ry(1.5708) q[5]; // rotation for sink node

// Connecting edges with controlled gates
cx q[0], q[3]; // edge 0-3
rz(0.5) q[3];
cx q[0], q[5]; // edge 0-5
rz(0.2) q[5];
cx q[1], q[2]; // edge 1-2
rz(0.1) q[2];
cx q[1], q[4]; // edge 1-4
rz(0.3) q[4];
cx q[3], q[1]; // edge 3-1
rz(0.4) q[1];
cx q[3], q[5]; // edge 3-5
rz(0.6) q[5];
cx q[4], q[1]; // edge 4-1
rz(0.5) q[1];
cx q[4], q[2]; // edge 4-2
rz(0.2) q[2];

// Second Layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

rx(1.5708) q[0];
rx(0.7854) q[1];
rx(1.5708) q[2];
ry(1.0472) q[3];
ry(0.7854) q[4];
ry(1.5708) q[5];

cx q[1], q[3]; // connecting through the second layer
rz(0.5) q[3];
cx q[3], q[4]; // connecting through the second layer
rz(0.4) q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];