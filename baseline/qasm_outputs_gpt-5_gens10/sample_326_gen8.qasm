OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];

// Layer 2
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[1];
cx q[0], q[2];

// Layer 3
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
h q[0];
h q[1];
h q[2];
h q[3];
cx q[1], q[2];
cx q[1], q[3];

// Layer 4
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[3];
cx q[2], q[3];

// Measure final states
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];