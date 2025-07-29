OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initialization and Hadamard gates
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

// Layer 2 - Problem Encoding with RZZ gates (edges)
rz(5.0) q[0];
rzz(5.0) q[0], q[7];
rz(2.0) q[1];
rzz(2.0) q[1], q[8];
rz(4.0) q[2];
rzz(4.0) q[2], q[9];
rz(11.0) q[2];
rzz(11.0) q[2], q[12];
rz(10.0) q[3];
rzz(10.0) q[3], q[10];
rz(20.0) q[3];
rzz(20.0) q[3], q[11];
rz(7.0) q[4];
rzz(7.0) q[4], q[11];
rz(17.0) q[4];
rzz(17.0) q[4], q[10];
rz(5.0) q[5];
rzz(5.0) q[5], q[12];
rz(14.0) q[6];
rzz(14.0) q[6], q[8];
rz(17.0) q[6];
rzz(17.0) q[6], q[9];

// Layer 3 - Mixing with RX gates
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];
rx(1.5708) q[9];
rx(1.5708) q[10];
rx(1.5708) q[11];
rx(1.5708) q[12];

// Layer 4 - Final Hadamard and Measurement
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