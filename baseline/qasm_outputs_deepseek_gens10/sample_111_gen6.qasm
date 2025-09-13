OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
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
h q[10];

// Edge interactions - Layer 1
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.5236) q[3];
rz(0.5236) q[5];
rz(0.5236) q[8];
rz(0.5236) q[10];
rz(0.3491) q[4];
rz(0.3491) q[6];
rz(0.3491) q[7];
rz(0.3491) q[9];

// Layer 2
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
h q[10];

// Edge interactions - Layer 2
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(0.6981) q[3];
rz(0.6981) q[5];
rz(0.6981) q[8];
rz(0.6981) q[10];
rz(0.5236) q[4];
rz(0.5236) q[6];
rz(0.5236) q[7];
rz(0.5236) q[9];

// Layer 3
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
h q[10];

// Edge interactions - Layer 3
rz(1.3089) q[0];
rz(1.3089) q[1];
rz(1.3089) q[2];
rz(0.8727) q[3];
rz(0.8727) q[5];
rz(0.8727) q[8];
rz(0.8727) q[10];
rz(0.6981) q[4];
rz(0.6981) q[6];
rz(0.6981) q[7];
rz(0.6981) q[9];

// Layer 4
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
h q[10];

// Final edge interactions
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.0472) q[3];
rz(1.0472) q[5];
rz(1.0472) q[8];
rz(1.0472) q[10];
rz(0.8727) q[4];
rz(0.8727) q[6];
rz(0.8727) q[7];
rz(0.8727) q[9];

// Measurement
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
c[10] = measure q[10];