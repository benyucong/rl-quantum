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
rz(0.228) q[4];
rz(0.185) q[5];
rz(0.142) q[1];
rz(0.099) q[3];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.257) q[0];
rz(0.214) q[2];
rz(0.171) q[4];
rz(0.128) q[5];
rz(0.085) q[1];
rz(0.042) q[3];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.199) q[0];
rz(0.156) q[2];
rz(0.113) q[4];
rz(0.070) q[5];
rz(0.027) q[1];
rz(0.014) q[3];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Final edge interactions
rz(0.142) q[0];
rz(0.099) q[2];
rz(0.056) q[4];
rz(0.013) q[5];
rz(0.008) q[1];
rz(0.005) q[3];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];