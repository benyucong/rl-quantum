OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard on all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Problem-specific phase rotations based on edge weights
// Edge (0,3): weight 4
rz(0.3927) q[0];
rz(0.3927) q[3];
// Edge (0,5): weight 14
rz(1.3744) q[0];
rz(1.3744) q[5];
// Edge (0,6): weight 19
rz(1.8639) q[0];
rz(1.8639) q[6];
// Edge (0,4): weight 14
rz(1.3744) q[0];
rz(1.3744) q[4];
// Edge (0,7): weight 16
rz(1.5708) q[0];
rz(1.5708) q[7];
// Edge (1,4): weight 7
rz(0.6872) q[1];
rz(0.6872) q[4];
// Edge (1,7): weight 13
rz(1.2763) q[1];
rz(1.2763) q[7];
// Edge (2,5): weight 6
rz(0.5890) q[2];
rz(0.5890) q[5];

// Layer 2: Mixer operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 2: Additional phase rotations for optimization
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];