OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Problem unitary with optimal parameters
// Edge (0,1) weight 1
cx q[0], q[1];
rz(0.1963) q[1];
cx q[0], q[1];

// Edge (0,2) weight 11
cx q[0], q[2];
rz(2.1598) q[2];
cx q[0], q[2];

// Edge (1,5) weight 19
cx q[1], q[5];
rz(3.7325) q[5];
cx q[1], q[5];

// Edge (1,4) weight 12
cx q[1], q[4];
rz(2.3562) q[4];
cx q[1], q[4];

// Edge (2,3) weight 5
cx q[2], q[3];
rz(0.9817) q[3];
cx q[2], q[3];

// Edge (3,4) weight 17
cx q[3], q[4];
rz(3.3384) q[4];
cx q[3], q[4];

// Edge (4,5) weight 2
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];

// Edge (4,6) weight 19
cx q[4], q[6];
rz(3.7325) q[6];
cx q[4], q[6];

// Mixer unitary layer 1
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Layer 2 - Problem unitary with optimal parameters
// Edge (0,1) weight 1
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,2) weight 11
cx q[0], q[2];
rz(4.3197) q[2];
cx q[0], q[2];

// Edge (1,5) weight 19
cx q[1], q[5];
rz(7.4650) q[5];
cx q[1], q[5];

// Edge (1,4) weight 12
cx q[1], q[4];
rz(4.7124) q[4];
cx q[1], q[4];

// Edge (2,3) weight 5
cx q[2], q[3];
rz(1.9635) q[3];
cx q[2], q[3];

// Edge (3,4) weight 17
cx q[3], q[4];
rz(6.6769) q[4];
cx q[3], q[4];

// Edge (4,5) weight 2
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge (4,6) weight 19
cx q[4], q[6];
rz(7.4650) q[6];
cx q[4], q[6];

// Mixer unitary layer 2
rx(2.0944) q[0];
rx(2.0944) q[1];
rx(2.0944) q[2];
rx(2.0944) q[3];
rx(2.0944) q[4];
rx(2.0944) q[5];
rx(2.0944) q[6];
rx(2.0944) q[7];

// Layer 3 - Problem unitary with optimal parameters
// Edge (0,1) weight 1
cx q[0], q[1];
rz(0.5890) q[1];
cx q[0], q[1];

// Edge (0,2) weight 11
cx q[0], q[2];
rz(6.4795) q[2];
cx q[0], q[2];

// Edge (1,5) weight 19
cx q[1], q[5];
rz(11.1975) q[5];
cx q[1], q[5];

// Edge (1,4) weight 12
cx q[1], q[4];
rz(7.0686) q[4];
cx q[1], q[4];

// Edge (2,3) weight 5
cx q[2], q[3];
rz(2.9452) q[3];
cx q[2], q[3];

// Edge (3,4) weight 17
cx q[3], q[4];
rz(10.0153) q[4];
cx q[3], q[4];

// Edge (4,5) weight 2
cx q[4], q[5];
rz(1.1781) q[5];
cx q[4], q[5];

// Edge (4,6) weight 19
cx q[4], q[6];
rz(11.1975) q[6];
cx q[4], q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];