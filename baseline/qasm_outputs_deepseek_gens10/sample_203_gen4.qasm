OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Edge interactions
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.1852) q[2];
rz(0.2231) q[3];
rz(0.2068) q[4];
rz(0.1923) q[5];
rz(0.1796) q[6];

cx q[0], q[4];
rz(-0.0873) q[4];
cx q[0], q[4];

cx q[0], q[6];
rz(-0.0912) q[6];
cx q[0], q[6];

cx q[0], q[3];
rz(-0.0945) q[3];
cx q[0], q[3];

cx q[1], q[4];
rz(-0.0821) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(-0.0889) q[5];
cx q[1], q[5];

cx q[2], q[5];
rz(-0.0857) q[5];
cx q[2], q[5];

cx q[5], q[6];
rz(-0.0796) q[6];
cx q[5], q[6];

// Layer 2 - Mixing
rx(0.3421) q[0];
rx(0.3287) q[1];
rx(0.3158) q[2];
rx(0.3562) q[3];
rx(0.3419) q[4];
rx(0.3274) q[5];
rx(0.3132) q[6];

// Layer 3 - Edge interactions
rz(0.1872) q[0];
rz(0.1743) q[1];
rz(0.1628) q[2];
rz(0.1954) q[3];
rz(0.1816) q[4];
rz(0.1692) q[5];
rz(0.1579) q[6];

cx q[0], q[4];
rz(-0.0765) q[4];
cx q[0], q[4];

cx q[0], q[6];
rz(-0.0798) q[6];
cx q[0], q[6];

cx q[0], q[3];
rz(-0.0827) q[3];
cx q[0], q[3];

cx q[1], q[4];
rz(-0.0719) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(-0.0778) q[5];
cx q[1], q[5];

cx q[2], q[5];
rz(-0.0751) q[5];
cx q[2], q[5];

cx q[5], q[6];
rz(-0.0697) q[6];
cx q[5], q[6];

// Layer 4 - Final mixing
rx(0.2987) q[0];
rx(0.2874) q[1];
rx(0.2765) q[2];
rx(0.3112) q[3];
rx(0.2993) q[4];
rx(0.2878) q[5];
rx(0.2766) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];