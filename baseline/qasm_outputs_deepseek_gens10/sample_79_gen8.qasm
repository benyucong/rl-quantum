OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply RZZ gates for edge constraints with optimal parameters
rz(0.7854) q[0];
rz(0.7854) q[3];
cx q[0], q[3];
rz(-0.3927) q[3];
cx q[0], q[3];

rz(1.9635) q[0];
rz(1.9635) q[10];
cx q[0], q[10];
rz(-0.9817) q[10];
cx q[0], q[10];

rz(3.1416) q[0];
rz(3.1416) q[5];
cx q[0], q[5];
rz(-1.5708) q[5];
cx q[0], q[5];

rz(0.1571) q[1];
rz(0.1571) q[4];
cx q[1], q[4];
rz(-0.0785) q[4];
cx q[1], q[4];

rz(2.3562) q[1];
rz(2.3562) q[3];
cx q[1], q[3];
rz(-1.1781) q[3];
cx q[1], q[3];

rz(2.3562) q[1];
rz(2.3562) q[7];
cx q[1], q[7];
rz(-1.1781) q[7];
cx q[1], q[7];

rz(0.7854) q[2];
rz(0.7854) q[5];
cx q[2], q[5];
rz(-0.3927) q[5];
cx q[2], q[5];

rz(2.1991) q[2];
rz(2.1991) q[6];
cx q[2], q[6];
rz(-1.0995) q[6];
cx q[2], q[6];

// Layer 2: Mixing and optimization
h q[0];
rz(0.5236) q[0];
h q[0];

h q[1];
rz(0.5236) q[1];
h q[1];

h q[2];
rz(0.5236) q[2];
h q[2];

h q[3];
rz(0.5236) q[3];
h q[3];

h q[4];
rz(0.5236) q[4];
h q[4];

h q[5];
rz(0.5236) q[5];
h q[5];

h q[6];
rz(0.5236) q[6];
h q[6];

h q[7];
rz(0.5236) q[7];
h q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];