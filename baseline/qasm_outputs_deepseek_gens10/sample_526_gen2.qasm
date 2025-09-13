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
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.098) q[1];
cx q[0], q[1];

// Edge (0,5) weight 13
cx q[0], q[5];
rz(0.182) q[5];
cx q[0], q[5];

// Edge (0,4) weight 13
cx q[0], q[4];
rz(0.182) q[4];
cx q[0], q[4];

// Edge (1,2) weight 20
cx q[1], q[2];
rz(0.280) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14
cx q[1], q[5];
rz(0.196) q[5];
cx q[1], q[5];

// Edge (2,3) weight 1
cx q[2], q[3];
rz(0.014) q[3];
cx q[2], q[3];

// Edge (3,5) weight 17
cx q[3], q[5];
rz(0.238) q[5];
cx q[3], q[5];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.140) q[5];
cx q[4], q[5];

// Layer 1 - Mixer unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 2 - Problem unitary with optimal parameters
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.084) q[1];
cx q[0], q[1];

// Edge (0,5) weight 13
cx q[0], q[5];
rz(0.156) q[5];
cx q[0], q[5];

// Edge (0,4) weight 13
cx q[0], q[4];
rz(0.156) q[4];
cx q[0], q[4];

// Edge (1,2) weight 20
cx q[1], q[2];
rz(0.240) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14
cx q[1], q[5];
rz(0.168) q[5];
cx q[1], q[5];

// Edge (2,3) weight 1
cx q[2], q[3];
rz(0.012) q[3];
cx q[2], q[3];

// Edge (3,5) weight 17
cx q[3], q[5];
rz(0.204) q[5];
cx q[3], q[5];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.120) q[5];
cx q[4], q[5];

// Layer 2 - Mixer unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 3 - Problem unitary with optimal parameters
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.070) q[1];
cx q[0], q[1];

// Edge (0,5) weight 13
cx q[0], q[5];
rz(0.130) q[5];
cx q[0], q[5];

// Edge (0,4) weight 13
cx q[0], q[4];
rz(0.130) q[4];
cx q[0], q[4];

// Edge (1,2) weight 20
cx q[1], q[2];
rz(0.200) q[2];
cx q[1], q[2];

// Edge (1,5) weight 14
cx q[1], q[5];
rz(0.140) q[5];
cx q[1], q[5];

// Edge (2,3) weight 1
cx q[2], q[3];
rz(0.010) q[3];
cx q[2], q[3];

// Edge (3,5) weight 17
cx q[3], q[5];
rz(0.170) q[5];
cx q[3], q[5];

// Edge (4,5) weight 10
cx q[4], q[5];
rz(0.100) q[5];
cx q[4], q[5];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];