OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;
// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
// First layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
// First layer - Problem Hamiltonian
// Edge (0,2) with capacity 5
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];
// Edge (0,3) with capacity 1
cx q[0], q[3];
rz(0.0785) q[3];
cx q[0], q[3];
// Edge (1,2) with capacity 1
cx q[1], q[2];
rz(0.0785) q[2];
cx q[1], q[2];
// Edge (1,3) with capacity 6
cx q[1], q[3];
rz(0.4712) q[3];
cx q[1], q[3];
// Second layer - Mixer Hamiltonian
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
// Second layer - Problem Hamiltonian
// Edge (0,2) with capacity 5
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];
// Edge (0,3) with capacity 1
cx q[0], q[3];
rz(0.0785) q[3];
cx q[0], q[3];
// Edge (1,2) with capacity 1
cx q[1], q[2];
rz(0.0785) q[2];
cx q[1], q[2];
// Edge (1,3) with capacity 6
cx q[1], q[3];
rz(0.4712) q[3];
cx q[1], q[3];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];