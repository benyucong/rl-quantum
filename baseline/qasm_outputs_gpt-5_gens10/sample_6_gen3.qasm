OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Layer 1
h q[0];
h q[1];
h q[2];
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];

// Layer 2
rx(1.5708) q[0];  // π/2 rotation
rx(1.5708) q[1];  // π/2 rotation
rx(1.5708) q[2];  // π/2 rotation
rz(0.7854) q[0];  // π/4 rotation
rz(0.7854) q[1];  // π/4 rotation
rz(0.7854) q[2];  // π/4 rotation
cx q[0], q[1];
cx q[1], q[2];

// Layer 3
h q[0];
h q[1];
h q[2];
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];