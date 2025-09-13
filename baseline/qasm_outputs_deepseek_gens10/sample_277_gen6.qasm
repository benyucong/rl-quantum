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

// Layer 1 - Problem-specific entangling
rz(0.314) q[0];
rz(0.942) q[1];
rz(1.571) q[2];
rz(2.199) q[3];
rz(2.827) q[4];
rz(3.456) q[5];
rz(4.084) q[6];
rz(4.712) q[7];

cx q[0], q[1];
rz(-0.785) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(-2.356) q[2];
cx q[0], q[2];

cx q[1], q[5];
rz(-2.827) q[5];
cx q[1], q[5];

cx q[1], q[4];
rz(-1.885) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(-0.628) q[3];
cx q[2], q[3];

cx q[3], q[4];
rz(-2.513) q[4];
cx q[3], q[4];

cx q[4], q[5];
rz(-0.251) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(-2.827) q[6];
cx q[4], q[6];

// Layer 2 - Mixing
rx(1.047) q[0];
rx(1.309) q[1];
rx(0.785) q[2];
rx(1.571) q[3];
rx(0.524) q[4];
rx(1.047) q[5];
rx(0.262) q[6];
rx(2.094) q[7];

// Layer 3 - Final optimization
rz(0.157) q[0];
rz(0.471) q[1];
rz(0.785) q[2];
rz(1.100) q[3];
rz(1.414) q[4];
rz(1.728) q[5];
rz(2.042) q[6];
rz(2.356) q[7];

cx q[0], q[1];
rz(-0.393) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(-1.178) q[2];
cx q[0], q[2];

cx q[1], q[5];
rz(-1.414) q[5];
cx q[1], q[5];

cx q[1], q[4];
rz(-0.943) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(-0.314) q[3];
cx q[2], q[3];

cx q[3], q[4];
rz(-1.257) q[4];
cx q[3], q[4];

cx q[4], q[5];
rz(-0.126) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(-1.414) q[6];
cx q[4], q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];