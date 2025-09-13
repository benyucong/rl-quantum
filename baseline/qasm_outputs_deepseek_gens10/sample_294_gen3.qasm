OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initial state preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 1: Problem unitary (edges: 0-2, 0-3, 0-1, 1-4)
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

cx q[0], q[2];
rz(1.5708) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(1.5708) q[3];
cx q[0], q[3];

cx q[0], q[1];
rz(1.5708) q[1];
cx q[0], q[1];

cx q[1], q[4];
rz(1.5708) q[4];
cx q[1], q[4];

// Layer 1: Mixer unitary
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

// Layer 2: Problem unitary
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];

cx q[0], q[2];
rz(2.3562) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(2.3562) q[3];
cx q[0], q[3];

cx q[0], q[1];
rz(2.3562) q[1];
cx q[0], q[1];

cx q[1], q[4];
rz(2.3562) q[4];
cx q[1], q[4];

// Layer 2: Mixer unitary
h q[0];
rz(2.3562) q[0];
h q[0];

h q[1];
rz(2.3562) q[1];
h q[1];

h q[2];
rz(2.3562) q[2];
h q[2];

h q[3];
rz(2.3562) q[3];
h q[3];

h q[4];
rz(2.3562) q[4];
h q[4];

// Layer 3: Problem unitary
rz(1.9635) q[0];
rz(1.9635) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

cx q[0], q[2];
rz(3.1416) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(3.1416) q[3];
cx q[0], q[3];

cx q[0], q[1];
rz(3.1416) q[1];
cx q[0], q[1];

cx q[1], q[4];
rz(3.1416) q[4];
cx q[1], q[4];

// Layer 3: Mixer unitary
h q[0];
rz(3.1416) q[0];
h q[0];

h q[1];
rz(3.1416) q[1];
h q[1];

h q[2];
rz(3.1416) q[2];
h q[2];

h q[3];
rz(3.1416) q[3];
h q[3];

h q[4];
rz(3.1416) q[4];
h q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];