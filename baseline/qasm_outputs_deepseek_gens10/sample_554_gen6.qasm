OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;
// Layer 1
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
h q[10];
// Layer 2 - Apply cost Hamiltonian based on edge weights
// Edge (0,6): weight 9
cx q[0], q[6];
rz(0.018) q[6];
cx q[0], q[6];
// Edge (0,7): weight 17
cx q[0], q[7];
rz(0.034) q[7];
cx q[0], q[7];
// Edge (1,7): weight 2
cx q[1], q[7];
rz(0.004) q[7];
cx q[1], q[7];
// Edge (1,11): weight 18
cx q[1], q[11];
rz(0.036) q[11];
cx q[1], q[11];
// Edge (2,8): weight 10
cx q[2], q[8];
rz(0.02) q[8];
cx q[2], q[8];
// Edge (2,9): weight 17
cx q[2], q[9];
rz(0.034) q[9];
cx q[2], q[9];
// Edge (3,9): weight 6
cx q[3], q[9];
rz(0.012) q[9];
cx q[3], q[9];
// Edge (4,10): weight 5
cx q[4], q[10];
rz(0.01) q[10];
cx q[4], q[10];
// Edge (4,7): weight 13
cx q[4], q[7];
rz(0.026) q[7];
cx q[4], q[7];
// Edge (5,11): weight 6
cx q[5], q[11];
rz(0.012) q[11];
cx q[5], q[11];
// Edge (5,8): weight 18
cx q[5], q[8];
rz(0.036) q[8];
cx q[5], q[8];
// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.2) q[0];
h q[0];
h q[1];
rz(0.2) q[1];
h q[1];
h q[2];
rz(0.2) q[2];
h q[2];
h q[3];
rz(0.2) q[3];
h q[3];
h q[4];
rz(0.2) q[4];
h q[4];
h q[5];
rz(0.2) q[5];
h q[5];
h q[6];
rz(0.2) q[6];
h q[6];
h q[7];
rz(0.2) q[7];
h q[7];
h q[8];
rz(0.2) q[8];
h q[8];
h q[9];
rz(0.2) q[9];
h q[9];
h q[10];
rz(0.2) q[10];
h q[10];
h q[11];
rz(0.2) q[11];
h q[11];
// Layer 4 - Final cost Hamiltonian
// Edge (0,6): weight 9
cx q[0], q[6];
rz(0.018) q[6];
cx q[0], q[6];
// Edge (0,7): weight 17
cx q[0], q[7];
rz(0.034) q[7];
cx q[0], q[7];
// Edge (1,7): weight 2
cx q[1], q[7];
rz(0.004) q[7];
cx q[1], q[7];
// Edge (1,11): weight 18
cx q[1], q[11];
rz(0.036) q[11];
cx q[1], q[11];
// Edge (2,8): weight 10
cx q[2], q[8];
rz(0.02) q[8];
cx q[2], q[8];
// Edge (2,9): weight 17
cx q[2], q[9];
rz(0.034) q[9];
cx q[2], q[9];
// Edge (3,9): weight 6
cx q[3], q[9];
rz(0.012) q[9];
cx q[3], q[9];
// Edge (4,10): weight 5
cx q[4], q[10];
rz(0.01) q[10];
cx q[4], q[10];
// Edge (4,7): weight 13
cx q[4], q[7];
rz(0.026) q[7];
cx q[4], q[7];
// Edge (5,11): weight 6
cx q[5], q[11];
rz(0.012) q[11];
cx q[5], q[11];
// Edge (5,8): weight 18
cx q[5], q[8];
rz(0.036) q[8];
cx q[5], q[8];
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
c[10] = measure q[10];