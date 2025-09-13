OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
// First layer - mixing Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
// First layer - problem Hamiltonian (edge interactions)
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.6283) q[1];
cx q[0], q[1];
// Edge (1,2) weight=11
cx q[1], q[2];
rz(1.7279) q[2];
cx q[1], q[2];
// Edge (1,3) weight=20
cx q[1], q[3];
rz(3.1416) q[3];
cx q[1], q[3];
// Edge (1,5) weight=17
cx q[1], q[5];
rz(2.6704) q[5];
cx q[1], q[5];
// Edge (2,3) weight=3
cx q[2], q[3];
rz(0.4712) q[3];
cx q[2], q[3];
// Edge (2,5) weight=18
cx q[2], q[5];
rz(2.8274) q[5];
cx q[2], q[5];
// Edge (4,5) weight=10
cx q[4], q[5];
rz(1.5708) q[5];
cx q[4], q[5];
// Edge (4,6) weight=14
cx q[4], q[6];
rz(2.1991) q[6];
cx q[4], q[6];
// Second layer - mixing Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];
// Second layer - problem Hamiltonian (edge interactions)
// Edge (0,1) weight=4
cx q[0], q[1];
rz(0.6283) q[1];
cx q[0], q[1];
// Edge (1,2) weight=11
cx q[1], q[2];
rz(1.7279) q[2];
cx q[1], q[2];
// Edge (1,3) weight=20
cx q[1], q[3];
rz(3.1416) q[3];
cx q[1], q[3];
// Edge (1,5) weight=17
cx q[1], q[5];
rz(2.6704) q[5];
cx q[1], q[5];
// Edge (2,3) weight=3
cx q[2], q[3];
rz(0.4712) q[3];
cx q[2], q[3];
// Edge (2,5) weight=18
cx q[2], q[5];
rz(2.8274) q[5];
cx q[2], q[5];
// Edge (4,5) weight=10
cx q[4], q[5];
rz(1.5708) q[5];
cx q[4], q[5];
// Edge (4,6) weight=14
cx q[4], q[6];
rz(2.1991) q[6];
cx q[4], q[6];
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];