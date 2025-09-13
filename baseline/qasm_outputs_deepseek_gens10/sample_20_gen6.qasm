OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
// Layer 2 - Problem-specific phase operations
// Edge (0,7) weight=5
cx q[0], q[7];
rz(0.3927) q[7];
cx q[0], q[7];
// Edge (1,8) weight=2
cx q[1], q[8];
rz(0.1571) q[8];
cx q[1], q[8];
// Edge (2,9) weight=4
cx q[2], q[9];
rz(0.3142) q[9];
cx q[2], q[9];
// Edge (2,12) weight=11
cx q[2], q[12];
rz(0.8639) q[12];
cx q[2], q[12];
// Edge (3,10) weight=10
cx q[3], q[10];
rz(0.7854) q[10];
cx q[3], q[10];
// Edge (3,11) weight=20
cx q[3], q[11];
rz(1.5708) q[11];
cx q[3], q[11];
// Edge (4,11) weight=7
cx q[4], q[11];
rz(0.5498) q[11];
cx q[4], q[11];
// Edge (4,10) weight=17
cx q[4], q[10];
rz(1.3352) q[10];
cx q[4], q[10];
// Edge (5,12) weight=5
cx q[5], q[12];
rz(0.3927) q[12];
cx q[5], q[12];
// Edge (6,8) weight=14
cx q[6], q[8];
rz(1.0996) q[8];
cx q[6], q[8];
// Edge (6,9) weight=17
cx q[6], q[9];
rz(1.3352) q[9];
cx q[6], q[9];
// Layer 3 - Mixer layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
// Layer 4 - Final phase operations
// Edge (0,7) weight=5
cx q[0], q[7];
rz(0.3927) q[7];
cx q[0], q[7];
// Edge (1,8) weight=2
cx q[1], q[8];
rz(0.1571) q[8];
cx q[1], q[8];
// Edge (2,9) weight=4
cx q[2], q[9];
rz(0.3142) q[9];
cx q[2], q[9];
// Edge (2,12) weight=11
cx q[2], q[12];
rz(0.8639) q[12];
cx q[2], q[12];
// Edge (3,10) weight=10
cx q[3], q[10];
rz(0.7854) q[10];
cx q[3], q[10];
// Edge (3,11) weight=20
cx q[3], q[11];
rz(1.5708) q[11];
cx q[3], q[11];
// Edge (4,11) weight=7
cx q[4], q[11];
rz(0.5498) q[11];
cx q[4], q[11];
// Edge (4,10) weight=17
cx q[4], q[10];
rz(1.3352) q[10];
cx q[4], q[10];
// Edge (5,12) weight=5
cx q[5], q[12];
rz(0.3927) q[12];
cx q[5], q[12];
// Edge (6,8) weight=14
cx q[6], q[8];
rz(1.0996) q[8];
cx q[6], q[8];
// Edge (6,9) weight=17
cx q[6], q[9];
rz(1.3352) q[9];
cx q[6], q[9];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];
c[12] = measure q[12];