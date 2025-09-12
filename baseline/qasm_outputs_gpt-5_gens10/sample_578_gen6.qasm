OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Initial preparation
h q[0];
h q[1];
h q[2];

// First layer of gates
rx(1.5708) q[0];
ry(1.5708) q[1];
rz(3.1416) q[2];
cx q[0], q[1];
cx q[1], q[2];

// Second layer of gates
rz(0.7854) q[0];
ry(1.0472) q[1];
rx(0.5236) q[2];
cx q[0], q[2];
h q[1];

// Third layer of gates
rx(2.3562) q[0];
ry(0.7854) q[1];
rz(1.5708) q[2];
cx q[1], q[2];
h q[0];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];