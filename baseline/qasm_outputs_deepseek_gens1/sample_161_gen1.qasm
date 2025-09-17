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
rz(0.314) q[0];
rz(0.271) q[2];
rz(0.289) q[3];
rz(0.302) q[4];
rz(0.295) q[5];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.327) q[0];
rz(0.283) q[2];
rz(0.301) q[3];
rz(0.315) q[4];
rz(0.308) q[5];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.341) q[0];
rz(0.296) q[2];
rz(0.314) q[3];
rz(0.329) q[4];
rz(0.321) q[5];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.356) q[0];
rz(0.309) q[2];
rz(0.328) q[3];
rz(0.343) q[4];
rz(0.335) q[5];
// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];