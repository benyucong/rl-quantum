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
rz(0.285) q[3];
rz(0.306) q[4];
rz(0.292) q[5];

// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Edge interactions - Layer 2
rz(0.427) q[0];
rz(0.391) q[1];
rz(0.412) q[2];
rz(0.403) q[3];
rz(0.418) q[4];
rz(0.408) q[5];

// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Edge interactions - Layer 3
rz(0.539) q[0];
rz(0.512) q[1];
rz(0.527) q[2];
rz(0.521) q[3];
rz(0.531) q[4];
rz(0.525) q[5];

// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Final optimization rotations
rz(0.652) q[0];
rz(0.633) q[1];
rz(0.642) q[2];
rz(0.639) q[3];
rz(0.644) q[4];
rz(0.641) q[5];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];