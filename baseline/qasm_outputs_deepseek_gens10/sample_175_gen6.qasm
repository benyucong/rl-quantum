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

// Layer 1 - Edge interactions
rz(0.7854) q[0];
rz(0.3927) q[4];
rz(1.1781) q[6];
rz(1.1781) q[1];
rz(1.1781) q[3];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(0.3927) q[4];
rz(1.1781) q[7];
rz(0.3927) q[4];
rz(0.3927) q[7];

// Layer 2 - Vertex mixing
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];

// Layer 3 - Edge interactions with optimized parameters
rz(0.6283) q[0];
rz(0.3142) q[4];
rz(0.9425) q[6];
rz(0.9425) q[1];
rz(0.9425) q[3];
rz(0.9425) q[5];
rz(0.9425) q[6];
rz(0.3142) q[4];
rz(0.9425) q[7];
rz(0.3142) q[4];
rz(0.3142) q[7];

// Layer 4 - Final mixing and measurement preparation
rx(0.3927) q[0];
rx(0.3927) q[1];
rx(0.3927) q[2];
rx(0.3927) q[3];
rx(0.3927) q[4];
rx(0.3927) q[5];
rx(0.3927) q[6];
rx(0.3927) q[7];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];