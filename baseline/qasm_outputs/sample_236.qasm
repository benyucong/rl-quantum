OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1 - Initialization and first entangling
h q[0];
h q[1];
h q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 2 - First QAOA mixing
// Entangle left nodes with right nodes based on edges
cx q[0], q[3];
rz(0.7854) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];
cx q[1], q[9];
rz(1.1781) q[9];
cx q[1], q[9];
cx q[1], q[3];
rz(1.5708) q[3];
cx q[1], q[3];
cx q[2], q[5];
rz(0.7854) q[5];
cx q[2], q[5];
cx q[2], q[9];
rz(1.5708) q[9];
cx q[2], q[9];
cx q[2], q[10];
rz(1.9635) q[10];
cx q[2], q[10];
cx q[2], q[4];
rz(1.5708) q[4];
cx q[2], q[4];

// Layer 3 - Second QAOA mixing
h q[0];
h q[1];
h q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];
rx(1.5708) q[7];

// Layer 4 - Final cost Hamiltonian
rz(0.7854) q[0];
rz(0.3927) q[1];
rz(1.5708) q[2];
rz(1.5708) q[3];
rz(1.5708) q[4];
rz(0.7854) q[5];
rz(0.0) q[6];
rz(0.0) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];