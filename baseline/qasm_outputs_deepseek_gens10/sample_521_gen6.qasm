OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Edge interactions
rz(0.7854) q[0];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[4];
rz(0.7854) q[2];
rz(0.7854) q[3];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Edge interactions
rz(1.1781) q[0];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[4];
rz(1.1781) q[2];
rz(1.1781) q[3];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Edge interactions
rz(0.3927) q[0];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[4];
rz(0.3927) q[2];
rz(0.3927) q[3];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Edge interactions
rz(1.9635) q[0];
rz(1.9635) q[3];
rz(1.9635) q[4];
rz(1.9635) q[1];
rz(1.9635) q[2];
rz(1.9635) q[4];
rz(1.9635) q[2];
rz(1.9635) q[3];
// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];