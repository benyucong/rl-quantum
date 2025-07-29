OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initialization and first entanglement
h q[0];
h q[1];
h q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 2 - Weighted entangling based on edge weights
crz(0.8) q[0], q[3];  // Weight 4
crz(2.4) q[0], q[7];  // Weight 12
crz(4.0) q[0], q[6];  // Weight 20
crz(3.0) q[0], q[4];  // Weight 15
crz(0.2) q[1], q[4];  // Weight 1
crz(2.4) q[1], q[7];  // Weight 12
crz(2.6) q[1], q[6];  // Weight 13
crz(1.4) q[2], q[5];  // Weight 7

// Layer 3 - Mixing and optimization
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(1.2566) q[2];
rz(0.6283) q[3];
rz(0.6283) q[4];
rz(0.6283) q[5];
rz(0.6283) q[6];
rz(0.6283) q[7];

// Layer 4 - Final entanglement and measurement prep
crz(0.4) q[0], q[3];
crz(1.2) q[0], q[7];
crz(2.0) q[0], q[6];
crz(1.5) q[0], q[4];
crz(0.1) q[1], q[4];
crz(1.2) q[1], q[7];
crz(1.3) q[1], q[6];
crz(0.7) q[2], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];