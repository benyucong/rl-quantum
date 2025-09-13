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
rz(0.165) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.152) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.192) q[5];
cx q[4], q[5];
// Layer 2
h q[0];
rz(0.428) q[0];
h q[0];
h q[1];
rz(0.428) q[1];
h q[1];
h q[2];
rz(0.428) q[2];
h q[2];
h q[3];
rz(0.428) q[3];
h q[3];
h q[4];
rz(0.428) q[4];
h q[4];
h q[5];
rz(0.428) q[5];
h q[5];
// Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.201) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.185) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.212) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.218) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.173) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.159) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.195) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.206) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.152) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.139) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.179) q[5];
cx q[4], q[5];
// Layer 3
h q[0];
rz(0.642) q[0];
h q[0];
h q[1];
rz(0.642) q[1];
h q[1];
h q[2];
rz(0.642) q[2];
h q[2];
h q[3];
rz(0.642) q[3];
h q[3];
h q[4];
rz(0.642) q[4];
h q[4];
h q[5];
rz(0.642) q[5];
h q[5];
// Edge interactions
// Edge (0,1)
cx q[0], q[1];
rz(0.188) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.172) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.199) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.205) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.160) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.146) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.182) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.193) q[5];
cx q[1], q[5];
// Edge (2,5)
cx q[2], q[5];
rz(0.139) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.126) q[4];
cx q[3], q[4];
// Edge (4,5)
cx q[4], q[5];
rz(0.166) q[5];
cx q[4], q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];