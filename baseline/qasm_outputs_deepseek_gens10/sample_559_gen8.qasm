OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge (0,1)
cx q[0], q[1];
rz(0.214) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.198) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.225) q[4];
cx q[0], q[4];
// Edge (1,3)
cx q[1], q[3];
rz(0.186) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.207) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.192) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.219) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.231) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.204) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.195) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.211) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.223) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.217) q[6];
cx q[5], q[6];
// Mixer layer
rx(1.428) q[0];
rx(1.412) q[1];
rx(1.396) q[2];
rx(1.405) q[3];
rx(1.431) q[4];
rx(1.423) q[5];
rx(1.439) q[6];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];