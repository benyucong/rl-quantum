OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First QAOA layer - Problem unitary
// Edge (0,1) weight 10
cx q[0], q[1];
rz(0.2) q[1];
cx q[0], q[1];

// Edge (0,7) weight 12
cx q[0], q[7];
rz(0.24) q[7];
cx q[0], q[7];

// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.2) q[3];
cx q[2], q[3];

// Edge (2,6) weight 13
cx q[2], q[6];
rz(0.26) q[6];
cx q[2], q[6];

// Edge (2,4) weight 13
cx q[2], q[4];
rz(0.26) q[4];
cx q[2], q[4];

// Edge (4,5) weight 1
cx q[4], q[5];
rz(0.02) q[5];
cx q[4], q[5];

// Edge (5,7) weight 17
cx q[5], q[7];
rz(0.34) q[7];
cx q[5], q[7];

// Edge (6,7) weight 7
cx q[6], q[7];
rz(0.14) q[7];
cx q[6], q[7];

// Edge (6,8) weight 19
cx q[6], q[8];
rz(0.38) q[8];
cx q[6], q[8];

// First QAOA layer - Mixer unitary
rx(1.4) q[0];
rx(1.4) q[1];
rx(1.4) q[2];
rx(1.4) q[3];
rx(1.4) q[4];
rx(1.4) q[5];
rx(1.4) q[6];
rx(1.4) q[7];
rx(1.4) q[8];

// Second QAOA layer - Problem unitary
// Edge (0,1) weight 10
cx q[0], q[1];
rz(0.2) q[1];
cx q[0], q[1];

// Edge (0,7) weight 12
cx q[0], q[7];
rz(0.24) q[7];
cx q[0], q[7];

// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.2) q[3];
cx q[2], q[3];

// Edge (2,6) weight 13
cx q[2], q[6];
rz(0.26) q[6];
cx q[2], q[6];

// Edge (2,4) weight 13
cx q[2], q[4];
rz(0.26) q[4];
cx q[2], q[4];

// Edge (4,5) weight 1
cx q[4], q[5];
rz(0.02) q[5];
cx q[4], q[5];

// Edge (5,7) weight 17
cx q[5], q[7];
rz(0.34) q[7];
cx q[5], q[7];

// Edge (6,7) weight 7
cx q[6], q[7];
rz(0.14) q[7];
cx q[6], q[7];

// Edge (6,8) weight 19
cx q[6], q[8];
rz(0.38) q[8];
cx q[6], q[8];

// Second QAOA layer - Mixer unitary
rx(1.4) q[0];
rx(1.4) q[1];
rx(1.4) q[2];
rx(1.4) q[3];
rx(1.4) q[4];
rx(1.4) q[5];
rx(1.4) q[6];
rx(1.4) q[7];
rx(1.4) q[8];

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