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

// First QAOA layer
// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.125) q[6];
cx q[0], q[6];

// Edge (0,8) with capacity 2
cx q[0], q[8];
rz(0.25) q[8];
cx q[0], q[8];

// Edge (1,2) with capacity 3
cx q[1], q[2];
rz(0.375) q[2];
cx q[1], q[2];

// Edge (1,3) with capacity 1
cx q[1], q[3];
rz(0.125) q[3];
cx q[1], q[3];

// Edge (1,5) with capacity 4
cx q[1], q[5];
rz(0.5) q[5];
cx q[1], q[5];

// Edge (2,7) with capacity 2
cx q[2], q[7];
rz(0.25) q[7];
cx q[2], q[7];

// Edge (2,8) with capacity 3
cx q[2], q[8];
rz(0.375) q[8];
cx q[2], q[8];

// Edge (4,6) with capacity 1
cx q[4], q[6];
rz(0.125) q[6];
cx q[4], q[6];

// Edge (4,7) with capacity 1
cx q[4], q[7];
rz(0.125) q[7];
cx q[4], q[7];

// Edge (5,6) with capacity 2
cx q[5], q[6];
rz(0.25) q[6];
cx q[5], q[6];

// Edge (6,2) with capacity 2
cx q[6], q[2];
rz(0.25) q[2];
cx q[6], q[2];

// Edge (7,1) with capacity 1
cx q[7], q[1];
rz(0.125) q[1];
cx q[7], q[1];

// Edge (7,2) with capacity 2
cx q[7], q[2];
rz(0.25) q[2];
cx q[7], q[2];

// Edge (7,6) with capacity 1
cx q[7], q[6];
rz(0.125) q[6];
cx q[7], q[6];

// Edge (7,8) with capacity 4
cx q[7], q[8];
rz(0.5) q[8];
cx q[7], q[8];

// Mixer layer 1
h q[0];
rz(0.785) q[0];
h q[0];
h q[1];
rz(0.785) q[1];
h q[1];
h q[2];
rz(0.785) q[2];
h q[2];
h q[3];
rz(0.785) q[3];
h q[3];
h q[4];
rz(0.785) q[4];
h q[4];
h q[5];
rz(0.785) q[5];
h q[5];
h q[6];
rz(0.785) q[6];
h q[6];
h q[7];
rz(0.785) q[7];
h q[7];
h q[8];
rz(0.785) q[8];
h q[8];

// Second QAOA layer
// Repeat cost Hamiltonian with optimized parameters
cx q[0], q[6];
rz(0.225) q[6];
cx q[0], q[6];
cx q[0], q[8];
rz(0.45) q[8];
cx q[0], q[8];
cx q[1], q[2];
rz(0.675) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.225) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(0.9) q[5];
cx q[1], q[5];
cx q[2], q[7];
rz(0.45) q[7];
cx q[2], q[7];
cx q[2], q[8];
rz(0.675) q[8];
cx q[2], q[8];
cx q[4], q[6];
rz(0.225) q[6];
cx q[4], q[6];
cx q[4], q[7];
rz(0.225) q[7];
cx q[4], q[7];
cx q[5], q[6];
rz(0.45) q[6];
cx q[5], q[6];
cx q[6], q[2];
rz(0.45) q[2];
cx q[6], q[2];
cx q[7], q[1];
rz(0.225) q[1];
cx q[7], q[1];
cx q[7], q[2];
rz(0.45) q[2];
cx q[7], q[2];
cx q[7], q[6];
rz(0.225) q[6];
cx q[7], q[6];
cx q[7], q[8];
rz(0.9) q[8];
cx q[7], q[8];

// Mixer layer 2
h q[0];
rz(1.178) q[0];
h q[0];
h q[1];
rz(1.178) q[1];
h q[1];
h q[2];
rz(1.178) q[2];
h q[2];
h q[3];
rz(1.178) q[3];
h q[3];
h q[4];
rz(1.178) q[4];
h q[4];
h q[5];
rz(1.178) q[5];
h q[5];
h q[6];
rz(1.178) q[6];
h q[6];
h q[7];
rz(1.178) q[7];
h q[7];
h q[8];
rz(1.178) q[8];
h q[8];

// Third QAOA layer
// Final cost Hamiltonian with optimized parameters
cx q[0], q[6];
rz(0.337) q[6];
cx q[0], q[6];
cx q[0], q[8];
rz(0.675) q[8];
cx q[0], q[8];
cx q[1], q[2];
rz(1.012) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.337) q[3];
cx q[1], q[3];
cx q[1], q[5];
rz(1.35) q[5];
cx q[1], q[5];
cx q[2], q[7];
rz(0.675) q[7];
cx q[2], q[7];
cx q[2], q[8];
rz(1.012) q[8];
cx q[2], q[8];
cx q[4], q[6];
rz(0.337) q[6];
cx q[4], q[6];
cx q[4], q[7];
rz(0.337) q[7];
cx q[4], q[7];
cx q[5], q[6];
rz(0.675) q[6];
cx q[5], q[6];
cx q[6], q[2];
rz(0.675) q[2];
cx q[6], q[2];
cx q[7], q[1];
rz(0.337) q[1];
cx q[7], q[1];
cx q[7], q[2];
rz(0.675) q[2];
cx q[7], q[2];
cx q[7], q[6];
rz(0.337) q[6];
cx q[7], q[6];
cx q[7], q[8];
rz(1.35) q[8];
cx q[7], q[8];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];