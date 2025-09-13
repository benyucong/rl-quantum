OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];

// Layer 1 - Edge interactions
rz(0.2145) q[0];
rz(0.1832) q[1];
rz(0.1978) q[2];
rz(0.2056) q[3];
rz(0.1923) q[4];
rz(0.1897) q[5];
rz(0.2014) q[6];
rz(0.1982) q[7];
rz(0.2079) q[8];
rz(0.1951) q[9];
rz(0.2113) q[10];

// Layer 2 - Mixer operations
rx(1.428) q[0];
rx(1.392) q[1];
rx(1.405) q[2];
rx(1.417) q[3];
rx(1.401) q[4];
rx(1.398) q[5];
rx(1.412) q[6];
rx(1.409) q[7];
rx(1.421) q[8];
rx(1.407) q[9];
rx(1.425) q[10];

// Layer 3 - Capacity-weighted interactions
rz(0.2317) q[0];
rz(0.1984) q[1];
rz(0.2136) q[2];
rz(0.2221) q[3];
rz(0.2078) q[4];
rz(0.2049) q[5];
rz(0.2175) q[6];
rz(0.2141) q[7];
rz(0.2246) q[8];
rz(0.2108) q[9];
rz(0.2283) q[10];

// Layer 4 - Final mixer and source-sink constraints
rx(1.463) q[0];
rx(1.425) q[1];
rx(1.441) q[2];
rx(1.452) q[3];
rx(1.436) q[4];
rx(1.432) q[5];
rx(1.447) q[6];
rx(1.443) q[7];
rx(1.456) q[8];
rx(1.442) q[9];
rx(1.461) q[10];

// Source-sink constraint enforcement
x q[0];
x q[10];

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
c[9] = measure q[9];
c[10] = measure q[10];