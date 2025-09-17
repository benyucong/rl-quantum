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

// Edge (0,1) with weight 4
cx q[0], q[7];
rz(0.8) q[7];
cx q[0], q[7];
cx q[1], q[7];
rz(0.8) q[7];
cx q[1], q[7];

// Edge (1,2) with weight 11
cx q[1], q[7];
rz(2.2) q[7];
cx q[1], q[7];
cx q[2], q[7];
rz(2.2) q[7];
cx q[2], q[7];

// Edge (1,3) with weight 20
cx q[1], q[7];
rz(4.0) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(4.0) q[7];
cx q[3], q[7];

// Edge (1,5) with weight 17
cx q[1], q[7];
rz(3.4) q[7];
cx q[1], q[7];
cx q[5], q[7];
rz(3.4) q[7];
cx q[5], q[7];

// Edge (2,3) with weight 3
cx q[2], q[7];
rz(0.6) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.6) q[7];
cx q[3], q[7];

// Edge (2,5) with weight 18
cx q[2], q[7];
rz(3.6) q[7];
cx q[2], q[7];
cx q[5], q[7];
rz(3.6) q[7];
cx q[5], q[7];

// Edge (4,5) with weight 10
cx q[4], q[7];
rz(2.0) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(2.0) q[7];
cx q[5], q[7];

// Edge (4,6) with weight 14
cx q[4], q[7];
rz(2.8) q[7];
cx q[4], q[7];
cx q[6], q[7];
rz(2.8) q[7];
cx q[6], q[7];

// Layer 2: Mixing and optimization
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];
rz(0.5) q[5];
rz(0.5) q[6];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];