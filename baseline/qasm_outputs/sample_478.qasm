OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1 - Problem Unitary
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(3.1416) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(3.1416) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(3.9269) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];
cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];
cx q[4], q[3];
rz(3.9269) q[3];
cx q[4], q[3];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Layer 1 - Mixer Unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Layer 2 - Problem Unitary
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(3.1416) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(3.1416) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(3.9269) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];
cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];
cx q[4], q[3];
rz(3.9269) q[3];
cx q[4], q[3];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Layer 2 - Mixer Unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Layer 3 - Problem Unitary
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(3.1416) q[5];
cx q[0], q[5];
cx q[1], q[5];
rz(3.1416) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(3.9269) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];
cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];
cx q[4], q[3];
rz(3.9269) q[3];
cx q[4], q[3];
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];