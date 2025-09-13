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
h q[8];

// Layer 2 - Problem encoding with optimal parameters
// Edge (0,4) weight 10
rz(0.7854) q[0];
rz(0.7854) q[4];
cx q[0], q[8];
rz(0.3927) q[8];
cx q[0], q[8];
rz(-0.3927) q[0];
rz(-0.3927) q[4];

// Edge (0,7) weight 20
rz(1.5708) q[0];
rz(1.5708) q[7];
cx q[0], q[8];
rz(0.7854) q[8];
cx q[0], q[8];
rz(-0.7854) q[0];
rz(-0.7854) q[7];

// Edge (1,5) weight 10
rz(0.7854) q[1];
rz(0.7854) q[5];
cx q[1], q[8];
rz(0.3927) q[8];
cx q[1], q[8];
rz(-0.3927) q[1];
rz(-0.3927) q[5];

// Edge (1,4) weight 20
rz(1.5708) q[1];
rz(1.5708) q[4];
cx q[1], q[8];
rz(0.7854) q[8];
cx q[1], q[8];
rz(-0.7854) q[1];
rz(-0.7854) q[4];

// Edge (1,7) weight 14
rz(1.0996) q[1];
rz(1.0996) q[7];
cx q[1], q[8];
rz(0.5498) q[8];
cx q[1], q[8];
rz(-0.5498) q[1];
rz(-0.5498) q[7];

// Edge (2,6) weight 1
rz(0.0785) q[2];
rz(0.0785) q[6];
cx q[2], q[8];
rz(0.0393) q[8];
cx q[2], q[8];
rz(-0.0393) q[2];
rz(-0.0393) q[6];

// Edge (2,7) weight 18
rz(1.4137) q[2];
rz(1.4137) q[7];
cx q[2], q[8];
rz(0.7069) q[8];
cx q[2], q[8];
rz(-0.7069) q[2];
rz(-0.7069) q[7];

// Edge (2,4) weight 14
rz(1.0996) q[2];
rz(1.0996) q[4];
cx q[2], q[8];
rz(0.5498) q[8];
cx q[2], q[8];
rz(-0.5498) q[2];
rz(-0.5498) q[4];

// Edge (3,7) weight 5
rz(0.3927) q[3];
rz(0.3927) q[7];
cx q[3], q[8];
rz(0.1963) q[8];
cx q[3], q[8];
rz(-0.1963) q[3];
rz(-0.1963) q[7];

// Layer 3 - Mixing layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
rz(1.0472) q[8];

// Layer 4 - Final layer with optimal parameters
rz(0.5236) q[0];
rz(0.7854) q[1];
rz(0.3927) q[2];
rz(0.2618) q[3];
rz(0.6545) q[4];
rz(0.4363) q[5];
rz(0.1745) q[6];
rz(0.8727) q[7];
rz(1.3090) q[8];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

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