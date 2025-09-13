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
rz(0.201) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.179) q[5];
cx q[4], q[5];
// Mixer layer 1
rx(0.423) q[0];
rx(0.415) q[1];
rx(0.431) q[2];
rx(0.409) q[3];
rx(0.397) q[4];
rx(0.437) q[5];
// Layer 2
// Edge (0,2)
cx q[0], q[2];
rz(0.208) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.194) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.219) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.202) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.188) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.213) q[5];
cx q[1], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.181) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.197) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.175) q[5];
cx q[4], q[5];
// Mixer layer 2
rx(0.417) q[0];
rx(0.411) q[1];
rx(0.425) q[2];
rx(0.403) q[3];
rx(0.391) q[4];
rx(0.429) q[5];
// Layer 3
// Edge (0,2)
cx q[0], q[2];
rz(0.211) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.196) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.222) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.204) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.190) q[3];
cx q[1], q[3];
// Edge (1,5)
cx q[1], q[5];
rz(0.216) q[5];
cx q[1], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.183) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.199) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.177) q[5];
cx q[4], q[5];
// Mixer layer 3
rx(0.420) q[0];
rx(0.413) q[1];
rx(0.428) q[2];
rx(0.406) q[3];
rx(0.394) q[4];
rx(0.433) q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];