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

// Layer 1 - Edge interactions
rz(0.7854) q[0];  // Edge (0,1) weight 4
rz(0.7854) q[1];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];

rz(0.3927) q[0];  // Edge (0,4) weight 20
rz(0.3927) q[4];
cx q[0], q[4];
rz(-0.3927) q[4];
cx q[0], q[4];

rz(0.5236) q[0];  // Edge (0,3) weight 11
rz(0.5236) q[3];
cx q[0], q[3];
rz(-0.5236) q[3];
cx q[0], q[3];

rz(0.3927) q[1];  // Edge (1,3) weight 20
rz(0.3927) q[3];
cx q[1], q[3];
rz(-0.3927) q[3];
cx q[1], q[3];

rz(0.4363) q[1];  // Edge (1,5) weight 17
rz(0.4363) q[5];
cx q[1], q[5];
rz(-0.4363) q[5];
cx q[1], q[5];

rz(0.6283) q[2];  // Edge (2,3) weight 9
rz(0.6283) q[3];
cx q[2], q[3];
rz(-0.6283) q[3];
cx q[2], q[3];

rz(0.4189) q[3];  // Edge (3,6) weight 16
rz(0.4189) q[6];
cx q[3], q[6];
rz(-0.4189) q[6];
cx q[3], q[6];

rz(1.5708) q[4];  // Edge (4,5) weight 2
rz(1.5708) q[5];
cx q[4], q[5];
rz(-1.5708) q[5];
cx q[4], q[5];

// Layer 2 - Mixing
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Layer 3 - Edge interactions (repeated with optimized parameters)
rz(0.6981) q[0];
rz(0.6981) q[1];
cx q[0], q[1];
rz(-0.6981) q[1];
cx q[0], q[1];

rz(0.3491) q[0];
rz(0.3491) q[4];
cx q[0], q[4];
rz(-0.3491) q[4];
cx q[0], q[4];

rz(0.4654) q[0];
rz(0.4654) q[3];
cx q[0], q[3];
rz(-0.4654) q[3];
cx q[0], q[3];

rz(0.3491) q[1];
rz(0.3491) q[3];
cx q[1], q[3];
rz(-0.3491) q[3];
cx q[1], q[3];

rz(0.3881) q[1];
rz(0.3881) q[5];
cx q[1], q[5];
rz(-0.3881) q[5];
cx q[1], q[5];

rz(0.5585) q[2];
rz(0.5585) q[3];
cx q[2], q[3];
rz(-0.5585) q[3];
cx q[2], q[3];

rz(0.3724) q[3];
rz(0.3724) q[6];
cx q[3], q[6];
rz(-0.3724) q[6];
cx q[3], q[6];

rz(1.3963) q[4];
rz(1.3963) q[5];
cx q[4], q[5];
rz(-1.3963) q[5];
cx q[4], q[5];

// Layer 4 - Final mixing and measurement
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];