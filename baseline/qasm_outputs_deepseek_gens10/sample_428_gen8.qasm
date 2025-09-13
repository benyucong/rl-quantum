OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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
h q[9];

// Layer 1: Problem-specific phase rotations based on edge weights
// Edge (0,1): weight 10
rz(0.314) q[0];
rz(0.314) q[1];

// Edge (0,4): weight 20
rz(0.628) q[0];
rz(0.628) q[4];

// Edge (0,6): weight 14
rz(0.440) q[0];
rz(0.440) q[6];

// Edge (1,8): weight 13
rz(0.408) q[1];
rz(0.408) q[8];

// Edge (2,3): weight 3
rz(0.094) q[2];
rz(0.094) q[3];

// Edge (2,5): weight 11
rz(0.345) q[2];
rz(0.345) q[5];

// Edge (4,5): weight 2
rz(0.063) q[4];
rz(0.063) q[5];

// Edge (6,7): weight 5
rz(0.157) q[6];
rz(0.157) q[7];

// Edge (7,9): weight 17
rz(0.534) q[7];
rz(0.534) q[9];

// Edge (8,9): weight 10
rz(0.314) q[8];
rz(0.314) q[9];

// Layer 2: Mixer layer with Hadamard gates
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

// Layer 2: Additional phase rotations for optimization
rz(0.785) q[0];
rz(0.785) q[1];
rz(0.785) q[2];
rz(0.785) q[3];
rz(0.785) q[4];
rz(0.785) q[5];
rz(0.785) q[6];
rz(0.785) q[7];
rz(0.785) q[8];
rz(0.785) q[9];

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