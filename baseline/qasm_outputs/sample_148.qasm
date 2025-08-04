OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// Entangling layer 1
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(1.0472) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(1.5708) q[4];
cx q[2], q[4];
cx q[3], q[2];
rz(0.5236) q[2];
cx q[3], q[2];

// Layer 2
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.5236) q[3];
rz(0.5236) q[4];

// Entangling layer 2
cx q[0], q[2];
rz(0.2618) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(1.0472) q[4];
cx q[2], q[4];
cx q[3], q[2];
rz(0.2618) q[2];
cx q[3], q[2];

// Layer 3
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rz(0.2618) q[0];
rz(0.2618) q[1];
rz(0.2618) q[2];
rz(0.2618) q[3];
rz(0.2618) q[4];

// Entangling layer 3
cx q[0], q[2];
rz(0.1309) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];
cx q[3], q[2];
rz(0.1309) q[2];
cx q[3], q[2];

// Layer 4
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rz(0.1309) q[0];
rz(0.1309) q[1];
rz(0.1309) q[2];
rz(0.1309) q[3];
rz(0.1309) q[4];

// Entangling layer 4
cx q[0], q[2];
rz(0.0654) q[2];
cx q[0], q[2];
cx q[1], q[2];
rz(0.2618) q[2];
cx q[1], q[2];
cx q[2], q[4];
rz(0.5236) q[4];
cx q[2], q[4];
cx q[3], q[2];
rz(0.0654) q[2];
cx q[3], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];