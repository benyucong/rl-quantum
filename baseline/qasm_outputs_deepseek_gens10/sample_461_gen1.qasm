OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1 - Mixer and Cost Hamiltonians
// Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

// Cost terms for edges
// Edge (0,3)
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Edge (0,8)
cx q[0], q[8];
rz(0.5236) q[8];
cx q[0], q[8];

// Edge (1,3)
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.5236) q[6];
cx q[1], q[6];

// Edge (2,5)
cx q[2], q[5];
rz(0.6981) q[5];
cx q[2], q[5];

// Edge (3,1)
cx q[3], q[1];
rz(0.1745) q[1];
cx q[3], q[1];

// Edge (3,5)
cx q[3], q[5];
rz(0.5236) q[5];
cx q[3], q[5];

// Edge (6,4)
cx q[6], q[4];
rz(0.1745) q[4];
cx q[6], q[4];

// Edge (7,1)
cx q[7], q[1];
rz(0.6981) q[1];
cx q[7], q[1];

// Edge (7,5)
cx q[7], q[5];
rz(0.5236) q[5];
cx q[7], q[5];

// Layer 2 - Mixer and Cost Hamiltonians
// Mixer terms
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(0.7854) q[2];
rz(1.1781) q[3];
rz(0.7854) q[4];
rz(1.9635) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

// Cost terms for edges
// Edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Edge (0,8)
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];

// Edge (1,3)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Edge (2,5)
cx q[2], q[5];
rz(1.0472) q[5];
cx q[2], q[5];

// Edge (3,1)
cx q[3], q[1];
rz(0.2618) q[1];
cx q[3], q[1];

// Edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Edge (6,4)
cx q[6], q[4];
rz(0.2618) q[4];
cx q[6], q[4];

// Edge (7,1)
cx q[7], q[1];
rz(1.0472) q[1];
cx q[7], q[1];

// Edge (7,5)
cx q[7], q[5];
rz(0.7854) q[5];
cx q[7], q[5];

// Layer 3 - Mixer and Cost Hamiltonians
// Mixer terms
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.1781) q[2];
rz(1.5708) q[3];
rz(1.0472) q[4];
rz(2.3562) q[5];
rz(1.0472) q[6];
rz(1.1781) q[7];
rz(1.3090) q[8];

// Cost terms for edges
// Edge (0,3)
cx q[0], q[3];
rz(1.0472) q[3];
cx q[0], q[3];

// Edge (0,8)
cx q[0], q[8];
rz(1.0472) q[8];
cx q[0], q[8];

// Edge (1,3)
cx q[1], q[3];
rz(1.0472) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(1.0472) q[6];
cx q[1], q[6];

// Edge (2,5)
cx q[2], q[5];
rz(1.3963) q[5];
cx q[2], q[5];

// Edge (3,1)
cx q[3], q[1];
rz(0.3491) q[1];
cx q[3], q[1];

// Edge (3,5)
cx q[3], q[5];
rz(1.0472) q[5];
cx q[3], q[5];

// Edge (6,4)
cx q[6], q[4];
rz(0.3491) q[4];
cx q[6], q[4];

// Edge (7,1)
cx q[7], q[1];
rz(1.3963) q[1];
cx q[7], q[1];

// Edge (7,5)
cx q[7], q[5];
rz(1.0472) q[5];
cx q[7], q[5];

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