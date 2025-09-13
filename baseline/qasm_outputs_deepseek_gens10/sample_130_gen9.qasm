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

// First QAOA layer - Cost Hamiltonian (edge interactions)
// Edge (0,2) with capacity 3
cx q[0], q[2];
rz(0.9425) q[2];
cx q[0], q[2];

// Edge (0,7) with capacity 1
cx q[0], q[7];
rz(0.3142) q[7];
cx q[0], q[7];

// Edge (2,4) with capacity 3
cx q[2], q[4];
rz(0.9425) q[4];
cx q[2], q[4];

// Edge (4,1) with capacity 2
cx q[4], q[1];
rz(0.6283) q[1];
cx q[4], q[1];

// Edge (4,3) with capacity 5
cx q[4], q[3];
rz(1.5708) q[3];
cx q[4], q[3];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.3142) q[5];
cx q[4], q[5];

// Edge (4,6) with capacity 5
cx q[4], q[6];
rz(1.5708) q[6];
cx q[4], q[6];

// Edge (4,7) with capacity 4
cx q[4], q[7];
rz(1.2566) q[7];
cx q[4], q[7];

// Edge (5,1) with capacity 3
cx q[5], q[1];
rz(0.9425) q[1];
cx q[5], q[1];

// Edge (6,2) with capacity 5
cx q[6], q[2];
rz(1.5708) q[2];
cx q[6], q[2];

// Edge (6,5) with capacity 3
cx q[6], q[5];
rz(0.9425) q[5];
cx q[6], q[5];

// Second QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Second QAOA layer - Cost Hamiltonian (edge interactions)
// Edge (0,2) with capacity 3
cx q[0], q[2];
rz(0.9425) q[2];
cx q[0], q[2];

// Edge (0,7) with capacity 1
cx q[0], q[7];
rz(0.3142) q[7];
cx q[0], q[7];

// Edge (2,4) with capacity 3
cx q[2], q[4];
rz(0.9425) q[4];
cx q[2], q[4];

// Edge (4,1) with capacity 2
cx q[4], q[1];
rz(0.6283) q[1];
cx q[4], q[1];

// Edge (4,3) with capacity 5
cx q[4], q[3];
rz(1.5708) q[3];
cx q[4], q[3];

// Edge (4,5) with capacity 1
cx q[4], q[5];
rz(0.3142) q[5];
cx q[4], q[5];

// Edge (4,6) with capacity 5
cx q[4], q[6];
rz(1.5708) q[6];
cx q[4], q[6];

// Edge (4,7) with capacity 4
cx q[4], q[7];
rz(1.2566) q[7];
cx q[4], q[7];

// Edge (5,1) with capacity 3
cx q[5], q[1];
rz(0.9425) q[1];
cx q[5], q[1];

// Edge (6,2) with capacity 5
cx q[6], q[2];
rz(1.5708) q[2];
cx q[6], q[2];

// Edge (6,5) with capacity 3
cx q[6], q[5];
rz(0.9425) q[5];
cx q[6], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];