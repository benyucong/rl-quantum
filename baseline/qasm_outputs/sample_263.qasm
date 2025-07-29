OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;
// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[4];
h q[5];
// First QAOA layer (gamma = 0.5, beta = 0.3)
// Problem unitary
cx q[0], q[1];
rz(1.0) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(1.0) q[2];
cx q[0], q[2];
cx q[0], q[5];
rz(1.0) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(1.0) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(1.0) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(1.0) q[4];
cx q[2], q[4];
// Mixer unitary
rx(0.6) q[0];
rx(0.6) q[1];
rx(0.6) q[2];
rx(0.6) q[4];
rx(0.6) q[5];
// Second QAOA layer (gamma = 0.8, beta = 0.4)
// Problem unitary
cx q[0], q[1];
rz(1.6) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(1.6) q[2];
cx q[0], q[2];
cx q[0], q[5];
rz(1.6) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(1.6) q[2];
cx q[1], q[2];
cx q[1], q[4];
rz(1.6) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(1.6) q[4];
cx q[2], q[4];
// Mixer unitary
rx(0.8) q[0];
rx(0.8) q[1];
rx(0.8) q[2];
rx(0.8) q[4];
rx(0.8) q[5];
// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[4] = measure q[4];
c[5] = measure q[5];