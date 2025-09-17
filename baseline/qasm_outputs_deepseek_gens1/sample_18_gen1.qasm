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
rz(0.314) q[0];  // Edge 0-1 (weight 2)
rz(0.628) q[1];  // Edge 0-1 (weight 2)
rz(2.356) q[0];  // Edge 0-2 (weight 15)
rz(2.356) q[2];  // Edge 0-2 (weight 15)
rz(1.727) q[0];  // Edge 0-8 (weight 11)
rz(1.727) q[8];  // Edge 0-8 (weight 11)
rz(1.414) q[2];  // Edge 2-3 (weight 9)
rz(1.414) q[3];  // Edge 2-3 (weight 9)
rz(1.727) q[3];  // Edge 3-4 (weight 11)
rz(1.727) q[4];  // Edge 3-4 (weight 11)
rz(0.314) q[4];  // Edge 4-5 (weight 2)
rz(0.314) q[5];  // Edge 4-5 (weight 2)
rz(1.885) q[4];  // Edge 4-6 (weight 12)
rz(1.885) q[6];  // Edge 4-6 (weight 12)
rz(2.827) q[5];  // Edge 5-7 (weight 18)
rz(2.827) q[7];  // Edge 5-7 (weight 18)
rz(0.785) q[6];  // Edge 6-7 (weight 5)
rz(0.785) q[7];  // Edge 6-7 (weight 5)

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

// Layer 2: Additional optimization rotations
rz(0.157) q[0];
rz(0.157) q[1];
rz(0.471) q[2];
rz(0.471) q[3];
rz(0.314) q[4];
rz(0.314) q[5];
rz(0.471) q[6];
rz(0.471) q[7];
rz(0.157) q[8];

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