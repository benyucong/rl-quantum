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

// First QAOA layer - Problem Hamiltonian (edge interactions)
// Edge (0,2) capacity 3
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

// Edge (0,7) capacity 5
cx q[0], q[7];
rz(0.8727) q[7];
cx q[0], q[7];

// Edge (1,2) capacity 5
cx q[1], q[2];
rz(0.8727) q[2];
cx q[1], q[2];

// Edge (1,4) capacity 1
cx q[1], q[4];
rz(0.1745) q[4];
cx q[1], q[4];

// Edge (1,7) capacity 1
cx q[1], q[7];
rz(0.1745) q[7];
cx q[1], q[7];

// Edge (2,1) capacity 3
cx q[2], q[1];
rz(0.5236) q[1];
cx q[2], q[1];

// Edge (3,5) capacity 6
cx q[3], q[5];
rz(1.0472) q[5];
cx q[3], q[5];

// Edge (3,6) capacity 2
cx q[3], q[6];
rz(0.3491) q[6];
cx q[3], q[6];

// Edge (3,8) capacity 1
cx q[3], q[8];
rz(0.1745) q[8];
cx q[3], q[8];

// Edge (4,2) capacity 7
cx q[4], q[2];
rz(1.2217) q[2];
cx q[4], q[2];

// Edge (4,6) capacity 5
cx q[4], q[6];
rz(0.8727) q[6];
cx q[4], q[6];

// Edge (6,3) capacity 1
cx q[6], q[3];
rz(0.1745) q[3];
cx q[6], q[3];

// Edge (6,5) capacity 5
cx q[6], q[5];
rz(0.8727) q[5];
cx q[6], q[5];

// Edge (7,2) capacity 1
cx q[7], q[2];
rz(0.1745) q[2];
cx q[7], q[2];

// Edge (7,4) capacity 2
cx q[7], q[4];
rz(0.3491) q[4];
cx q[7], q[4];

// Edge (7,8) capacity 7
cx q[7], q[8];
rz(1.2217) q[8];
cx q[7], q[8];

// Second QAOA layer - Mixer Hamiltonian
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
rz(1.5708) q[7];
rz(1.5708) q[8];

// Second QAOA layer - Problem Hamiltonian (edge interactions)
// Edge (0,2) capacity 3
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

// Edge (0,7) capacity 5
cx q[0], q[7];
rz(0.8727) q[7];
cx q[0], q[7];

// Edge (1,2) capacity 5
cx q[1], q[2];
rz(0.8727) q[2];
cx q[1], q[2];

// Edge (1,4) capacity 1
cx q[1], q[4];
rz(0.1745) q[4];
cx q[1], q[4];

// Edge (1,7) capacity 1
cx q[1], q[7];
rz(0.1745) q[7];
cx q[1], q[7];

// Edge (2,1) capacity 3
cx q[2], q[1];
rz(0.5236) q[1];
cx q[2], q[1];

// Edge (3,5) capacity 6
cx q[3], q[5];
rz(1.0472) q[5];
cx q[3], q[5];

// Edge (3,6) capacity 2
cx q[3], q[6];
rz(0.3491) q[6];
cx q[3], q[6];

// Edge (3,8) capacity 1
cx q[3], q[8];
rz(0.1745) q[8];
cx q[3], q[8];

// Edge (4,2) capacity 7
cx q[4], q[2];
rz(1.2217) q[2];
cx q[4], q[2];

// Edge (4,6) capacity 5
cx q[4], q[6];
rz(0.8727) q[6];
cx q[4], q[6];

// Edge (6,3) capacity 1
cx q[6], q[3];
rz(0.1745) q[3];
cx q[6], q[3];

// Edge (6,5) capacity 5
cx q[6], q[5];
rz(0.8727) q[5];
cx q[6], q[5];

// Edge (7,2) capacity 1
cx q[7], q[2];
rz(0.1745) q[2];
cx q[7], q[2];

// Edge (7,4) capacity 2
cx q[7], q[4];
rz(0.3491) q[4];
cx q[7], q[4];

// Edge (7,8) capacity 7
cx q[7], q[8];
rz(1.2217) q[8];
cx q[7], q[8];

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