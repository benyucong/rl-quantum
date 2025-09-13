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
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Layer 2: Problem-specific entangling gates (edge interactions)
// Edge (0,1) weight 7
cx q[0], q[1];
rz(0.1222) q[1];
cx q[0], q[1];

// Edge (0,6) weight 19
cx q[0], q[6];
rz(0.3318) q[6];
cx q[0], q[6];

// Edge (0,4) weight 11
cx q[0], q[4];
rz(0.1920) q[4];
cx q[0], q[4];

// Edge (1,3) weight 11
cx q[1], q[3];
rz(0.1920) q[3];
cx q[1], q[3];

// Edge (2,3) weight 10
cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];

// Edge (3,5) weight 12
cx q[3], q[5];
rz(0.2094) q[5];
cx q[3], q[5];

// Edge (3,6) weight 17
cx q[3], q[6];
rz(0.2967) q[6];
cx q[3], q[6];

// Edge (4,5) weight 8
cx q[4], q[5];
rz(0.1396) q[5];
cx q[4], q[5];

// Layer 3: Mixer layer with parameterized rotations
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Layer 4: Final parameterized rotations and measurement
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];