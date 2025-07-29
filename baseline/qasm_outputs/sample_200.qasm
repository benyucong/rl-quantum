OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1 - Initialization and entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// Layer 2 - Problem-specific operations (optimal matching)
// Apply CRX gates based on edge weights
crx(0.7854) q[0], q[5];  // weight 1
crx(0.1963) q[0], q[6];  // weight 13
crx(0.1833) q[0], q[9];  // weight 14
crx(0.7854) q[1], q[6];  // weight 1
crx(0.7854) q[2], q[7];  // weight 5
crx(0.7854) q[3], q[8];  // weight 5
crx(0.2618) q[3], q[5];  // weight 12
crx(0.7854) q[4], q[9];  // weight 5
crx(0.1571) q[4], q[7];  // weight 17
crx(0.1963) q[4], q[5];  // weight 13

// Layer 3 - Amplitude amplification
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];
rz(1.5708) q[8];
rz(1.5708) q[9];

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
c[9] = measure q[9];