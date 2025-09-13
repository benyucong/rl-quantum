OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
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
// Problem-specific phase operations
// Edge (0,4) weight=3
cx q[0], q[4];
rz(0.4712) q[4];
cx q[0], q[4];
// Edge (0,7) weight=12
cx q[0], q[7];
rz(1.8850) q[7];
cx q[0], q[7];
// Edge (0,5) weight=12
cx q[0], q[5];
rz(1.8850) q[5];
cx q[0], q[5];
// Edge (1,5) weight=6
cx q[1], q[5];
rz(0.9425) q[5];
cx q[1], q[5];
// Edge (1,6) weight=11
cx q[1], q[6];
rz(1.7279) q[6];
cx q[1], q[6];
// Edge (1,10) - not in 9 qubit system
// Edge (2,6) weight=7
cx q[2], q[6];
rz(1.0996) q[6];
cx q[2], q[6];
// Edge (3,7) weight=8
cx q[3], q[7];
rz(1.2566) q[7];
cx q[3], q[7];
// Edge (3,9) - not in 9 qubit system
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Problem-specific phase operations
// Edge (0,4) weight=3
cx q[0], q[4];
rz(0.4712) q[4];
cx q[0], q[4];
// Edge (0,7) weight=12
cx q[0], q[7];
rz(1.8850) q[7];
cx q[0], q[7];
// Edge (0,5) weight=12
cx q[0], q[5];
rz(1.8850) q[5];
cx q[0], q[5];
// Edge (1,5) weight=6
cx q[1], q[5];
rz(0.9425) q[5];
cx q[1], q[5];
// Edge (1,6) weight=11
cx q[1], q[6];
rz(1.7279) q[6];
cx q[1], q[6];
// Edge (2,6) weight=7
cx q[2], q[6];
rz(1.0996) q[6];
cx q[2], q[6];
// Edge (3,7) weight=8
cx q[3], q[7];
rz(1.2566) q[7];
cx q[3], q[7];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
// Problem-specific phase operations
// Edge (0,4) weight=3
cx q[0], q[4];
rz(0.4712) q[4];
cx q[0], q[4];
// Edge (0,7) weight=12
cx q[0], q[7];
rz(1.8850) q[7];
cx q[0], q[7];
// Edge (0,5) weight=12
cx q[0], q[5];
rz(1.8850) q[5];
cx q[0], q[5];
// Edge (1,5) weight=6
cx q[1], q[5];
rz(0.9425) q[5];
cx q[1], q[5];
// Edge (1,6) weight=11
cx q[1], q[6];
rz(1.7279) q[6];
cx q[1], q[6];
// Edge (2,6) weight=7
cx q[2], q[6];
rz(1.0996) q[6];
cx q[2], q[6];
// Edge (3,7) weight=8
cx q[3], q[7];
rz(1.2566) q[7];
cx q[3], q[7];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];