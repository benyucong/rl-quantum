OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initial Hadamard and problem unitary
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Problem unitary for k-clique (k=3) with optimal parameters
// Edge interactions
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];

// Edge (0,1)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];

// Edge (0,2)
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];

// Edge (0,5)
cx q[0], q[5];
rz(0.3927) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];

// Edge (4,3)
cx q[4], q[3];
rz(0.3927) q[3];
cx q[4], q[3];

// Layer 2: Mixer unitary with optimal parameters
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];