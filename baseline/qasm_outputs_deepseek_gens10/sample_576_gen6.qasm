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
rz(0.271) q[1];
rz(0.419) q[2];
rz(0.382) q[3];
rz(0.456) q[4];
rz(0.298) q[5];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.287) q[0];
rz(0.253) q[1];
rz(0.391) q[2];
rz(0.356) q[3];
rz(0.423) q[4];
rz(0.279) q[5];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Edge interactions
rz(0.265) q[0];
rz(0.238) q[1];
rz(0.368) q[2];
rz(0.335) q[3];
rz(0.397) q[4];
rz(0.263) q[5];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
// Final edge interactions
rz(0.248) q[0];
rz(0.226) q[1];
rz(0.349) q[2];
rz(0.318) q[3];
rz(0.375) q[4];
rz(0.251) q[5];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];