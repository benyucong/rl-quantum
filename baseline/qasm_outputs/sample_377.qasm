OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.159) q[2];
rz(0.265) q[3];
rz(0.358) q[4];
rz(0.423) q[5];
rz(0.191) q[6];

// Edge interactions
cx q[0], q[1];
rz(-0.142) q[1];
cx q[0], q[1];
cx q[0], q[3];
rz(-0.118) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(-0.231) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.187) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-0.209) q[6];
cx q[0], q[6];
cx q[1], q[2];
rz(-0.165) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(-0.123) q[5];
cx q[1], q[5];
cx q[3], q[4];
rz(-0.156) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(-0.134) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-0.178) q[5];
cx q[4], q[5];
cx q[5], q[6];
rz(-0.221) q[6];
cx q[5], q[6];

// Layer 2
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
rx(1.571) q[6];
rz(0.412) q[0];
rz(0.387) q[1];
rz(0.298) q[2];
rz(0.351) q[3];
rz(0.476) q[4];
rz(0.529) q[5];
rz(0.324) q[6];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rz(0.628) q[0];
rz(0.542) q[1];
rz(0.318) q[2];
rz(0.530) q[3];
rz(0.716) q[4];
rz(0.846) q[5];
rz(0.382) q[6];

// Layer 4
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
rx(1.571) q[6];
rz(0.824) q[0];
rz(0.774) q[1];
rz(0.596) q[2];
rz(0.702) q[3];
rz(0.952) q[4];
rz(1.058) q[5];
rz(0.648) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];