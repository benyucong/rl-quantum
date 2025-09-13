OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

// First QAOA layer - Problem Hamiltonian (min-cut constraints)
// Edge 0-3 (capacity 3)
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Edge 0-6 (capacity 4)
cx q[0], q[6];
rz(0.6981) q[6];
cx q[0], q[6];

// Edge 0-7 (capacity 4)
cx q[0], q[7];
rz(0.6981) q[7];
cx q[0], q[7];

// Edge 1-3 (capacity 4)
cx q[1], q[3];
rz(0.6981) q[3];
cx q[1], q[3];

// Edge 1-5 (capacity 3)
cx q[1], q[5];
rz(0.5236) q[5];
cx q[1], q[5];

// Edge 1-6 (capacity 1)
cx q[1], q[6];
rz(0.1745) q[6];
cx q[1], q[6];

// Edge 1-8 (capacity 2)
cx q[1], q[8];
rz(0.3491) q[8];
cx q[1], q[8];

// Edge 2-3 (capacity 1)
cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];

// Edge 2-6 (capacity 3)
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];

// Edge 3-1 (capacity 1)
cx q[3], q[1];
rz(0.1745) q[1];
cx q[3], q[1];

// Edge 3-2 (capacity 1)
cx q[3], q[2];
rz(0.1745) q[2];
cx q[3], q[2];

// Edge 4-8 (capacity 4)
cx q[4], q[8];
rz(0.6981) q[8];
cx q[4], q[8];

// Edge 5-1 (capacity 2)
cx q[5], q[1];
rz(0.3491) q[1];
cx q[5], q[1];

// Edge 5-3 (capacity 3)
cx q[5], q[3];
rz(0.5236) q[3];
cx q[5], q[3];

// Edge 5-8 (capacity 2)
cx q[5], q[8];
rz(0.3491) q[8];
cx q[5], q[8];

// Edge 6-3 (capacity 3)
cx q[6], q[3];
rz(0.5236) q[3];
cx q[6], q[3];

// Edge 6-8 (capacity 2)
cx q[6], q[8];
rz(0.3491) q[8];
cx q[6], q[8];

// Edge 7-1 (capacity 1)
cx q[7], q[1];
rz(0.1745) q[1];
cx q[7], q[1];

// Edge 7-3 (capacity 1)
cx q[7], q[3];
rz(0.1745) q[3];
cx q[7], q[3];

// Edge 7-4 (capacity 2)
cx q[7], q[4];
rz(0.3491) q[4];
cx q[7], q[4];

// Second QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];

// Second QAOA layer - Problem Hamiltonian (repeated with same parameters)
// Edge 0-3
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Edge 0-6
cx q[0], q[6];
rz(0.6981) q[6];
cx q[0], q[6];

// Edge 0-7
cx q[0], q[7];
rz(0.6981) q[7];
cx q[0], q[7];

// Edge 1-3
cx q[1], q[3];
rz(0.6981) q[3];
cx q[1], q[3];

// Edge 1-5
cx q[1], q[5];
rz(0.5236) q[5];
cx q[1], q[5];

// Edge 1-6
cx q[1], q[6];
rz(0.1745) q[6];
cx q[1], q[6];

// Edge 1-8
cx q[1], q[8];
rz(0.3491) q[8];
cx q[1], q[8];

// Edge 2-3
cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];

// Edge 2-6
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];

// Edge 3-1
cx q[3], q[1];
rz(0.1745) q[1];
cx q[3], q[1];

// Edge 3-2
cx q[3], q[2];
rz(0.1745) q[2];
cx q[3], q[2];

// Edge 4-8
cx q[4], q[8];
rz(0.6981) q[8];
cx q[4], q[8];

// Edge 5-1
cx q[5], q[1];
rz(0.3491) q[1];
cx q[5], q[1];

// Edge 5-3
cx q[5], q[3];
rz(0.5236) q[3];
cx q[5], q[3];

// Edge 5-8
cx q[5], q[8];
rz(0.3491) q[8];
cx q[5], q[8];

// Edge 6-3
cx q[6], q[3];
rz(0.5236) q[3];
cx q[6], q[3];

// Edge 6-8
cx q[6], q[8];
rz(0.3491) q[8];
cx q[6], q[8];

// Edge 7-1
cx q[7], q[1];
rz(0.1745) q[1];
cx q[7], q[1];

// Edge 7-3
cx q[7], q[3];
rz(0.1745) q[3];
cx q[7], q[3];

// Edge 7-4
cx q[7], q[4];
rz(0.3491) q[4];
cx q[7], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];