OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1 - Initialization and first parameterized rotations
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];

// Entanglement for max flow problem
cx q[0], q[1];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[1];
cx q[2], q[3];

// Layer 2 - Second parameterized rotations
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(1.0472) q[3];

// Second entanglement layer
cx q[0], q[1];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[1];
cx q[2], q[3];

// Layer 3 - Final parameterized rotations
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.5236) q[3];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];