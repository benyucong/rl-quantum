OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.7854) q[8];

// Problem-specific mixing (Layer 2)
// Edge (0,4) - weight 10
cx q[0], q[8];
rz(0.0785) q[8];
cx q[0], q[8];
cx q[4], q[8];
rz(0.0785) q[8];
cx q[4], q[8];

// Edge (0,7) - weight 20
cx q[0], q[8];
rz(0.1571) q[8];
cx q[0], q[8];
cx q[7], q[8];
rz(0.1571) q[8];
cx q[7], q[8];

// Edge (1,5) - weight 10
cx q[1], q[8];
rz(0.0785) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.0785) q[8];
cx q[5], q[8];

// Edge (1,4) - weight 20
cx q[1], q[8];
rz(0.1571) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(0.1571) q[8];
cx q[4], q[8];

// Edge (1,7) - weight 14
cx q[1], q[8];
rz(0.1099) q[8];
cx q[1], q[8];
cx q[7], q[8];
rz(0.1099) q[8];
cx q[7], q[8];

// Edge (2,6) - weight 1
cx q[2], q[8];
rz(0.0079) q[8];
cx q[2], q[8];
cx q[6], q[8];
rz(0.0079) q[8];
cx q[6], q[8];

// Edge (2,7) - weight 18
cx q[2], q[8];
rz(0.1414) q[8];
cx q[2], q[8];
cx q[7], q[8];
rz(0.1414) q[8];
cx q[7], q[8];

// Edge (2,4) - weight 14
cx q[2], q[8];
rz(0.1099) q[8];
cx q[2], q[8];
cx q[4], q[8];
rz(0.1099) q[8];
cx q[4], q[8];

// Edge (3,7) - weight 5
cx q[3], q[8];
rz(0.0393) q[8];
cx q[3], q[8];
cx q[7], q[8];
rz(0.0393) q[8];
cx q[7], q[8];

// Layer 3 - Mixing Hamiltonian
h q[0];
rz(0.3927) q[0];
h q[0];
h q[1];
rz(0.3927) q[1];
h q[1];
h q[2];
rz(0.3927) q[2];
h q[2];
h q[3];
rz(0.3927) q[3];
h q[3];
h q[4];
rz(0.3927) q[4];
h q[4];
h q[5];
rz(0.3927) q[5];
h q[5];
h q[6];
rz(0.3927) q[6];
h q[6];
h q[7];
rz(0.3927) q[7];
h q[7];
rz(0.3927) q[8];

// Layer 4 - Final mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];