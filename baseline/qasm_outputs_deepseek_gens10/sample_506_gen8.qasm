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

// Layer 1 - Problem Hamiltonian
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2312) q[2];
rz(0.2256) q[3];
rz(0.2431) q[4];
rz(0.2078) q[5];
rz(0.2193) q[6];

cx q[0], q[2];
rz(0.1123) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1087) q[3];
cx q[0], q[3];

cx q[1], q[4];
rz(0.1056) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.1198) q[5];
cx q[1], q[5];

cx q[2], q[4];
rz(0.1245) q[4];
cx q[2], q[4];

cx q[3], q[6];
rz(0.1167) q[6];
cx q[3], q[6];

cx q[5], q[6];
rz(0.1214) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.4321) q[0];
rx(0.4187) q[1];
rx(0.4456) q[2];
rx(0.4398) q[3];
rx(0.4512) q[4];
rx(0.4267) q[5];
rx(0.4376) q[6];

// Layer 3 - Problem Hamiltonian
rz(0.1983) q[0];
rz(0.1845) q[1];
rz(0.2134) q[2];
rz(0.2087) q[3];
rz(0.2245) q[4];
rz(0.1923) q[5];
rz(0.2034) q[6];

cx q[0], q[2];
rz(0.1045) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.1012) q[3];
cx q[0], q[3];

cx q[1], q[4];
rz(0.0987) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.1112) q[5];
cx q[1], q[5];

cx q[2], q[4];
rz(0.1156) q[4];
cx q[2], q[4];

cx q[3], q[6];
rz(0.1089) q[6];
cx q[3], q[6];

cx q[5], q[6];
rz(0.1128) q[6];
cx q[5], q[6];

// Layer 4 - Mixer Hamiltonian
rx(0.4012) q[0];
rx(0.3898) q[1];
rx(0.4134) q[2];
rx(0.4087) q[3];
rx(0.4198) q[4];
rx(0.3967) q[5];
rx(0.4067) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];