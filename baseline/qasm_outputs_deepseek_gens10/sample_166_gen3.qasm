OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge (0,2)
cx q[0], q[2];
rz(0.214) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.198) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.225) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.206) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.192) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.218) q[5];
cx q[1], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.185) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.202) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.179) q[5];
cx q[4], q[5];
// Mixer layer 1
rx(0.423) q[0];
rx(0.415) q[1];
rx(0.431) q[2];
rx(0.408) q[3];
rx(0.397) q[4];
rx(0.436) q[5];
// Layer 2
// Edge (0,2)
cx q[0], q[2];
rz(0.198) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.183) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.208) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.191) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.178) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.202) q[5];
cx q[1], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.171) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.187) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.166) q[5];
cx q[4], q[5];
// Mixer layer 2
rx(0.391) q[0];
rx(0.384) q[1];
rx(0.398) q[2];
rx(0.378) q[3];
rx(0.368) q[4];
rx(0.403) q[5];
// Layer 3
// Edge (0,2)
cx q[0], q[2];
rz(0.183) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.169) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.192) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.177) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.165) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.187) q[5];
cx q[1], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.158) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.173) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.154) q[5];
cx q[4], q[5];
// Mixer layer 3
rx(0.362) q[0];
rx(0.355) q[1];
rx(0.368) q[2];
rx(0.350) q[3];
rx(0.341) q[4];
rx(0.373) q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];