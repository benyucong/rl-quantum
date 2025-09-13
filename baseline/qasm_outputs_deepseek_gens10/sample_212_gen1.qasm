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

// First QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];

// First QAOA layer - Problem Hamiltonian
// Edge (0,3) with capacity 6
cx q[0], q[3];
rz(0.5236) q[3];
cx q[0], q[3];

// Edge (0,5) with capacity 5
cx q[0], q[5];
rz(0.4363) q[5];
cx q[0], q[5];

// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.0873) q[6];
cx q[0], q[6];

// Edge (1,2) with capacity 7
cx q[1], q[2];
rz(0.6109) q[2];
cx q[1], q[2];

// Edge (2,1) with capacity 1
cx q[2], q[1];
rz(0.0873) q[1];
cx q[2], q[1];

// Edge (2,3) with capacity 1
cx q[2], q[3];
rz(0.0873) q[3];
cx q[2], q[3];

// Edge (4,2) with capacity 3
cx q[4], q[2];
rz(0.2618) q[2];
cx q[4], q[2];

// Edge (4,3) with capacity 2
cx q[4], q[3];
rz(0.1745) q[3];
cx q[4], q[3];

// Edge (5,1) with capacity 1
cx q[5], q[1];
rz(0.0873) q[1];
cx q[5], q[1];

// Edge (5,2) with capacity 2
cx q[5], q[2];
rz(0.1745) q[2];
cx q[5], q[2];

// Edge (5,4) with capacity 5
cx q[5], q[4];
rz(0.4363) q[4];
cx q[5], q[4];

// Second QAOA layer - Mixer Hamiltonian
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
h q[6];
rz(1.5708) q[6];
h q[6];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,3) with capacity 6
cx q[0], q[3];
rz(1.0472) q[3];
cx q[0], q[3];

// Edge (0,5) with capacity 5
cx q[0], q[5];
rz(0.8727) q[5];
cx q[0], q[5];

// Edge (0,6) with capacity 1
cx q[0], q[6];
rz(0.1745) q[6];
cx q[0], q[6];

// Edge (1,2) with capacity 7
cx q[1], q[2];
rz(1.2217) q[2];
cx q[1], q[2];

// Edge (2,1) with capacity 1
cx q[2], q[1];
rz(0.1745) q[1];
cx q[2], q[1];

// Edge (2,3) with capacity 1
cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];

// Edge (4,2) with capacity 3
cx q[4], q[2];
rz(0.5236) q[2];
cx q[4], q[2];

// Edge (4,3) with capacity 2
cx q[4], q[3];
rz(0.3491) q[3];
cx q[4], q[3];

// Edge (5,1) with capacity 1
cx q[5], q[1];
rz(0.1745) q[1];
cx q[5], q[1];

// Edge (5,2) with capacity 2
cx q[5], q[2];
rz(0.3491) q[2];
cx q[5], q[2];

// Edge (5,4) with capacity 5
cx q[5], q[4];
rz(0.8727) q[4];
cx q[5], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];