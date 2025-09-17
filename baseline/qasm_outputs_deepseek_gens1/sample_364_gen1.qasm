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
rz(0.314) q[0];
rz(0.271) q[3];
rz(0.228) q[5];
rz(0.185) q[6];
rz(0.142) q[1];
rz(0.099) q[2];
rz(0.056) q[4];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.298) q[0];
rz(0.257) q[3];
rz(0.216) q[5];
rz(0.175) q[6];
rz(0.134) q[1];
rz(0.093) q[2];
rz(0.052) q[4];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.282) q[0];
rz(0.243) q[3];
rz(0.204) q[5];
rz(0.165) q[6];
rz(0.126) q[1];
rz(0.087) q[2];
rz(0.048) q[4];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Final edge interactions
rz(0.266) q[0];
rz(0.229) q[3];
rz(0.192) q[5];
rz(0.155) q[6];
rz(0.118) q[1];
rz(0.081) q[2];
rz(0.044) q[4];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];