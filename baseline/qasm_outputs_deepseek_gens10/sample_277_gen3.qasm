OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First mixing layer
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Problem-specific unitaries for matching constraints
// Edge (0,1) - weight 1
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,2) - weight 11
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];

// Edge (1,5) - weight 19
cx q[1], q[5];
rz(0.3927) q[5];
cx q[1], q[5];

// Edge (1,4) - weight 12
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];

// Edge (2,3) - weight 5
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];

// Edge (3,4) - weight 17
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];

// Edge (4,5) - weight 2
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];

// Edge (4,6) - weight 19
cx q[4], q[6];
rz(0.3927) q[6];
cx q[4], q[6];

// Layer 2: Second mixing layer
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.5236) q[3];
rz(0.5236) q[4];
rz(0.5236) q[5];
rz(0.5236) q[6];
rz(0.5236) q[7];

// Repeat problem unitaries with adjusted parameters
cx q[0], q[1];
rz(0.2618) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.2618) q[2];
cx q[0], q[2];

cx q[1], q[5];
rz(0.2618) q[5];
cx q[1], q[5];

cx q[1], q[4];
rz(0.2618) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(0.2618) q[3];
cx q[2], q[3];

cx q[3], q[4];
rz(0.2618) q[4];
cx q[3], q[4];

cx q[4], q[5];
rz(0.2618) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.2618) q[6];
cx q[4], q[6];

// Layer 3: Final mixing layer
rz(0.3491) q[0];
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
rz(0.3491) q[5];
rz(0.3491) q[6];
rz(0.3491) q[7];

// Final problem unitaries
cx q[0], q[1];
rz(0.1745) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.1745) q[2];
cx q[0], q[2];

cx q[1], q[5];
rz(0.1745) q[5];
cx q[1], q[5];

cx q[1], q[4];
rz(0.1745) q[4];
cx q[1], q[4];

cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];

cx q[3], q[4];
rz(0.1745) q[4];
cx q[3], q[4];

cx q[4], q[5];
rz(0.1745) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.1745) q[6];
cx q[4], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];