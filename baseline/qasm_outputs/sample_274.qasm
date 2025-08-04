OPENQASM 3.0;
include "stdgates.inc";
bit[16] c;
qubit[16] q;

// Layer 1 - Initialization and first mixers
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.7854) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(0.7854) q[3];
rz(1.5708) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Layer 1 - Problem unitary (flow constraints)
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];
cx q[1], q[6];
rz(0.5236) q[6];
cx q[1], q[6];
cx q[4], q[1];
rz(0.5236) q[1];
cx q[4], q[1];
cx q[4], q[2];
rz(0.5236) q[2];
cx q[4], q[2];
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];
cx q[5], q[3];
rz(0.5236) q[3];
cx q[5], q[3];

// Layer 2 - Mixer unitary
h q[0];
rz(1.0472) q[0];
h q[0];
h q[1];
rz(1.0472) q[1];
h q[1];
h q[2];
rz(1.0472) q[2];
h q[2];
h q[3];
rz(1.0472) q[3];
h q[3];
h q[4];
rz(1.0472) q[4];
h q[4];
h q[5];
rz(1.0472) q[5];
h q[5];
h q[6];
rz(1.0472) q[6];
h q[6];

// Layer 2 - Problem unitary (flow constraints)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];
cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];
cx q[4], q[2];
rz(0.7854) q[2];
cx q[4], q[2];
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];
cx q[5], q[3];
rz(0.7854) q[3];
cx q[5], q[3];

// Layer 3 - Final mixer
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];
h q[5];
rz(1.5708) q[5];
h q[5];
h q[6];
rz(1.5708) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];