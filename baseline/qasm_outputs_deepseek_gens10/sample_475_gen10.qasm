OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
// Layer 1: Initialization and mixing
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
// Layer 1: Problem-specific phase separation
// Edge (0,7) weight=9
rz(0.1414) q[0];
rz(0.1414) q[7];
// Edge (0,10) weight=20
rz(0.3142) q[0];
rz(0.3142) q[10];
// Edge (1,8) weight=8
rz(0.1257) q[1];
rz(0.1257) q[8];
// Edge (2,9) weight=9
rz(0.1414) q[2];
rz(0.1414) q[9];
// Edge (2,12) weight=11
rz(0.1728) q[2];
rz(0.1728) q[12];
// Edge (3,10) weight=1
rz(0.0157) q[3];
rz(0.0157) q[10];
// Edge (3,9) weight=18
rz(0.2827) q[3];
rz(0.2827) q[9];
// Edge (3,12) weight=17
rz(0.2670) q[3];
rz(0.2670) q[12];
// Edge (4,11) weight=2
rz(0.0314) q[4];
rz(0.0314) q[11];
// Edge (5,12) weight=8
rz(0.1257) q[5];
rz(0.1257) q[12];
// Edge (6,7) weight=18
rz(0.2827) q[6];
rz(0.2827) q[7];
// Layer 2: Mixing
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
// Layer 2: Problem-specific phase separation
// Edge (0,7) weight=9
rz(0.1414) q[0];
rz(0.1414) q[7];
// Edge (0,10) weight=20
rz(0.3142) q[0];
rz(0.3142) q[10];
// Edge (1,8) weight=8
rz(0.1257) q[1];
rz(0.1257) q[8];
// Edge (2,9) weight=9
rz(0.1414) q[2];
rz(0.1414) q[9];
// Edge (2,12) weight=11
rz(0.1728) q[2];
rz(0.1728) q[12];
// Edge (3,10) weight=1
rz(0.0157) q[3];
rz(0.0157) q[10];
// Edge (3,9) weight=18
rz(0.2827) q[3];
rz(0.2827) q[9];
// Edge (3,12) weight=17
rz(0.2670) q[3];
rz(0.2670) q[12];
// Edge (4,11) weight=2
rz(0.0314) q[4];
rz(0.0314) q[11];
// Edge (5,12) weight=8
rz(0.1257) q[5];
rz(0.1257) q[12];
// Edge (6,7) weight=18
rz(0.2827) q[6];
rz(0.2827) q[7];
// Final measurement
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