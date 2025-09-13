OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 1: Problem-specific phase rotations based on edge weights
rz(0.314) q[0];
rz(0.314) q[1];
rz(2.356) q[0];
rz(2.356) q[2];
rz(1.727) q[0];
rz(1.727) q[8];
rz(1.414) q[2];
rz(1.414) q[3];
rz(1.727) q[3];
rz(1.727) q[4];
rz(0.314) q[4];
rz(0.314) q[5];
rz(1.885) q[4];
rz(1.885) q[6];
rz(2.827) q[5];
rz(2.827) q[7];
rz(0.785) q[6];
rz(0.785) q[7];

// Layer 1: Mixer layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Layer 2: Second set of phase rotations
rz(0.471) q[0];
rz(0.471) q[1];
rz(3.534) q[0];
rz(3.534) q[2];
rz(2.591) q[0];
rz(2.591) q[8];
rz(2.121) q[2];
rz(2.121) q[3];
rz(2.591) q[3];
rz(2.591) q[4];
rz(0.471) q[4];
rz(0.471) q[5];
rz(2.827) q[4];
rz(2.827) q[6];
rz(4.241) q[5];
rz(4.241) q[7];
rz(1.178) q[6];
rz(1.178) q[7];

// Layer 2: Final mixer layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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