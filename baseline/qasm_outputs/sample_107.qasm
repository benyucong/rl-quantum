OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.7854) q[8];

// Edge interactions (0-1)
cx q[0], q[1];
rz(0.6283) q[1];
cx q[0], q[1];

// Edge interactions (0-6)
cx q[0], q[6];
rz(0.8168) q[6];
cx q[0], q[6];

// Edge interactions (0-5)
cx q[0], q[5];
rz(0.8168) q[5];
cx q[0], q[5];

// Edge interactions (1-2)
cx q[1], q[2];
rz(0.6283) q[2];
cx q[1], q[2];

// Edge interactions (2-3)
cx q[2], q[3];
rz(0.3142) q[3];
cx q[2], q[3];

// Edge interactions (2-7)
cx q[2], q[7];
rz(0.9425) q[7];
cx q[2], q[7];

// Edge interactions (4-5)
cx q[4], q[5];
rz(0.1571) q[5];
cx q[4], q[5];

// Edge interactions (4-7)
cx q[4], q[7];
rz(0.5498) q[7];
cx q[4], q[7];

// Edge interactions (6-7)
cx q[6], q[7];
rz(0.1963) q[7];
cx q[6], q[7];

// Layer 2
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rz(1.5708) q[8];

// Repeat edge interactions with updated parameters
cx q[0], q[1];
rz(0.4712) q[1];
cx q[0], q[1];

cx q[0], q[6];
rz(0.6126) q[6];
cx q[0], q[6];

cx q[0], q[5];
rz(0.6126) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.4712) q[2];
cx q[1], q[2];

cx q[2], q[3];
rz(0.2356) q[3];
cx q[2], q[3];

cx q[2], q[7];
rz(0.7069) q[7];
cx q[2], q[7];

cx q[4], q[5];
rz(0.1178) q[5];
cx q[4], q[5];

cx q[4], q[7];
rz(0.4123) q[7];
cx q[4], q[7];

cx q[6], q[7];
rz(0.1473) q[7];
cx q[6], q[7];

// Layer 3
rx(1.1781) q[0];
rx(1.1781) q[1];
rx(1.1781) q[2];
rx(1.1781) q[3];
rx(1.1781) q[4];
rx(1.1781) q[5];
rx(1.1781) q[6];
rx(1.1781) q[7];
rz(2.3562) q[8];

// Final edge interactions
cx q[0], q[1];
rz(0.3534) q[1];
cx q[0], q[1];

cx q[0], q[6];
rz(0.4594) q[6];
cx q[0], q[6];

cx q[0], q[5];
rz(0.4594) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.3534) q[2];
cx q[1], q[2];

cx q[2], q[3];
rz(0.1767) q[3];
cx q[2], q[3];

cx q[2], q[7];
rz(0.5301) q[7];
cx q[2], q[7];

cx q[4], q[5];
rz(0.0884) q[5];
cx q[4], q[5];

cx q[4], q[7];
rz(0.3092) q[7];
cx q[4], q[7];

cx q[6], q[7];
rz(0.1105) q[7];
cx q[6], q[7];

// Layer 4 - Measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(3.1416) q[8];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];