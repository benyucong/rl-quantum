OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge (0,1) with weight 4
rz(0.8) q[0];
rz(0.8) q[1];
// Edge (0,3) with weight 12
rz(2.4) q[0];
rz(2.4) q[3];
// Edge (0,2) with weight 14
rz(2.8) q[0];
rz(2.8) q[2];
// Edge (2,3) with weight 5
rz(1.0) q[2];
rz(1.0) q[3];
// Edge (3,6) with weight 16
rz(3.2) q[3];
rz(3.2) q[6];
// Edge (3,4) with weight 20
rz(4.0) q[3];
rz(4.0) q[4];
// Edge (4,5) with weight 6
rz(1.2) q[4];
rz(1.2) q[5];
// Edge (4,7) with weight 18
rz(3.6) q[4];
rz(3.6) q[7];
// Edge (6,7) with weight 9
rz(1.8) q[6];
rz(1.8) q[7];
// Layer 2: Mixing and optimization
rx(1.2) q[0];
rx(1.2) q[1];
rx(1.2) q[2];
rx(1.2) q[3];
rx(1.2) q[4];
rx(1.2) q[5];
rx(1.2) q[6];
rx(1.2) q[7];
rx(1.2) q[8];
// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];