OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.7854) q[0];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.3927) q[1];
rz(0.3927) q[2];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.6283) q[0];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(0.6283) q[5];
rz(0.6283) q[6];
rz(0.3142) q[1];
rz(0.3142) q[2];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.4712) q[0];
rz(0.4712) q[3];
rz(0.4712) q[4];
rz(0.4712) q[5];
rz(0.4712) q[6];
rz(0.2356) q[1];
rz(0.2356) q[2];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Final edge interactions
rz(0.3142) q[0];
rz(0.3142) q[3];
rz(0.3142) q[4];
rz(0.3142) q[5];
rz(0.3142) q[6];
rz(0.1571) q[1];
rz(0.1571) q[2];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];