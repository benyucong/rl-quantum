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

// Edge interactions - Layer 1
rz(0.314) q[0];
rz(0.271) q[1];
rz(0.298) q[2];
rz(0.332) q[3];
rz(0.285) q[4];
rz(0.306) q[5];

// Layer 2
rx(1.142) q[0];
rx(1.089) q[1];
rx(1.125) q[2];
rx(1.167) q[3];
rx(1.103) q[4];
rx(1.134) q[5];

// Edge interactions - Layer 2
rz(0.427) q[0];
rz(0.392) q[1];
rz(0.415) q[2];
rz(0.443) q[3];
rz(0.401) q[4];
rz(0.422) q[5];

// Layer 3
rx(0.893) q[0];
rx(0.847) q[1];
rx(0.879) q[2];
rx(0.912) q[3];
rx(0.861) q[4];
rx(0.885) q[5];

// Edge interactions - Layer 3
rz(0.528) q[0];
rz(0.498) q[1];
rz(0.517) q[2];
rz(0.541) q[3];
rz(0.503) q[4];
rz(0.521) q[5];

// Layer 4
rx(0.721) q[0];
rx(0.684) q[1];
rx(0.709) q[2];
rx(0.736) q[3];
rx(0.695) q[4];
rx(0.714) q[5];

// Final edge interactions
rz(0.612) q[0];
rz(0.587) q[1];
rz(0.603) q[2];
rz(0.624) q[3];
rz(0.591) q[4];
rz(0.607) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];