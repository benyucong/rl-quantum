OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and first mixing
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

// Layer 1: Problem Hamiltonian (edge constraints)
// Edge (0,3) capacity 1
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];

// Edge (0,4) capacity 1
cx q[0], q[4];
rz(0.7854) q[4];
cx q[0], q[4];

// Edge (0,7) capacity 2
cx q[0], q[7];
rz(1.5708) q[7];
cx q[0], q[7];

// Edge (1,3) capacity 1
cx q[1], q[3];
rz(0.7854) q[3];
cx q[1], q[3];

// Edge (1,8) capacity 2
cx q[1], q[8];
rz(1.5708) q[8];
cx q[1], q[8];

// Edge (1,9) capacity 1
cx q[1], q[9];
rz(0.7854) q[9];
cx q[1], q[9];

// Edge (2,1) capacity 1
cx q[2], q[1];
rz(0.7854) q[1];
cx q[2], q[1];

// Edge (3,4) capacity 2
cx q[3], q[4];
rz(1.5708) q[4];
cx q[3], q[4];

// Edge (3,6) capacity 1
cx q[3], q[6];
rz(0.7854) q[6];
cx q[3], q[6];

// Edge (3,8) capacity 2
cx q[3], q[8];
rz(1.5708) q[8];
cx q[3], q[8];

// Edge (4,3) capacity 1
cx q[4], q[3];
rz(0.7854) q[3];
cx q[4], q[3];

// Edge (4,9) capacity 1
cx q[4], q[9];
rz(0.7854) q[9];
cx q[4], q[9];

// Edge (5,7) capacity 2
cx q[5], q[7];
rz(1.5708) q[7];
cx q[5], q[7];

// Edge (5,8) capacity 2
cx q[5], q[8];
rz(1.5708) q[8];
cx q[5], q[8];

// Edge (6,3) capacity 2
cx q[6], q[3];
rz(1.5708) q[3];
cx q[6], q[3];

// Edge (6,4) capacity 1
cx q[6], q[4];
rz(0.7854) q[4];
cx q[6], q[4];

// Edge (6,5) capacity 1
cx q[6], q[5];
rz(0.7854) q[5];
cx q[6], q[5];

// Edge (7,6) capacity 1
cx q[7], q[6];
rz(0.7854) q[6];
cx q[7], q[6];

// Edge (7,8) capacity 1
cx q[7], q[8];
rz(0.7854) q[8];
cx q[7], q[8];

// Edge (8,1) capacity 1
cx q[8], q[1];
rz(0.7854) q[1];
cx q[8], q[1];

// Edge (8,4) capacity 1
cx q[8], q[4];
rz(0.7854) q[4];
cx q[8], q[4];

// Edge (8,5) capacity 2
cx q[8], q[5];
rz(1.5708) q[5];
cx q[8], q[5];

// Edge (8,7) capacity 2
cx q[8], q[7];
rz(1.5708) q[7];
cx q[8], q[7];

// Edge (8,9) capacity 1
cx q[8], q[9];
rz(0.7854) q[9];
cx q[8], q[9];

// Layer 2: Mixing Hamiltonian
h q[0];
rz(1.2566) q[0];
h q[0];
h q[1];
rz(1.2566) q[1];
h q[1];
h q[2];
rz(1.2566) q[2];
h q[2];
h q[3];
rz(1.2566) q[3];
h q[3];
h q[4];
rz(1.2566) q[4];
h q[4];
h q[5];
rz(1.2566) q[5];
h q[5];
h q[6];
rz(1.2566) q[6];
h q[6];
h q[7];
rz(1.2566) q[7];
h q[7];
h q[8];
rz(1.2566) q[8];
h q[8];
h q[9];
rz(1.2566) q[9];
h q[9];

// Layer 3: Problem Hamiltonian (repeated with optimized parameters)
// Edge constraints with optimized weights
cx q[0], q[3];
rz(0.6283) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.6283) q[4];
cx q[0], q[4];
cx q[0], q[7];
rz(1.2566) q[7];
cx q[0], q[7];
cx q[1], q[3];
rz(0.6283) q[3];
cx q[1], q[3];
cx q[1], q[8];
rz(1.2566) q[8];
cx q[1], q[8];
cx q[1], q[9];
rz(0.6283) q[9];
cx q[1], q[9];
cx q[2], q[1];
rz(0.6283) q[1];
cx q[2], q[1];
cx q[3], q[4];
rz(1.2566) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.6283) q[6];
cx q[3], q[6];
cx q[3], q[8];
rz(1.2566) q[8];
cx q[3], q[8];
cx q[4], q[3];
rz(0.6283) q[3];
cx q[4], q[3];
cx q[4], q[9];
rz(0.6283) q[9];
cx q[4], q[9];
cx q[5], q[7];
rz(1.2566) q[7];
cx q[5], q[7];
cx q[5], q[8];
rz(1.2566) q[8];
cx q[5], q[8];
cx q[6], q[3];
rz(1.2566) q[3];
cx q[6], q[3];
cx q[6], q[4];
rz(0.6283) q[4];
cx q[6], q[4];
cx q[6], q[5];
rz(0.6283) q[5];
cx q[6], q[5];
cx q[7], q[6];
rz(0.6283) q[6];
cx q[7], q[6];
cx q[7], q[8];
rz(0.6283) q[8];
cx q[7], q[8];
cx q[8], q[1];
rz(0.6283) q[1];
cx q[8], q[1];
cx q[8], q[4];
rz(0.6283) q[4];
cx q[8], q[4];
cx q[8], q[5];
rz(1.2566) q[5];
cx q[8], q[5];
cx q[8], q[7];
rz(1.2566) q[7];
cx q[8], q[7];
cx q[8], q[9];
rz(0.6283) q[9];
cx q[8], q[9];

// Layer 4: Final mixing and measurement preparation
h q[0];
rz(0.9425) q[0];
h q[0];
h q[1];
rz(0.9425) q[1];
h q[1];
h q[2];
rz(0.9425) q[2];
h q[2];
h q[3];
rz(0.9425) q[3];
h q[3];
h q[4];
rz(0.9425) q[4];
h q[4];
h q[5];
rz(0.9425) q[5];
h q[5];
h q[6];
rz(0.9425) q[6];
h q[6];
h q[7];
rz(0.9425) q[7];
h q[7];
h q[8];
rz(0.9425) q[8];
h q[8];
h q[9];
rz(0.9425) q[9];
h q[9];

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