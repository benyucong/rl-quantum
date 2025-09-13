OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First QAOA layer - Problem unitary
// Edge (0,3)
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (1,4)
cx q[1], q[4];
rz(0.7854) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.7854) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.7854) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.7854) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.7854) q[6];
cx q[5], q[6];

// First QAOA layer - Mixer unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];

// Second QAOA layer - Problem unitary
// Edge (0,3)
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.3927) q[5];
cx q[0], q[5];

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

// Edge (2,5)
cx q[2], q[5];
rz(0.3927) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.3927) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.3927) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.3927) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.3927) q[6];
cx q[5], q[6];

// Second QAOA layer - Mixer unitary
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];