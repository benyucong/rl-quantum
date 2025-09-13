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

// Layer 1: Edge interactions with optimal parameters
rz(0.314) q[0];
rz(0.314) q[1];
cx q[0], q[1];
rz(-0.628) q[1];
cx q[0], q[1];

rz(1.571) q[0];
rz(1.571) q[3];
cx q[0], q[3];
rz(-3.142) q[3];
cx q[0], q[3];

rz(1.571) q[0];
rz(1.571) q[5];
cx q[0], q[5];
rz(-3.142) q[5];
cx q[0], q[5];

rz(0.785) q[1];
rz(0.785) q[5];
cx q[1], q[5];
rz(-1.571) q[5];
cx q[1], q[5];

rz(0.393) q[2];
rz(0.393) q[3];
cx q[2], q[3];
rz(-0.785) q[3];
cx q[2], q[3];

rz(1.963) q[3];
rz(1.963) q[4];
cx q[3], q[4];
rz(-3.927) q[4];
cx q[3], q[4];

rz(2.356) q[3];
rz(2.356) q[6];
cx q[3], q[6];
rz(-4.712) q[6];
cx q[3], q[6];

rz(1.571) q[4];
rz(1.571) q[5];
cx q[4], q[5];
rz(-3.142) q[5];
cx q[4], q[5];

// Layer 2: Mixing layer
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];

// Layer 3: Edge interactions with optimal parameters
rz(0.471) q[0];
rz(0.471) q[1];
cx q[0], q[1];
rz(-0.942) q[1];
cx q[0], q[1];

rz(2.356) q[0];
rz(2.356) q[3];
cx q[0], q[3];
rz(-4.712) q[3];
cx q[0], q[3];

rz(2.356) q[0];
rz(2.356) q[5];
cx q[0], q[5];
rz(-4.712) q[5];
cx q[0], q[5];

rz(1.178) q[1];
rz(1.178) q[5];
cx q[1], q[5];
rz(-2.356) q[5];
cx q[1], q[5];

rz(0.589) q[2];
rz(0.589) q[3];
cx q[2], q[3];
rz(-1.178) q[3];
cx q[2], q[3];

rz(2.945) q[3];
rz(2.945) q[4];
cx q[3], q[4];
rz(-5.89) q[4];
cx q[3], q[4];

rz(3.534) q[3];
rz(3.534) q[6];
cx q[3], q[6];
rz(-7.068) q[6];
cx q[3], q[6];

rz(2.356) q[4];
rz(2.356) q[5];
cx q[4], q[5];
rz(-4.712) q[5];
cx q[4], q[5];

// Layer 4: Final mixing and measurement preparation
rx(1.178) q[0];
rx(1.178) q[1];
rx(1.178) q[2];
rx(1.178) q[3];
rx(1.178) q[4];
rx(1.178) q[5];
rx(1.178) q[6];
rx(1.178) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];