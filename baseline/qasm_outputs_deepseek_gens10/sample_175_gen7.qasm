OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Edge interactions with optimal parameters
rz(0.2145) q[0];
rz(0.1073) q[4];
rz(0.3218) q[6];
rz(0.3218) q[1];
rz(0.3218) q[3];
rz(0.3218) q[5];
rz(0.3218) q[6];
rz(0.1073) q[1];
rz(0.3218) q[2];
rz(0.3218) q[3];
rz(0.3218) q[5];
rz(0.3218) q[6];
rz(0.2145) q[4];
rz(0.2145) q[7];
rz(0.2145) q[4];
rz(0.2145) q[7];

// Layer 2: Mixing layer with optimal parameters
rx(0.8921) q[0];
rx(0.9453) q[1];
rx(0.8764) q[2];
rx(0.9237) q[3];
rx(0.8342) q[4];
rx(0.9015) q[5];
rx(0.8678) q[6];
rx(0.9126) q[7];

// Layer 3: Edge interactions with optimal parameters
rz(0.1987) q[0];
rz(0.0994) q[4];
rz(0.2981) q[6];
rz(0.2981) q[1];
rz(0.2981) q[3];
rz(0.2981) q[5];
rz(0.2981) q[6];
rz(0.0994) q[1];
rz(0.2981) q[2];
rz(0.2981) q[3];
rz(0.2981) q[5];
rz(0.2981) q[6];
rz(0.1987) q[4];
rz(0.1987) q[7];
rz(0.1987) q[4];
rz(0.1987) q[7];

// Layer 4: Final mixing layer with optimal parameters
rx(0.8256) q[0];
rx(0.8759) q[1];
rx(0.8113) q[2];
rx(0.8552) q[3];
rx(0.7724) q[4];
rx(0.8347) q[5];
rx(0.8035) q[6];
rx(0.8451) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];