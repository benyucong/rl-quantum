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
rz(0.285) q[2];
rz(0.229) q[3];
rz(0.342) q[4];
rz(0.298) q[5];
rz(0.256) q[6];
// Layer 2
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.412) q[0];
rz(0.367) q[1];
rz(0.381) q[2];
rz(0.335) q[3];
rz(0.438) q[4];
rz(0.394) q[5];
rz(0.352) q[6];
// Layer 3
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Edge interactions
rz(0.518) q[0];
rz(0.463) q[1];
rz(0.477) q[2];
rz(0.431) q[3];
rz(0.534) q[4];
rz(0.490) q[5];
rz(0.448) q[6];
// Layer 4
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Final edge interactions
rz(0.624) q[0];
rz(0.559) q[1];
rz(0.573) q[2];
rz(0.527) q[3];
rz(0.630) q[4];
rz(0.586) q[5];
rz(0.544) q[6];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];