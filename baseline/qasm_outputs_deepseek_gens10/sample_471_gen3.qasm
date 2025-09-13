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
rz(0.1892) q[1];
rz(0.2037) q[2];
rz(0.2251) q[3];
rz(0.1783) q[4];
rz(0.2218) q[5];
rz(0.2316) q[6];

// Edge interactions
cx q[0], q[1];
rz(0.0873) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.0921) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.0954) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.0836) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.0987) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.1012) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.0458) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.0472) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.0483) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(0.0491) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.0498) q[6];
cx q[2], q[6];

cx q[3], q[6];
rz(0.0514) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.0427) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(0.0526) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.4321) q[0];
rx(0.4287) q[1];
rx(0.4305) q[2];
rx(0.4338) q[3];
rx(0.4269) q[4];
rx(0.4342) q[5];
rx(0.4357) q[6];

// Layer 3 - Problem Hamiltonian
rz(0.1983) q[0];
rz(0.1746) q[1];
rz(0.1882) q[2];
rz(0.2087) q[3];
rz(0.1642) q[4];
rz(0.2051) q[5];
rz(0.2143) q[6];

// Edge interactions
cx q[0], q[1];
rz(0.0809) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(0.0852) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(0.0883) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(0.0774) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.0914) q[5];
cx q[0], q[5];

cx q[0], q[6];
rz(0.0937) q[6];
cx q[0], q[6];

cx q[1], q[3];
rz(0.0424) q[3];
cx q[1], q[3];

cx q[1], q[6];
rz(0.0437) q[6];
cx q[1], q[6];

cx q[2], q[3];
rz(0.0447) q[3];
cx q[2], q[3];

cx q[2], q[5];
rz(0.0454) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.0461) q[6];
cx q[2], q[6];

cx q[3], q[6];
rz(0.0476) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.0395) q[5];
cx q[4], q[5];

cx q[5], q[6];
rz(0.0487) q[6];
cx q[5], q[6];

// Layer 4 - Mixer Hamiltonian
rx(0.4012) q[0];
rx(0.3983) q[1];
rx(0.3998) q[2];
rx(0.4026) q[3];
rx(0.3967) q[4];
rx(0.4034) q[5];
rx(0.4048) q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];