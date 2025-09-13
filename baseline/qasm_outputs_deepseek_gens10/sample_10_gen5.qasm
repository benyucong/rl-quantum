OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard and parameterized rotations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
rx(0.7854) q[0];
rz(0.3927) q[0];
rx(0.7854) q[1];
rz(0.3927) q[1];
rx(0.7854) q[2];
rz(0.3927) q[2];
rx(0.7854) q[3];
rz(0.3927) q[3];
rx(0.7854) q[4];
rz(0.3927) q[4];
rx(0.7854) q[5];
rz(0.3927) q[5];

// Layer 2: Problem-specific entangling gates (edge interactions)
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
// Edge (1,2)
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];
// Edge (2,5)
cx q[2], q[5];
rz(0.5236) q[5];
cx q[2], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.5236) q[5];
cx q[4], q[5];

// Layer 3: Final parameterized rotations
rx(0.3927) q[0];
rz(0.1963) q[0];
rx(0.3927) q[1];
rz(0.1963) q[1];
rx(0.3927) q[2];
rz(0.1963) q[2];
rx(0.3927) q[3];
rz(0.1963) q[3];
rx(0.3927) q[4];
rz(0.1963) q[4];
rx(0.3927) q[5];
rz(0.1963) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];