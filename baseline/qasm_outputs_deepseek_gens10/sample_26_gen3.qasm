OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// Vertex cover cost function terms (edges)
// Edge (0,6)
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (1,6)
cx q[1], q[6];
rz(0.7854) q[6];
cx q[1], q[6];

// Edge (1,7)
cx q[1], q[7];
rz(0.7854) q[7];
cx q[1], q[7];

// Edge (1,8)
cx q[1], q[8];
rz(0.7854) q[8];
cx q[1], q[8];

// Edge (2,7)
cx q[2], q[7];
rz(0.7854) q[7];
cx q[2], q[7];

// Edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge (4,7)
cx q[4], q[7];
rz(0.7854) q[7];
cx q[4], q[7];

// Edge (4,8)
cx q[4], q[8];
rz(0.7854) q[8];
cx q[4], q[8];

// Edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// Edge (6,8)
cx q[6], q[8];
rz(0.7854) q[8];
cx q[6], q[8];

// Mixer layer 1
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];
rx(1.5708) q[8];

// Layer 2: Repeat cost function with optimized parameters
// Edge terms with optimized angles
cx q[0], q[6];
rz(1.2566) q[6];
cx q[0], q[6];

cx q[1], q[6];
rz(1.2566) q[6];
cx q[1], q[6];

cx q[1], q[7];
rz(1.2566) q[7];
cx q[1], q[7];

cx q[1], q[8];
rz(1.2566) q[8];
cx q[1], q[8];

cx q[2], q[7];
rz(1.2566) q[7];
cx q[2], q[7];

cx q[3], q[5];
rz(1.2566) q[5];
cx q[3], q[5];

cx q[4], q[5];
rz(1.2566) q[5];
cx q[4], q[5];

cx q[4], q[7];
rz(1.2566) q[7];
cx q[4], q[7];

cx q[4], q[8];
rz(1.2566) q[8];
cx q[4], q[8];

cx q[5], q[6];
rz(1.2566) q[6];
cx q[5], q[6];

cx q[6], q[8];
rz(1.2566) q[8];
cx q[6], q[8];

// Mixer layer 2
rx(1.2566) q[0];
rx(1.2566) q[1];
rx(1.2566) q[2];
rx(1.2566) q[3];
rx(1.2566) q[4];
rx(1.2566) q[5];
rx(1.2566) q[6];
rx(1.2566) q[7];
rx(1.2566) q[8];

// Layer 3: Final cost function with optimized parameters
// Edge terms with final optimized angles
cx q[0], q[6];
rz(0.6283) q[6];
cx q[0], q[6];

cx q[1], q[6];
rz(0.6283) q[6];
cx q[1], q[6];

cx q[1], q[7];
rz(0.6283) q[7];
cx q[1], q[7];

cx q[1], q[8];
rz(0.6283) q[8];
cx q[1], q[8];

cx q[2], q[7];
rz(0.6283) q[7];
cx q[2], q[7];

cx q[3], q[5];
rz(0.6283) q[5];
cx q[3], q[5];

cx q[4], q[5];
rz(0.6283) q[5];
cx q[4], q[5];

cx q[4], q[7];
rz(0.6283) q[7];
cx q[4], q[7];

cx q[4], q[8];
rz(0.6283) q[8];
cx q[4], q[8];

cx q[5], q[6];
rz(0.6283) q[6];
cx q[5], q[6];

cx q[6], q[8];
rz(0.6283) q[8];
cx q[6], q[8];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];