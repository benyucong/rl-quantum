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
rz(0.7854) q[0];
rz(0.7854) q[2];
rz(0.7854) q[4];
rz(0.7854) q[5];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(1.1781) q[0];
rz(1.1781) q[4];
rz(1.1781) q[2];
rz(1.1781) q[3];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[5];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Final edge interactions
rz(0.5236) q[0];
rz(0.5236) q[5];
rz(0.5236) q[3];
rz(0.5236) q[4];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];