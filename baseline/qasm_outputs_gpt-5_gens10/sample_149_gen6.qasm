OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// Layer 1 - Initialize with entanglement
cx q[0], q[1];
rz(2.487) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(1.571) q[2];
cx q[0], q[2];
cx q[1], q[3];
rz(0.785) q[3];

// Layer 2 - Further entanglements
cx q[1], q[4];
rz(2.414) q[4];
cx q[1], q[4];
cx q[3], q[5];
rz(1.187) q[5];
cx q[3], q[5];

// Layer 3 - Encoding weights
cx q[2], q[3];
rz(2.0) q[3];
cx q[2], q[3];
cx q[4], q[5];
rz(1.11) q[5];
cx q[4], q[5];

// Layer 4 - Final adjustments
cx q[5], q[6];
rz(0.9) q[6];
cx q[5], q[6];
cx q[3], q[7];
rz(0.75) q[7];
cx q[3], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];