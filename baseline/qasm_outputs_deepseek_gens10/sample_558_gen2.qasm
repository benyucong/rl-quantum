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

// Layer 1 - Edge interactions with optimal parameters
rz(0.2145) q[0];
rz(0.1832) q[1];
rz(0.1567) q[2];
rz(0.1983) q[3];
rz(0.1729) q[4];
rz(0.1654) q[5];
rz(0.2076) q[6];

cx q[0], q[2];
rz(-0.1243) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(-0.0867) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0679) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(-0.0921) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(-0.0783) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(-0.0634) q[3];
cx q[1], q[3];

cx q[2], q[1];
rz(-0.0715) q[1];
cx q[2], q[1];

cx q[2], q[3];
rz(-0.0892) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.0956) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(-0.0827) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.1134) q[6];
cx q[2], q[6];

cx q[3], q[1];
rz(-0.0678) q[1];
cx q[3], q[1];

cx q[3], q[4];
rz(-0.1042) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(-0.1189) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.0963) q[6];
cx q[3], q[6];

cx q[4], q[1];
rz(-0.1087) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(-0.1256) q[2];
cx q[4], q[2];

cx q[4], q[3];
rz(-0.0914) q[3];
cx q[4], q[3];

cx q[4], q[5];
rz(-0.0832) q[5];
cx q[4], q[5];

cx q[5], q[2];
rz(-0.1079) q[2];
cx q[5], q[2];

cx q[5], q[3];
rz(-0.1224) q[3];
cx q[5], q[3];

cx q[5], q[4];
rz(-0.0758) q[4];
cx q[5], q[4];

// Layer 2 - Mixing layer
h q[0];
rz(0.2317) q[0];
h q[0];

h q[1];
rz(0.1984) q[1];
h q[1];

h q[2];
rz(0.2176) q[2];
h q[2];

h q[3];
rz(0.2049) q[3];
h q[3];

h q[4];
rz(0.1893) q[4];
h q[4];

h q[5];
rz(0.2132) q[5];
h q[5];

h q[6];
rz(0.2258) q[6];
h q[6];

// Layer 3 - Edge interactions with optimal parameters
rz(0.1834) q[0];
rz(0.1678) q[1];
rz(0.1923) q[2];
rz(0.1765) q[3];
rz(0.1589) q[4];
rz(0.1847) q[5];
rz(0.2016) q[6];

cx q[0], q[2];
rz(-0.1089) q[2];
cx q[0], q[2];

cx q[0], q[3];
rz(-0.0942) q[3];
cx q[0], q[3];

cx q[0], q[4];
rz(-0.0816) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(-0.1037) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(-0.0874) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(-0.0729) q[3];
cx q[1], q[3];

cx q[2], q[1];
rz(-0.0826) q[1];
cx q[2], q[1];

cx q[2], q[3];
rz(-0.0963) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(-0.1087) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(-0.0912) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(-0.1248) q[6];
cx q[2], q[6];

cx q[3], q[1];
rz(-0.0783) q[1];
cx q[3], q[1];

cx q[3], q[4];
rz(-0.1136) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(-0.1274) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(-0.1049) q[6];
cx q[3], q[6];

cx q[4], q[1];
rz(-0.1172) q[1];
cx q[4], q[1];

cx q[4], q[2];
rz(-0.1348) q[2];
cx q[4], q[2];

cx q[4], q[3];
rz(-0.0987) q[3];
cx q[4], q[3];

cx q[4], q[5];
rz(-0.0893) q[5];
cx q[4], q[5];

cx q[5], q[2];
rz(-0.1164) q[2];
cx q[5], q[2];

cx q[5], q[3];
rz(-0.1319) q[3];
cx q[5], q[3];

cx q[5], q[4];
rz(-0.0821) q[4];
cx q[5], q[4];

// Layer 4 - Final mixing layer
h q[0];
rz(0.2489) q[0];
h q[0];

h q[1];
rz(0.2137) q[1];
h q[1];

h q[2];
rz(0.2342) q[2];
h q[2];

h q[3];
rz(0.2198) q[3];
h q[3];

h q[4];
rz(0.2036) q[4];
h q[4];

h q[5];
rz(0.2284) q[5];
h q[5];

h q[6];
rz(0.2421) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];