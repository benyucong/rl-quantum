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

// Edge (0,1) with weight 2
rz(0.3927) q[0];
rz(0.3927) q[1];
cx q[0], q[1];
rz(-0.7854) q[1];
cx q[0], q[1];

// Edge (0,3) with weight 12
rz(2.3562) q[0];
rz(2.3562) q[3];
cx q[0], q[3];
rz(-4.7124) q[3];
cx q[0], q[3];

// Edge (1,6) with weight 11
rz(2.1598) q[1];
rz(2.1598) q[6];
cx q[1], q[6];
rz(-4.3196) q[6];
cx q[1], q[6];

// Edge (1,4) with weight 13
rz(2.5525) q[1];
rz(2.5525) q[4];
cx q[1], q[4];
rz(-5.1051) q[4];
cx q[1], q[4];

// Edge (2,3) with weight 2
rz(0.3927) q[2];
rz(0.3927) q[3];
cx q[2], q[3];
rz(-0.7854) q[3];
cx q[2], q[3];

// Edge (2,7) with weight 16
rz(3.1416) q[2];
rz(3.1416) q[7];
cx q[2], q[7];
rz(-6.2832) q[7];
cx q[2], q[7];

// Edge (2,5) with weight 20
rz(3.9270) q[2];
rz(3.9270) q[5];
cx q[2], q[5];
rz(-7.8540) q[5];
cx q[2], q[5];

// Edge (4,5) with weight 1
rz(0.1963) q[4];
rz(0.1963) q[5];
cx q[4], q[5];
rz(-0.3927) q[5];
cx q[4], q[5];

// Edge (6,7) with weight 3
rz(0.5890) q[6];
rz(0.5890) q[7];
cx q[6], q[7];
rz(-1.1781) q[7];
cx q[6], q[7];

// Layer 2: Mixing and optimization
rz(1.0472) q[0];
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(1.0472) q[3];
rz(1.0472) q[4];
rz(1.0472) q[5];
rz(1.0472) q[6];
rz(1.0472) q[7];
rz(1.0472) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 3: Final optimization and measurement
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];