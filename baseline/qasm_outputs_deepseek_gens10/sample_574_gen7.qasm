OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
// Layer 1: Initial Hadamard and problem unitary
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Edge (0,2)
cx q[0], q[2];
rz(0.214) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.198) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.225) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.207) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.219) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.231) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.192) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.204) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.186) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.222) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.195) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.237) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.210) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.228) q[8];
cx q[7], q[8];
// Layer 1: Mixer unitary
h q[0];
rz(0.432) q[0];
h q[0];
h q[1];
rz(0.432) q[1];
h q[1];
h q[2];
rz(0.432) q[2];
h q[2];
h q[3];
rz(0.432) q[3];
h q[3];
h q[4];
rz(0.432) q[4];
h q[4];
h q[5];
rz(0.432) q[5];
h q[5];
h q[6];
rz(0.432) q[6];
h q[6];
h q[7];
rz(0.432) q[7];
h q[7];
h q[8];
rz(0.432) q[8];
h q[8];
// Layer 2: Problem unitary
// Edge (0,2)
cx q[0], q[2];
rz(0.321) q[2];
cx q[0], q[2];
// Edge (0,4)
cx q[0], q[4];
rz(0.297) q[4];
cx q[0], q[4];
// Edge (0,5)
cx q[0], q[5];
rz(0.338) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.311) q[2];
cx q[1], q[2];
// Edge (1,5)
cx q[1], q[5];
rz(0.329) q[5];
cx q[1], q[5];
// Edge (1,7)
cx q[1], q[7];
rz(0.347) q[7];
cx q[1], q[7];
// Edge (2,5)
cx q[2], q[5];
rz(0.288) q[5];
cx q[2], q[5];
// Edge (2,7)
cx q[2], q[7];
rz(0.306) q[7];
cx q[2], q[7];
// Edge (3,4)
cx q[3], q[4];
rz(0.279) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.333) q[6];
cx q[3], q[6];
// Edge (4,5)
cx q[4], q[5];
rz(0.293) q[5];
cx q[4], q[5];
// Edge (4,8)
cx q[4], q[8];
rz(0.356) q[8];
cx q[4], q[8];
// Edge (6,7)
cx q[6], q[7];
rz(0.315) q[7];
cx q[6], q[7];
// Edge (7,8)
cx q[7], q[8];
rz(0.342) q[8];
cx q[7], q[8];
// Layer 2: Mixer unitary
h q[0];
rz(0.648) q[0];
h q[0];
h q[1];
rz(0.648) q[1];
h q[1];
h q[2];
rz(0.648) q[2];
h q[2];
h q[3];
rz(0.648) q[3];
h q[3];
h q[4];
rz(0.648) q[4];
h q[4];
h q[5];
rz(0.648) q[5];
h q[5];
h q[6];
rz(0.648) q[6];
h q[6];
h q[7];
rz(0.648) q[7];
h q[7];
h q[8];
rz(0.648) q[8];
h q[8];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];