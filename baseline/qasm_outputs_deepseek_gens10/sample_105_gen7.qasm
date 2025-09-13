OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Edge interactions
rz(0.7854) q[0];
rz(1.0472) q[0];
cx q[0], q[2];
rz(-0.3927) q[2];
cx q[0], q[2];
cx q[0], q[5];
rz(-0.5236) q[5];
cx q[0], q[5];
cx q[1], q[3];
rz(-1.1781) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.7854) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-1.1781) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.7854) q[5];
cx q[2], q[5];
cx q[4], q[2];
rz(-0.7854) q[2];
cx q[4], q[2];
cx q[4], q[6];
rz(-1.1781) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(-0.7854) q[6];
cx q[5], q[6];

// Layer 2 - Mixing and optimization
rz(0.5236) q[0];
rz(0.3927) q[1];
rz(0.6545) q[2];
rz(0.8727) q[3];
rz(0.6545) q[4];
rz(0.5236) q[5];
rz(0.3927) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 3 - Edge interactions
rz(0.6545) q[0];
rz(0.5236) q[0];
cx q[0], q[2];
rz(-0.3273) q[2];
cx q[0], q[2];
cx q[0], q[5];
rz(-0.4364) q[5];
cx q[0], q[5];
cx q[1], q[3];
rz(-0.9817) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.6545) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(-0.9817) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(-0.6545) q[5];
cx q[2], q[5];
cx q[4], q[2];
rz(-0.6545) q[2];
cx q[4], q[2];
cx q[4], q[6];
rz(-0.9817) q[6];
cx q[4], q[6];
cx q[5], q[6];
rz(-0.6545) q[6];
cx q[5], q[6];

// Layer 4 - Final optimization and measurement
rz(0.4364) q[0];
rz(0.3273) q[1];
rz(0.5455) q[2];
rz(0.7273) q[3];
rz(0.5455) q[4];
rz(0.4364) q[5];
rz(0.3273) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];