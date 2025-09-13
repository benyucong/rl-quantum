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

// First QAOA layer - Problem Hamiltonian
// Edge (0,3) with capacity 3
cx q[0], q[3];
rz(0.6) q[3];
cx q[0], q[3];

// Edge (0,4) with capacity 1
cx q[0], q[4];
rz(0.2) q[4];
cx q[0], q[4];

// Edge (0,5) with capacity 4
cx q[0], q[5];
rz(0.8) q[5];
cx q[0], q[5];

// Edge (1,2) with capacity 2
cx q[1], q[2];
rz(0.4) q[2];
cx q[1], q[2];

// Edge (1,5) with capacity 3
cx q[1], q[5];
rz(0.6) q[5];
cx q[1], q[5];

// Edge (2,6) with capacity 1
cx q[2], q[6];
rz(0.2) q[6];
cx q[2], q[6];

// Edge (3,5) with capacity 1
cx q[3], q[5];
rz(0.2) q[5];
cx q[3], q[5];

// Edge (3,9) with capacity 2
cx q[3], q[9];
rz(0.4) q[9];
cx q[3], q[9];

// Edge (4,2) with capacity 4
cx q[4], q[2];
rz(0.8) q[2];
cx q[4], q[2];

// Edge (4,3) with capacity 2
cx q[4], q[3];
rz(0.4) q[3];
cx q[4], q[3];

// Edge (4,7) with capacity 1
cx q[4], q[7];
rz(0.2) q[7];
cx q[4], q[7];

// Edge (5,2) with capacity 1
cx q[5], q[2];
rz(0.2) q[2];
cx q[5], q[2];

// Edge (6,1) with capacity 4
cx q[6], q[1];
rz(0.8) q[1];
cx q[6], q[1];

// Edge (6,2) with capacity 5
cx q[6], q[2];
rz(1.0) q[2];
cx q[6], q[2];

// Edge (7,1) with capacity 1
cx q[7], q[1];
rz(0.2) q[1];
cx q[7], q[1];

// Edge (7,4) with capacity 3
cx q[7], q[4];
rz(0.6) q[4];
cx q[7], q[4];

// Edge (7,5) with capacity 4
cx q[7], q[5];
rz(0.8) q[5];
cx q[7], q[5];

// Edge (8,4) with capacity 4
cx q[8], q[4];
rz(0.8) q[4];
cx q[8], q[4];

// Edge (8,6) with capacity 2
cx q[8], q[6];
rz(0.4) q[6];
cx q[8], q[6];

// Edge (8,7) with capacity 6
cx q[8], q[7];
rz(1.2) q[7];
cx q[8], q[7];

// First QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.7854) q[0];
h q[0];
h q[1];
rz(0.7854) q[1];
h q[1];
h q[2];
rz(0.7854) q[2];
h q[2];
h q[3];
rz(0.7854) q[3];
h q[3];
h q[4];
rz(0.7854) q[4];
h q[4];
h q[5];
rz(0.7854) q[5];
h q[5];
h q[6];
rz(0.7854) q[6];
h q[6];
h q[7];
rz(0.7854) q[7];
h q[7];
h q[8];
rz(0.7854) q[8];
h q[8];
h q[9];
rz(0.7854) q[9];
h q[9];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,3) with capacity 3
cx q[0], q[3];
rz(0.6) q[3];
cx q[0], q[3];

// Edge (0,4) with capacity 1
cx q[0], q[4];
rz(0.2) q[4];
cx q[0], q[4];

// Edge (0,5) with capacity 4
cx q[0], q[5];
rz(0.8) q[5];
cx q[0], q[5];

// Edge (1,2) with capacity 2
cx q[1], q[2];
rz(0.4) q[2];
cx q[1], q[2];

// Edge (1,5) with capacity 3
cx q[1], q[5];
rz(0.6) q[5];
cx q[1], q[5];

// Edge (2,6) with capacity 1
cx q[2], q[6];
rz(0.2) q[6];
cx q[2], q[6];

// Edge (3,5) with capacity 1
cx q[3], q[5];
rz(0.2) q[5];
cx q[3], q[5];

// Edge (3,9) with capacity 2
cx q[3], q[9];
rz(0.4) q[9];
cx q[3], q[9];

// Edge (4,2) with capacity 4
cx q[4], q[2];
rz(0.8) q[2];
cx q[4], q[2];

// Edge (4,3) with capacity 2
cx q[4], q[3];
rz(0.4) q[3];
cx q[4], q[3];

// Edge (4,7) with capacity 1
cx q[4], q[7];
rz(0.2) q[7];
cx q[4], q[7];

// Edge (5,2) with capacity 1
cx q[5], q[2];
rz(0.2) q[2];
cx q[5], q[2];

// Edge (6,1) with capacity 4
cx q[6], q[1];
rz(0.8) q[1];
cx q[6], q[1];

// Edge (6,2) with capacity 5
cx q[6], q[2];
rz(1.0) q[2];
cx q[6], q[2];

// Edge (7,1) with capacity 1
cx q[7], q[1];
rz(0.2) q[1];
cx q[7], q[1];

// Edge (7,4) with capacity 3
cx q[7], q[4];
rz(0.6) q[4];
cx q[7], q[4];

// Edge (7,5) with capacity 4
cx q[7], q[5];
rz(0.8) q[5];
cx q[7], q[5];

// Edge (8,4) with capacity 4
cx q[8], q[4];
rz(0.8) q[4];
cx q[8], q[4];

// Edge (8,6) with capacity 2
cx q[8], q[6];
rz(0.4) q[6];
cx q[8], q[6];

// Edge (8,7) with capacity 6
cx q[8], q[7];
rz(1.2) q[7];
cx q[8], q[7];

// Second QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.7854) q[0];
h q[0];
h q[1];
rz(0.7854) q[1];
h q[1];
h q[2];
rz(0.7854) q[2];
h q[2];
h q[3];
rz(0.7854) q[3];
h q[3];
h q[4];
rz(0.7854) q[4];
h q[4];
h q[5];
rz(0.7854) q[5];
h q[5];
h q[6];
rz(0.7854) q[6];
h q[6];
h q[7];
rz(0.7854) q[7];
h q[7];
h q[8];
rz(0.7854) q[8];
h q[8];
h q[9];
rz(0.7854) q[9];
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