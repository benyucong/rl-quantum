OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Layer 1: Problem-specific phase rotations
// Edge (0,1) - weight: 1.0
rz(0.7854) q[0];
rz(0.7854) q[1];
// Edge (0,2) - weight: 1.0
rz(0.7854) q[0];
rz(0.7854) q[2];
// Edge (0,5) - weight: 1.0
rz(0.7854) q[0];
rz(0.7854) q[4];
// Edge (1,2) - weight: 1.0
rz(0.7854) q[1];
rz(0.7854) q[2];
// Edge (1,4) - weight: 1.0
rz(0.7854) q[1];
rz(0.7854) q[3];
// Edge (2,4) - weight: 1.0
rz(0.7854) q[2];
rz(0.7854) q[3];
// Layer 1: Mixer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Layer 2: Problem-specific phase rotations
// Edge (0,1) - weight: 1.0
rz(0.7854) q[0];
rz(0.7854) q[1];
// Edge (0,2) - weight: 1.0
rz(0.7854) q[0];
rz(0.7854) q[2];
// Edge (0,5) - weight: 1.0
rz(0.7854) q[0];
rz(0.7854) q[4];
// Edge (1,2) - weight: 1.0
rz(0.7854) q[1];
rz(0.7854) q[2];
// Edge (1,4) - weight: 1.0
rz(0.7854) q[1];
rz(0.7854) q[3];
// Edge (2,4) - weight: 1.0
rz(0.7854) q[2];
rz(0.7854) q[3];
// Layer 2: Mixer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];