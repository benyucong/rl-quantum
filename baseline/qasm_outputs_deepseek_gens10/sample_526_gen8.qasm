OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Mixer and Cost Hamiltonians
// Cost terms for edges
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// Edge (0,1) - weight 7
cx q[0], q[1];
rz(0.0875) q[1];
cx q[0], q[1];

// Edge (0,5) - weight 13
cx q[0], q[5];
rz(0.1625) q[5];
cx q[0], q[5];

// Edge (0,4) - weight 13
cx q[0], q[4];
rz(0.1625) q[4];
cx q[0], q[4];

// Edge (1,2) - weight 20
cx q[1], q[2];
rz(0.2500) q[2];
cx q[1], q[2];

// Edge (1,5) - weight 14
cx q[1], q[5];
rz(0.1750) q[5];
cx q[1], q[5];

// Edge (2,3) - weight 1
cx q[2], q[3];
rz(0.0125) q[3];
cx q[2], q[3];

// Edge (3,5) - weight 17
cx q[3], q[5];
rz(0.2125) q[5];
cx q[3], q[5];

// Edge (4,5) - weight 10
cx q[4], q[5];
rz(0.1250) q[5];
cx q[4], q[5];

// Mixer layer
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 2 - Mixer and Cost Hamiltonians
// Cost terms for edges
rz(0.3927) q[0];
rz(0.3927) q[1];
rz(0.3927) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

// Edge (0,1) - weight 7
cx q[0], q[1];
rz(0.0438) q[1];
cx q[0], q[1];

// Edge (0,5) - weight 13
cx q[0], q[5];
rz(0.0813) q[5];
cx q[0], q[5];

// Edge (0,4) - weight 13
cx q[0], q[4];
rz(0.0813) q[4];
cx q[0], q[4];

// Edge (1,2) - weight 20
cx q[1], q[2];
rz(0.1250) q[2];
cx q[1], q[2];

// Edge (1,5) - weight 14
cx q[1], q[5];
rz(0.0875) q[5];
cx q[1], q[5];

// Edge (2,3) - weight 1
cx q[2], q[3];
rz(0.0063) q[3];
cx q[2], q[3];

// Edge (3,5) - weight 17
cx q[3], q[5];
rz(0.1063) q[5];
cx q[3], q[5];

// Edge (4,5) - weight 10
cx q[4], q[5];
rz(0.0625) q[5];
cx q[4], q[5];

// Mixer layer
rx(0.7854) q[0];
rx(0.7854) q[1];
rx(0.7854) q[2];
rx(0.7854) q[3];
rx(0.7854) q[4];
rx(0.7854) q[5];
rx(0.7854) q[6];
rx(0.7854) q[7];

// Layer 3 - Final cost Hamiltonian
// Cost terms for edges
rz(0.1963) q[0];
rz(0.1963) q[1];
rz(0.1963) q[2];
rz(0.1963) q[3];
rz(0.1963) q[4];
rz(0.1963) q[5];
rz(0.1963) q[6];
rz(0.1963) q[7];

// Edge (0,1) - weight 7
cx q[0], q[1];
rz(0.0219) q[1];
cx q[0], q[1];

// Edge (0,5) - weight 13
cx q[0], q[5];
rz(0.0406) q[5];
cx q[0], q[5];

// Edge (0,4) - weight 13
cx q[0], q[4];
rz(0.0406) q[4];
cx q[0], q[4];

// Edge (1,2) - weight 20
cx q[1], q[2];
rz(0.0625) q[2];
cx q[1], q[2];

// Edge (1,5) - weight 14
cx q[1], q[5];
rz(0.0438) q[5];
cx q[1], q[5];

// Edge (2,3) - weight 1
cx q[2], q[3];
rz(0.0031) q[3];
cx q[2], q[3];

// Edge (3,5) - weight 17
cx q[3], q[5];
rz(0.0531) q[5];
cx q[3], q[5];

// Edge (4,5) - weight 10
cx q[4], q[5];
rz(0.0313) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];