OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
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
// Layer 1 - Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
rz(0.7854) q[9];
rz(0.7854) q[10];
// Layer 1 - Problem terms
// Edge (0,7) weight=8
cx q[0], q[7];
rz(0.6283) q[7];
cx q[0], q[7];
// Edge (0,8) weight=14
cx q[0], q[8];
rz(1.0996) q[8];
cx q[0], q[8];
// Edge (1,8) weight=8
cx q[1], q[8];
rz(0.6283) q[8];
cx q[1], q[8];
// Edge (2,9) weight=3
cx q[2], q[9];
rz(0.2356) q[9];
cx q[2], q[9];
// Edge (2,7) weight=20
cx q[2], q[7];
rz(1.5708) q[7];
cx q[2], q[7];
// Edge (2,8) weight=12
cx q[2], q[8];
rz(0.9425) q[8];
cx q[2], q[8];
// Edge (3,10) weight=2
cx q[3], q[10];
rz(0.1571) q[10];
cx q[3], q[10];
// Edge (4,11) weight=4
cx q[4], q[11];
rz(0.3142) q[11];
cx q[4], q[11];
// Edge (4,7) weight=11
cx q[4], q[7];
rz(0.8639) q[7];
cx q[4], q[7];
// Edge (5,12) weight=9
cx q[5], q[12];
rz(0.7069) q[12];
cx q[5], q[12];
// Edge (5,11) weight=12
cx q[5], q[11];
rz(0.9425) q[11];
cx q[5], q[11];
// Layer 2 - Mixer terms
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(1.1781) q[7];
rz(1.1781) q[8];
rz(1.1781) q[9];
rz(1.1781) q[10];
// Layer 2 - Problem terms
// Edge (0,7) weight=8
cx q[0], q[7];
rz(0.9425) q[7];
cx q[0], q[7];
// Edge (0,8) weight=14
cx q[0], q[8];
rz(1.6494) q[8];
cx q[0], q[8];
// Edge (1,8) weight=8
cx q[1], q[8];
rz(0.9425) q[8];
cx q[1], q[8];
// Edge (2,9) weight=3
cx q[2], q[9];
rz(0.3534) q[9];
cx q[2], q[9];
// Edge (2,7) weight=20
cx q[2], q[7];
rz(2.3562) q[7];
cx q[2], q[7];
// Edge (2,8) weight=12
cx q[2], q[8];
rz(1.4137) q[8];
cx q[2], q[8];
// Edge (3,10) weight=2
cx q[3], q[10];
rz(0.2356) q[10];
cx q[3], q[10];
// Edge (4,11) weight=4
cx q[4], q[11];
rz(0.4712) q[11];
cx q[4], q[11];
// Edge (4,7) weight=11
cx q[4], q[7];
rz(1.2958) q[7];
cx q[4], q[7];
// Edge (5,12) weight=9
cx q[5], q[12];
rz(1.0603) q[12];
cx q[5], q[12];
// Edge (5,11) weight=12
cx q[5], q[11];
rz(1.4137) q[11];
cx q[5], q[11];
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