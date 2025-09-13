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

// Edge 0-1 (weight 2)
rz(0.314) q[0];
rz(0.314) q[1];
cx q[0], q[1];
rz(-0.628) q[1];
cx q[0], q[1];

// Edge 0-3 (weight 12)
rz(1.884) q[0];
rz(1.884) q[3];
cx q[0], q[3];
rz(-3.768) q[3];
cx q[0], q[3];

// Edge 1-6 (weight 11)
rz(1.727) q[1];
rz(1.727) q[6];
cx q[1], q[6];
rz(-3.454) q[6];
cx q[1], q[6];

// Edge 1-4 (weight 13)
rz(2.042) q[1];
rz(2.042) q[4];
cx q[1], q[4];
rz(-4.084) q[4];
cx q[1], q[4];

// Edge 2-3 (weight 2)
rz(0.314) q[2];
rz(0.314) q[3];
cx q[2], q[3];
rz(-0.628) q[3];
cx q[2], q[3];

// Edge 2-7 (weight 16)
rz(2.513) q[2];
rz(2.513) q[7];
cx q[2], q[7];
rz(-5.026) q[7];
cx q[2], q[7];

// Edge 2-5 (weight 20)
rz(3.142) q[2];
rz(3.142) q[5];
cx q[2], q[5];
rz(-6.284) q[5];
cx q[2], q[5];

// Edge 4-5 (weight 1)
rz(0.157) q[4];
rz(0.157) q[5];
cx q[4], q[5];
rz(-0.314) q[5];
cx q[4], q[5];

// Edge 6-7 (weight 3)
rz(0.471) q[6];
rz(0.471) q[7];
cx q[6], q[7];
rz(-0.942) q[7];
cx q[6], q[7];

// Layer 2: Mixing and optimization
rx(1.047) q[0];
rx(1.047) q[1];
rx(1.047) q[2];
rx(1.047) q[3];
rx(1.047) q[4];
rx(1.047) q[5];
rx(1.047) q[6];
rx(1.047) q[7];

// Layer 3: Final optimization and measurement
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.785) q[3];
rz(0.785) q[4];
rz(0.785) q[5];
rz(0.785) q[6];
rz(0.785) q[7];
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
c[8] = measure q[8];