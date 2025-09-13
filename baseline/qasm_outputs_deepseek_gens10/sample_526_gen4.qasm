OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1
rz(0.7854) q[0];
rz(1.5708) q[1];
rz(2.3562) q[2];
rz(0.3927) q[3];
rz(1.1781) q[4];
rz(1.9635) q[5];
rz(0.7854) q[6];
rz(2.3562) q[7];

cx q[0], q[1];
rz(-0.5236) q[1];
cx q[0], q[1];

cx q[2], q[3];
rz(-0.3491) q[3];
cx q[2], q[3];

cx q[4], q[5];
rz(-0.6981) q[5];
cx q[4], q[5];

cx q[6], q[7];
rz(-0.2618) q[7];
cx q[6], q[7];

// Layer 2
rz(1.0472) q[0];
rz(0.5236) q[1];
rz(1.7453) q[2];
rz(0.8727) q[3];
rz(1.3963) q[4];
rz(0.6981) q[5];
rz(1.2217) q[6];
rz(0.6109) q[7];

cx q[1], q[2];
rz(-0.4363) q[2];
cx q[1], q[2];

cx q[3], q[4];
rz(-0.8727) q[4];
cx q[3], q[4];

cx q[5], q[6];
rz(-0.3491) q[6];
cx q[5], q[6];

// Layer 3
rz(0.6109) q[0];
rz(1.2217) q[1];
rz(0.6981) q[2];
rz(1.3963) q[3];
rz(0.8727) q[4];
rz(1.7453) q[5];
rz(0.5236) q[6];
rz(1.0472) q[7];

cx q[0], q[7];
rz(-0.2618) q[7];
cx q[0], q[7];

cx q[1], q[6];
rz(-0.3491) q[6];
cx q[1], q[6];

cx q[2], q[5];
rz(-0.6981) q[5];
cx q[2], q[5];

cx q[3], q[4];
rz(-0.5236) q[4];
cx q[3], q[4];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];