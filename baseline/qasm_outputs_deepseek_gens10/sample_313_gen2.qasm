OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1: Initial Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem unitary for vertex cover
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
cx q[0], q[1];
rz(-1.5708) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-1.5708) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-1.5708) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-1.5708) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(-1.5708) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-1.5708) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(-1.5708) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(-1.5708) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(-1.5708) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(-1.5708) q[6];
cx q[4], q[6];

// Layer 1: Mixer unitary
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];

// Layer 2: Problem unitary
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
cx q[0], q[1];
rz(-2.3562) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-2.3562) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-2.3562) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-2.3562) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(-2.3562) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-2.3562) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(-2.3562) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(-2.3562) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(-2.3562) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(-2.3562) q[6];
cx q[4], q[6];

// Layer 2: Mixer unitary
rx(2.3562) q[0];
rx(2.3562) q[1];
rx(2.3562) q[2];
rx(2.3562) q[3];
rx(2.3562) q[4];
rx(2.3562) q[5];
rx(2.3562) q[6];

// Layer 3: Problem unitary
rz(1.5708) q[0];
rz(1.5708) q[1];
rz(1.5708) q[4];
rz(1.5708) q[5];
rz(1.5708) q[6];
cx q[0], q[1];
rz(-3.1416) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-3.1416) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-3.1416) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-3.1416) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(-3.1416) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-3.1416) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(-3.1416) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(-3.1416) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(-3.1416) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(-3.1416) q[6];
cx q[4], q[6];

// Layer 3: Mixer unitary
rx(3.1416) q[0];
rx(3.1416) q[1];
rx(3.1416) q[2];
rx(3.1416) q[3];
rx(3.1416) q[4];
rx(3.1416) q[5];
rx(3.1416) q[6];

// Layer 4: Problem unitary
rz(1.9635) q[0];
rz(1.9635) q[1];
rz(1.9635) q[4];
rz(1.9635) q[5];
rz(1.9635) q[6];
cx q[0], q[1];
rz(-3.927) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-3.927) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-3.927) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(-3.927) q[6];
cx q[0], q[6];
cx q[1], q[4];
rz(-3.927) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-3.927) q[5];
cx q[1], q[5];
cx q[2], q[3];
rz(-3.927) q[3];
cx q[2], q[3];
cx q[2], q[5];
rz(-3.927) q[5];
cx q[2], q[5];
cx q[4], q[5];
rz(-3.927) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(-3.927) q[6];
cx q[4], q[6];

// Layer 4: Mixer unitary
rx(3.927) q[0];
rx(3.927) q[1];
rx(3.927) q[2];
rx(3.927) q[3];
rx(3.927) q[4];
rx(3.927) q[5];
rx(3.927) q[6];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];