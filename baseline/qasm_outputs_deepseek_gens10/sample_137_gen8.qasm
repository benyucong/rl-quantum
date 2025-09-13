OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// First layer - Problem Hamiltonian
// Edge (0,2) with capacity 6
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

// Edge (1,3) with capacity 1
cx q[1], q[3];
rz(0.0873) q[3];
cx q[1], q[3];

// Edge (1,4) with capacity 4
cx q[1], q[4];
rz(0.3491) q[4];
cx q[1], q[4];

// Edge (2,4) with capacity 4
cx q[2], q[4];
rz(0.3491) q[4];
cx q[2], q[4];

// Edge (3,2) with capacity 3
cx q[3], q[2];
rz(0.2618) q[2];
cx q[3], q[2];

// Second layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];

// Second layer - Problem Hamiltonian
// Edge (0,2) with capacity 6
cx q[0], q[2];
rz(0.5236) q[2];
cx q[0], q[2];

// Edge (1,3) with capacity 1
cx q[1], q[3];
rz(0.0873) q[3];
cx q[1], q[3];

// Edge (1,4) with capacity 4
cx q[1], q[4];
rz(0.3491) q[4];
cx q[1], q[4];

// Edge (2,4) with capacity 4
cx q[2], q[4];
rz(0.3491) q[4];
cx q[2], q[4];

// Edge (3,2) with capacity 3
cx q[3], q[2];
rz(0.2618) q[2];
cx q[3], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];