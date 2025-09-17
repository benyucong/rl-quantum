OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First QAOA layer - Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

// Edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

// First QAOA layer - Mixer unitary
h q[0];
rz(1.5708) q[0];
h q[0];

h q[1];
rz(1.5708) q[1];
h q[1];

h q[2];
rz(1.5708) q[2];
h q[2];

h q[3];
rz(1.5708) q[3];
h q[3];

h q[4];
rz(1.5708) q[4];
h q[4];

h q[5];
rz(1.5708) q[5];
h q[5];

// Second QAOA layer - Problem unitary
// Edge (0,1)
cx q[0], q[1];
rz(0.7854) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.7854) q[2];
cx q[1], q[2];

// Edge (2,3)
cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

// Edge (2,5)
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];

// Edge (2,4)
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

// Second QAOA layer - Mixer unitary
h q[0];
rz(1.5708) q[0];
h q[0];

h q[1];
rz(1.5708) q[1];
h q[1];

h q[2];
rz(1.5708) q[2];
h q[2];

h q[3];
rz(1.5708) q[3];
h q[3];

h q[4];
rz(1.5708) q[4];
h q[4];

h q[5];
rz(1.5708) q[5];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];