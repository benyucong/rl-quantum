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

// Layer 1: Edge interactions
// Edge (0,1) capacity 2
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,2) capacity 2
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

// Edge (0,5) capacity 2
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (0,6) capacity 1
cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

// Edge (1,2) capacity 1
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];

// Edge (1,5) capacity 2
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (2,1) capacity 2
cx q[2], q[1];
rz(0.7854) q[1];
cx q[2], q[1];

// Edge (3,1) capacity 2
cx q[3], q[1];
rz(0.7854) q[1];
cx q[3], q[1];

// Edge (4,7) capacity 1
cx q[4], q[7];
rz(0.3927) q[7];
cx q[4], q[7];

// Edge (5,3) capacity 1
cx q[5], q[3];
rz(0.3927) q[3];
cx q[5], q[3];

// Edge (5,4) capacity 2
cx q[5], q[4];
rz(0.7854) q[4];
cx q[5], q[4];

// Edge (6,3) capacity 1
cx q[6], q[3];
rz(0.3927) q[3];
cx q[6], q[3];

// Layer 2: Mixing layer
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];
rx(0.5236) q[7];

// Layer 3: Final edge interactions (repeated for depth)
// Edge (0,1) capacity 2
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (0,2) capacity 2
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

// Edge (0,5) capacity 2
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (0,6) capacity 1
cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

// Edge (1,2) capacity 1
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];

// Edge (1,5) capacity 2
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (2,1) capacity 2
cx q[2], q[1];
rz(0.7854) q[1];
cx q[2], q[1];

// Edge (3,1) capacity 2
cx q[3], q[1];
rz(0.7854) q[1];
cx q[3], q[1];

// Edge (4,7) capacity 1
cx q[4], q[7];
rz(0.3927) q[7];
cx q[4], q[7];

// Edge (5,3) capacity 1
cx q[5], q[3];
rz(0.3927) q[3];
cx q[5], q[3];

// Edge (5,4) capacity 2
cx q[5], q[4];
rz(0.7854) q[4];
cx q[5], q[4];

// Edge (6,3) capacity 1
cx q[6], q[3];
rz(0.3927) q[3];
cx q[6], q[3];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];