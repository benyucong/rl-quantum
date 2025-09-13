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

// First QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];

// First QAOA layer - Problem Hamiltonian
// Edge (0,1) with capacity 1
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,4) with capacity 1
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];

// Edge (1,5) with capacity 2
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (2,1) with capacity 1
cx q[2], q[1];
rz(0.3927) q[1];
cx q[2], q[1];

// Edge (2,4) with capacity 2
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

// Edge (2,5) with capacity 1
cx q[2], q[5];
rz(0.3927) q[5];
cx q[2], q[5];

// Edge (3,4) with capacity 2
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];

// Edge (3,5) with capacity 1
cx q[3], q[5];
rz(0.3927) q[5];
cx q[3], q[5];

// Edge (4,3) with capacity 1
cx q[4], q[3];
rz(0.3927) q[3];
cx q[4], q[3];

// Second QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,1) with capacity 1
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,4) with capacity 1
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];

// Edge (1,5) with capacity 2
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (2,1) with capacity 1
cx q[2], q[1];
rz(0.3927) q[1];
cx q[2], q[1];

// Edge (2,4) with capacity 2
cx q[2], q[4];
rz(0.7854) q[4];
cx q[2], q[4];

// Edge (2,5) with capacity 1
cx q[2], q[5];
rz(0.3927) q[5];
cx q[2], q[5];

// Edge (3,4) with capacity 2
cx q[3], q[4];
rz(0.7854) q[4];
cx q[3], q[4];

// Edge (3,5) with capacity 1
cx q[3], q[5];
rz(0.3927) q[5];
cx q[3], q[5];

// Edge (4,3) with capacity 1
cx q[4], q[3];
rz(0.3927) q[3];
cx q[4], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];