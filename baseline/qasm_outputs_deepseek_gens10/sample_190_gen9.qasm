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

// Layer 1 - Mixer and cost terms
// Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Cost terms for edges (penalize non-clique configurations)
// Edge (0,1)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];

// Edge (0,4)
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];

// Edge (1,2)
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(0.3927) q[6];
cx q[2], q[6];

// Edge (2,7)
cx q[2], q[7];
rz(0.3927) q[7];
cx q[2], q[7];

// Edge (3,4)
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];

// Edge (6,5)
cx q[6], q[5];
rz(0.3927) q[5];
cx q[6], q[5];

// Edge (5,7)
cx q[5], q[7];
rz(0.3927) q[7];
cx q[5], q[7];

// Layer 2 - Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Layer 3 - Cost terms (repeated with optimized parameters)
// Edge (0,1)
cx q[0], q[1];
rz(0.5236) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

// Edge (0,3)
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Edge (0,4)
cx q[0], q[4];
rz(0.5236) q[4];
cx q[0], q[4];

// Edge (1,2)
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.5236) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];

// Edge (2,7)
cx q[2], q[7];
rz(0.5236) q[7];
cx q[2], q[7];

// Edge (3,4)
cx q[3], q[4];
rz(0.5236) q[4];
cx q[3], q[4];

// Edge (6,5)
cx q[6], q[5];
rz(0.5236) q[5];
cx q[6], q[5];

// Edge (5,7)
cx q[5], q[7];
rz(0.5236) q[7];
cx q[5], q[7];

// Layer 4 - Final mixer terms
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];