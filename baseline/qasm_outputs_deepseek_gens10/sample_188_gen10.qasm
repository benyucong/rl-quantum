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
// Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.214) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.198) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.225) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.231) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.186) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.172) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.208) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.219) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.192) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.165) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.202) q[5];
cx q[4], q[5];
// Mixer layer 1
rx(0.785) q[0];
rx(0.785) q[1];
rx(0.785) q[2];
rx(0.785) q[3];
rx(0.785) q[4];
rx(0.785) q[5];
// Layer 2
// Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.428) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.396) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.450) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.462) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.372) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.344) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.416) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.438) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.384) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.330) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.404) q[5];
cx q[4], q[5];
// Mixer layer 2
rx(1.571) q[0];
rx(1.571) q[1];
rx(1.571) q[2];
rx(1.571) q[3];
rx(1.571) q[4];
rx(1.571) q[5];
// Layer 3
// Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.642) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.594) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.675) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.693) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.558) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.516) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.624) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.657) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.576) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.495) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.606) q[5];
cx q[4], q[5];
// Mixer layer 3
rx(2.356) q[0];
rx(2.356) q[1];
rx(2.356) q[2];
rx(2.356) q[3];
rx(2.356) q[4];
rx(2.356) q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];