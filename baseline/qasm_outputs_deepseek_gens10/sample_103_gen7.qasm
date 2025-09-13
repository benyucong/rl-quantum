OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// Edge interactions with capacity-weighted parameters
// Layer 1: First set of edge interactions
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(1.5708) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(1.1781) q[3];
cx q[0], q[3];
cx q[0], q[6];
rz(1.1781) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];
cx q[1], q[6];
rz(1.9635) q[6];
cx q[1], q[6];
cx q[1], q[8];
rz(0.7854) q[8];
cx q[1], q[8];
cx q[2], q[3];
rz(2.3562) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];
cx q[2], q[5];
rz(1.9635) q[5];
cx q[2], q[5];
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];
cx q[2], q[9];
rz(0.7854) q[9];
cx q[2], q[9];
cx q[3], q[7];
rz(1.9635) q[7];
cx q[3], q[7];
cx q[4], q[1];
rz(2.3562) q[1];
cx q[4], q[1];
cx q[4], q[2];
rz(0.7854) q[2];
cx q[4], q[2];
cx q[4], q[3];
rz(2.3562) q[3];
cx q[4], q[3];
cx q[4], q[6];
rz(0.7854) q[6];
cx q[4], q[6];
cx q[4], q[7];
rz(1.1781) q[7];
cx q[4], q[7];
cx q[5], q[1];
rz(1.1781) q[1];
cx q[5], q[1];
cx q[5], q[6];
rz(1.9635) q[6];
cx q[5], q[6];
cx q[5], q[7];
rz(1.1781) q[7];
cx q[5], q[7];
cx q[6], q[1];
rz(1.5708) q[1];
cx q[6], q[1];
cx q[6], q[2];
rz(0.7854) q[2];
cx q[6], q[2];
cx q[6], q[7];
rz(2.3562) q[7];
cx q[6], q[7];
cx q[6], q[8];
rz(1.5708) q[8];
cx q[6], q[8];
cx q[7], q[2];
rz(1.9635) q[2];
cx q[7], q[2];
cx q[7], q[4];
rz(2.3562) q[4];
cx q[7], q[4];
cx q[7], q[9];
rz(2.3562) q[9];
cx q[7], q[9];
cx q[8], q[1];
rz(1.1781) q[1];
cx q[8], q[1];
cx q[8], q[9];
rz(1.1781) q[9];
cx q[8], q[9];

// Layer 2: Mixer layer with parameterized rotations
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];
rx(0.5236) q[8];
rx(0.5236) q[9];

// Layer 3: Final edge interactions with source-sink constraints
// Source constraint (node 0)
rz(2.0944) q[0];
// Sink constraint (node 9)
rz(-2.0944) q[9];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];