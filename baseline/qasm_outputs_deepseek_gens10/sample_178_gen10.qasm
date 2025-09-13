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
rz(0.271) q[1];
rz(0.295) q[2];
rz(0.283) q[3];
rz(0.302) q[4];
rz(0.289) q[5];
rz(0.278) q[6];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.628) q[0];
rz(0.542) q[1];
rz(0.590) q[2];
rz(0.566) q[3];
rz(0.604) q[4];
rz(0.578) q[5];
rz(0.556) q[6];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.942) q[0];
rz(0.813) q[1];
rz(0.885) q[2];
rz(0.849) q[3];
rz(0.906) q[4];
rz(0.867) q[5];
rz(0.834) q[6];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Final optimization
rz(1.256) q[0];
rz(1.084) q[1];
rz(1.180) q[2];
rz(1.132) q[3];
rz(1.208) q[4];
rz(1.156) q[5];
rz(1.112) q[6];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];