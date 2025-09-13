OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

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
h q[9];

// Layer 1 - Mixer and Cost Hamiltonians
// Mixer terms
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
rz(0.7854) q[8];
rz(0.7854) q[9];

// Cost Hamiltonian terms (edge interactions)
// Edge 0-1 (capacity 2)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge 0-2 (capacity 4)
cx q[0], q[2];
rz(0.7854) q[2];
cx q[0], q[2];

// Edge 0-3 (capacity 3)
cx q[0], q[3];
rz(0.5890) q[3];
cx q[0], q[3];

// Edge 0-6 (capacity 3)
cx q[0], q[6];
rz(0.5890) q[6];
cx q[0], q[6];

// Edge 1-3 (capacity 3)
cx q[1], q[3];
rz(0.5890) q[3];
cx q[1], q[3];

// Edge 1-6 (capacity 5)
cx q[1], q[6];
rz(0.9817) q[6];
cx q[1], q[6];

// Edge 1-8 (capacity 2)
cx q[1], q[8];
rz(0.3927) q[8];
cx q[1], q[8];

// Edge 2-3 (capacity 6)
cx q[2], q[3];
rz(1.1781) q[3];
cx q[2], q[3];

// Edge 2-4 (capacity 1)
cx q[2], q[4];
rz(0.1963) q[4];
cx q[2], q[4];

// Edge 2-5 (capacity 5)
cx q[2], q[5];
rz(0.9817) q[5];
cx q[2], q[5];

// Edge 2-6 (capacity 2)
cx q[2], q[6];
rz(0.3927) q[6];
cx q[2], q[6];

// Edge 2-9 (capacity 2)
cx q[2], q[9];
rz(0.3927) q[9];
cx q[2], q[9];

// Edge 3-7 (capacity 5)
cx q[3], q[7];
rz(0.9817) q[7];
cx q[3], q[7];

// Edge 4-1 (capacity 6)
cx q[4], q[1];
rz(1.1781) q[1];
cx q[4], q[1];

// Edge 4-2 (capacity 2)
cx q[4], q[2];
rz(0.3927) q[2];
cx q[4], q[2];

// Edge 4-3 (capacity 6)
cx q[4], q[3];
rz(1.1781) q[3];
cx q[4], q[3];

// Edge 4-6 (capacity 2)
cx q[4], q[6];
rz(0.3927) q[6];
cx q[4], q[6];

// Edge 4-7 (capacity 3)
cx q[4], q[7];
rz(0.5890) q[7];
cx q[4], q[7];

// Edge 5-1 (capacity 3)
cx q[5], q[1];
rz(0.5890) q[1];
cx q[5], q[1];

// Edge 5-6 (capacity 5)
cx q[5], q[6];
rz(0.9817) q[6];
cx q[5], q[6];

// Edge 5-7 (capacity 3)
cx q[5], q[7];
rz(0.5890) q[7];
cx q[5], q[7];

// Edge 6-1 (capacity 4)
cx q[6], q[1];
rz(0.7854) q[1];
cx q[6], q[1];

// Edge 6-2 (capacity 2)
cx q[6], q[2];
rz(0.3927) q[2];
cx q[6], q[2];

// Edge 6-7 (capacity 6)
cx q[6], q[7];
rz(1.1781) q[7];
cx q[6], q[7];

// Edge 6-8 (capacity 4)
cx q[6], q[8];
rz(0.7854) q[8];
cx q[6], q[8];

// Edge 7-2 (capacity 5)
cx q[7], q[2];
rz(0.9817) q[2];
cx q[7], q[2];

// Edge 7-4 (capacity 6)
cx q[7], q[4];
rz(1.1781) q[4];
cx q[7], q[4];

// Edge 7-9 (capacity 6)
cx q[7], q[9];
rz(1.1781) q[9];
cx q[7], q[9];

// Edge 8-1 (capacity 3)
cx q[8], q[1];
rz(0.5890) q[1];
cx q[8], q[1];

// Edge 8-9 (capacity 3)
cx q[8], q[9];
rz(0.5890) q[9];
cx q[8], q[9];

// Layer 2 - Mixer and Cost Hamiltonians
// Mixer terms
rz(0.5236) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.5236) q[3];
rz(0.5236) q[4];
rz(0.5236) q[5];
rz(0.5236) q[6];
rz(0.5236) q[7];
rz(0.5236) q[8];
rz(0.5236) q[9];

// Cost Hamiltonian terms (repeated with optimized parameters)
cx q[0], q[1];
rz(0.2618) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];

cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.6545) q[6];
cx q[1], q[6];

cx q[1], q[8];
rz(0.2618) q[8];
cx q[1], q[8];

cx q[2], q[3];
rz(0.7854) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.1309) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.6545) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.2618) q[6];
cx q[2], q[6];

cx q[2], q[9];
rz(0.2618) q[9];
cx q[2], q[9];

cx q[3], q[7];
rz(0.6545) q[7];
cx q[3], q[7];

cx q[4], q[1];
rz(0.7854) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.2618) q[2];
cx q[4], q[2];

cx q[4], q[3];
rz(0.7854) q[3];
cx q[4], q[3];

cx q[4], q[6];
rz(0.2618) q[6];
cx q[4], q[6];

cx q[4], q[7];
rz(0.3927) q[7];
cx q[4], q[7];

cx q[5], q[1];
rz(0.3927) q[1];
cx q[5], q[1];

cx q[5], q[6];
rz(0.6545) q[6];
cx q[5], q[6];

cx q[5], q[7];
rz(0.3927) q[7];
cx q[5], q[7];

cx q[6], q[1];
rz(0.5236) q[1];
cx q[6], q[1];

cx q[6], q[2];
rz(0.2618) q[2];
cx q[6], q[2];

cx q[6], q[7];
rz(0.7854) q[7];
cx q[6], q[7];

cx q[6], q[8];
rz(0.5236) q[8];
cx q[6], q[8];

cx q[7], q[2];
rz(0.6545) q[2];
cx q[7], q[2];

cx q[7], q[4];
rz(0.7854) q[4];
cx q[7], q[4];

cx q[7], q[9];
rz(0.7854) q[9];
cx q[7], q[9];

cx q[8], q[1];
rz(0.3927) q[1];
cx q[8], q[1];

cx q[8], q[9];
rz(0.3927) q[9];
cx q[8], q[9];

// Layer 3 - Mixer and Cost Hamiltonians
// Mixer terms
rz(0.3491) q[0];
rz(0.3491) q[1];
rz(0.3491) q[2];
rz(0.3491) q[3];
rz(0.3491) q[4];
rz(0.3491) q[5];
rz(0.3491) q[6];
rz(0.3491) q[7];
rz(0.3491) q[8];
rz(0.3491) q[9];

// Cost Hamiltonian terms (repeated with optimized parameters)
cx q[0], q[1];
rz(0.1745) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.3491) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.2618) q[3];
cx q[0], q[3];

cx q[0], q[6];
rz(0.2618) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.2618) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.4363) q[6];
cx q[1], q[6];

cx q[1], q[8];
rz(0.1745) q[8];
cx q[1], q[8];

cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.0873) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.4363) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.1745) q[6];
cx q[2], q[6];

cx q[2], q[9];
rz(0.1745) q[9];
cx q[2], q[9];

cx q[3], q[7];
rz(0.4363) q[7];
cx q[3], q[7];

cx q[4], q[1];
rz(0.5236) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(0.1745) q[2];
cx q[4], q[2];

cx q[4], q[3];
rz(0.5236) q[3];
cx q[4], q[3];

cx q[4], q[6];
rz(0.1745) q[6];
cx q[4], q[6];

cx q[4], q[7];
rz(0.2618) q[7];
cx q[4], q[7];

cx q[5], q[1];
rz(0.2618) q[1];
cx q[5], q[1];

cx q[5], q[6];
rz(0.4363) q[6];
cx q[5], q[6];

cx q[5], q[7];
rz(0.2618) q[7];
cx q[5], q[7];

cx q[6], q[1];
rz(0.3491) q[1];
cx q[6], q[1];

cx q[6], q[2];
rz(0.1745) q[2];
cx q[6], q[2];

cx q[6], q[7];
rz(0.5236) q[7];
cx q[6], q[7];

cx q[6], q[8];
rz(0.3491) q[8];
cx q[6], q[8];

cx q[7], q[2];
rz(0.4363) q[2];
cx q[7], q[2];

cx q[7], q[4];
rz(0.5236) q[4];
cx q[7], q[4];

cx q[7], q[9];
rz(0.5236) q[9];
cx q[7], q[9];

cx q[8], q[1];
rz(0.2618) q[1];
cx q[8], q[1];

cx q[8], q[9];
rz(0.2618) q[9];
cx q[8], q[9];

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
c[9] = measure q[9];