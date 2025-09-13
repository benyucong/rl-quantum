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

// First QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// First QAOA layer - Problem Hamiltonian (min-cut constraints)
// Edge 0-1 (capacity 1)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge 0-2 (capacity 1)
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];

// Edge 0-7 (capacity 6)
cx q[0], q[7];
rz(2.3562) q[7];
cx q[0], q[7];

// Edge 1-3 (capacity 2)
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Edge 1-5 (capacity 2)
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge 1-7 (capacity 6)
cx q[1], q[7];
rz(2.3562) q[7];
cx q[1], q[7];

// Edge 3-1 (capacity 2)
cx q[3], q[1];
rz(0.7854) q[1];
cx q[3], q[1];

// Edge 3-2 (capacity 2)
cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];

// Edge 3-7 (capacity 3)
cx q[3], q[7];
rz(1.1781) q[7];
cx q[3], q[7];

// Edge 4-6 (capacity 2)
cx q[4], q[6];
rz(0.7854) q[6];
cx q[4], q[6];

// Edge 5-1 (capacity 4)
cx q[5], q[1];
rz(1.5708) q[1];
cx q[5], q[1];

// Edge 5-2 (capacity 7)
cx q[5], q[2];
rz(2.7489) q[2];
cx q[5], q[2];

// Edge 5-6 (capacity 7)
cx q[5], q[6];
rz(2.7489) q[6];
cx q[5], q[6];

// Edge 6-1 (capacity 2)
cx q[6], q[1];
rz(0.7854) q[1];
cx q[6], q[1];

// Second QAOA layer - Mixer Hamiltonian
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];

// Second QAOA layer - Problem Hamiltonian (repeated with same parameters)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];

cx q[0], q[7];
rz(2.3562) q[7];
cx q[0], q[7];

cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

cx q[1], q[7];
rz(2.3562) q[7];
cx q[1], q[7];

cx q[3], q[1];
rz(0.7854) q[1];
cx q[3], q[1];

cx q[3], q[2];
rz(0.7854) q[2];
cx q[3], q[2];

cx q[3], q[7];
rz(1.1781) q[7];
cx q[3], q[7];

cx q[4], q[6];
rz(0.7854) q[6];
cx q[4], q[6];

cx q[5], q[1];
rz(1.5708) q[1];
cx q[5], q[1];

cx q[5], q[2];
rz(2.7489) q[2];
cx q[5], q[2];

cx q[5], q[6];
rz(2.7489) q[6];
cx q[5], q[6];

cx q[6], q[1];
rz(0.7854) q[1];
cx q[6], q[1];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];