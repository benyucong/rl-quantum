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
rz(1.0472) q[1];
rz(1.0472) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.5236) q[5];
rz(0.7854) q[6];

// First QAOA layer - Problem Hamiltonian
// Edge (0,1) with capacity 3
cx q[0], q[1];
rz(0.9425) q[1];
cx q[0], q[1];

// Edge (1,2) with capacity 4
cx q[1], q[2];
rz(1.2566) q[2];
cx q[1], q[2];

// Edge (1,5) with capacity 5
cx q[1], q[5];
rz(1.5708) q[5];
cx q[1], q[5];

// Edge (2,6) with capacity 1
cx q[2], q[6];
rz(0.3142) q[6];
cx q[2], q[6];

// Edge (3,1) with capacity 3
cx q[3], q[1];
rz(0.9425) q[1];
cx q[3], q[1];

// Edge (3,2) with capacity 3
cx q[3], q[2];
rz(0.9425) q[2];
cx q[3], q[2];

// Edge (4,1) with capacity 4
cx q[4], q[1];
rz(1.2566) q[1];
cx q[4], q[1];

// Edge (4,3) with capacity 4
cx q[4], q[3];
rz(1.2566) q[3];
cx q[4], q[3];

// Edge (5,3) with capacity 2
cx q[5], q[3];
rz(0.6283) q[3];
cx q[5], q[3];

// Second QAOA layer - Mixer Hamiltonian
rz(0.3927) q[0];
rz(0.5236) q[1];
rz(0.5236) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.2618) q[5];
rz(0.3927) q[6];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,1) with capacity 3
cx q[0], q[1];
rz(0.4712) q[1];
cx q[0], q[1];

// Edge (1,2) with capacity 4
cx q[1], q[2];
rz(0.6283) q[2];
cx q[1], q[2];

// Edge (1,5) with capacity 5
cx q[1], q[5];
rz(0.7854) q[5];
cx q[1], q[5];

// Edge (2,6) with capacity 1
cx q[2], q[6];
rz(0.1571) q[6];
cx q[2], q[6];

// Edge (3,1) with capacity 3
cx q[3], q[1];
rz(0.4712) q[1];
cx q[3], q[1];

// Edge (3,2) with capacity 3
cx q[3], q[2];
rz(0.4712) q[2];
cx q[3], q[2];

// Edge (4,1) with capacity 4
cx q[4], q[1];
rz(0.6283) q[1];
cx q[4], q[1];

// Edge (4,3) with capacity 4
cx q[4], q[3];
rz(0.6283) q[3];
cx q[4], q[3];

// Edge (5,3) with capacity 2
cx q[5], q[3];
rz(0.3142) q[3];
cx q[5], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];