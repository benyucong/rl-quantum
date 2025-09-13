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
rz(0.314) q[0];
rz(0.628) q[1];
rz(0.942) q[2];
rz(1.256) q[3];
rz(1.570) q[4];
rz(1.884) q[5];
rz(2.198) q[6];
rz(2.512) q[7];

cx q[0], q[1];
rz(0.785) q[1];
cx q[0], q[1];

cx q[0], q[4];
rz(1.570) q[4];
cx q[0], q[4];

cx q[0], q[3];
rz(0.393) q[3];
cx q[0], q[3];

cx q[1], q[3];
rz(1.570) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.524) q[5];
cx q[1], q[5];

cx q[2], q[3];
rz(0.262) q[3];
cx q[2], q[3];

cx q[3], q[6];
rz(0.698) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.087) q[5];
cx q[4], q[5];

// Layer 2 - Mixer unitary
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
rx(0.785) q[6];
rx(0.785) q[7];

// Layer 3 - Problem unitary with optimal parameters
rz(0.471) q[0];
rz(0.942) q[1];
rz(1.413) q[2];
rz(1.884) q[3];
rz(2.355) q[4];
rz(2.826) q[5];
rz(3.297) q[6];
rz(3.768) q[7];

cx q[0], q[1];
rz(1.178) q[1];
cx q[0], q[1];

cx q[0], q[4];
rz(2.355) q[4];
cx q[0], q[4];

cx q[0], q[3];
rz(0.589) q[3];
cx q[0], q[3];

cx q[1], q[3];
rz(2.355) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.786) q[5];
cx q[1], q[5];

cx q[2], q[3];
rz(0.393) q[3];
cx q[2], q[3];

cx q[3], q[6];
rz(1.047) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.131) q[5];
cx q[4], q[5];

// Layer 4 - Final mixer and measurement preparation
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