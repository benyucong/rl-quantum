OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard gates
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

// Layer 1: Problem-specific phase rotations
rz(0.2145) q[0];
rz(0.1892) q[1];
rz(0.1678) q[2];
rz(0.2031) q[3];
rz(0.2257) q[4];
rz(0.1983) q[5];
rz(0.1764) q[6];
rz(0.1927) q[7];
rz(0.2089) q[8];
rz(0.1816) q[9];
rz(0.1954) q[10];

// Layer 1: Mixer operations
cx q[0], q[1];
rz(-0.1123) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-0.1087) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.1056) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.0987) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-0.1024) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.1079) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-0.1042) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(-0.0963) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-0.0998) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(-0.1011) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-0.1037) q[5];
cx q[4], q[5];

// Layer 2: Second set of phase rotations
rz(0.2318) q[0];
rz(0.2045) q[1];
rz(0.1826) q[2];
rz(0.2179) q[3];
rz(0.2405) q[4];
rz(0.2131) q[5];
rz(0.1912) q[6];
rz(0.2075) q[7];
rz(0.2237) q[8];
rz(0.1964) q[9];
rz(0.2102) q[10];

// Layer 2: Second mixer operations
cx q[0], q[1];
rz(-0.1189) q[1];
cx q[0], q[1];
cx q[0], q[4];
rz(-0.1153) q[4];
cx q[0], q[4];
cx q[0], q[5];
rz(-0.1122) q[5];
cx q[0], q[5];
cx q[1], q[2];
rz(-0.1053) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(-0.1090) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(-0.1145) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(-0.1108) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(-0.1029) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(-0.1064) q[4];
cx q[3], q[4];
cx q[3], q[5];
rz(-0.1077) q[5];
cx q[3], q[5];
cx q[4], q[5];
rz(-0.1103) q[5];
cx q[4], q[5];

// Final measurements
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