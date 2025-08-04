OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2 - Entangling based on bipartite graph edges
// Edge 0-5 (weight 4)
cx q[0], q[5];
rz(0.04) q[5];
cx q[0], q[5];
// Edge 0-6 (weight 16)
cx q[0], q[6];
rz(0.16) q[6];
cx q[0], q[6];
// Edge 1-6 (weight 7)
cx q[1], q[6];
rz(0.07) q[6];
cx q[1], q[6];
// Edge 1-8 (weight 13)
cx q[1], q[8];
rz(0.13) q[8];
cx q[1], q[8];
// Edge 1-7 (weight 11)
cx q[1], q[7];
rz(0.11) q[7];
cx q[1], q[7];
// Edge 2-7 (weight 4)
cx q[2], q[7];
rz(0.04) q[7];
cx q[2], q[7];
// Edge 2-5 (weight 17)
cx q[2], q[5];
rz(0.17) q[5];
cx q[2], q[5];
// Edge 3-8 (weight 7)
cx q[3], q[8];
rz(0.07) q[8];
cx q[3], q[8];
// Edge 3-5 (weight 18)
cx q[3], q[5];
rz(0.18) q[5];
cx q[3], q[5];

// Layer 3 - Mixer layer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];

// Layer 4 - Final optimization
rz(0.25) q[0];
rz(0.35) q[1];
rz(0.15) q[2];
rz(0.45) q[3];
rz(0.05) q[4];
rz(0.30) q[5];
rz(0.20) q[6];
rz(0.40) q[7];
rz(0.10) q[8];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];