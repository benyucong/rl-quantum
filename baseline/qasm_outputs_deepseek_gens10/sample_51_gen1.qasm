OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1: Initialization and first mixing
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
h q[11];
h q[12];
h q[13];

// First constraint layer - flow conservation
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// Capacity constraints for edges
cx q[0], q[7];
rz(0.5236) q[7];
cx q[0], q[7];
cx q[0], q[8];
rz(0.5236) q[8];
cx q[0], q[8];
cx q[0], q[9];
rz(1.0472) q[9];
cx q[0], q[9];
cx q[1], q[10];
rz(0.5236) q[10];
cx q[1], q[10];
cx q[2], q[11];
rz(0.5236) q[11];
cx q[2], q[11];
cx q[2], q[12];
rz(0.5236) q[12];
cx q[2], q[12];
cx q[4], q[13];
rz(0.5236) q[13];
cx q[4], q[13];

// Layer 2: Second mixing and constraint application
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
h q[11];
h q[12];
h q[13];

rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];

cx q[0], q[7];
rz(0.7854) q[7];
cx q[0], q[7];
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];
cx q[0], q[9];
rz(1.5708) q[9];
cx q[0], q[9];
cx q[1], q[10];
rz(0.7854) q[10];
cx q[1], q[10];
cx q[2], q[11];
rz(0.7854) q[11];
cx q[2], q[11];
cx q[2], q[12];
rz(0.7854) q[12];
cx q[2], q[12];
cx q[4], q[13];
rz(0.7854) q[13];
cx q[4], q[13];

// Layer 3: Final mixing and measurement preparation
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
h q[11];
h q[12];
h q[13];

rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];

cx q[0], q[7];
rz(1.0472) q[7];
cx q[0], q[7];
cx q[0], q[8];
rz(1.0472) q[8];
cx q[0], q[8];
cx q[0], q[9];
rz(2.0944) q[9];
cx q[0], q[9];
cx q[1], q[10];
rz(1.0472) q[10];
cx q[1], q[10];
cx q[2], q[11];
rz(1.0472) q[11];
cx q[2], q[11];
cx q[2], q[12];
rz(1.0472) q[12];
cx q[2], q[12];
cx q[4], q[13];
rz(1.0472) q[13];
cx q[4], q[13];

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
c[11] = measure q[11];
c[12] = measure q[12];
c[13] = measure q[13];