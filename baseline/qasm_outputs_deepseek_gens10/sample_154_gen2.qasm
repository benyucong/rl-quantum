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
rz(0.8923) q[1];
rz(0.5671) q[2];
rz(0.3789) q[3];
rz(0.6452) q[4];
rz(0.7318) q[5];
rz(0.5236) q[6];

// Edge interactions
cx q[0], q[1];
rz(0.1257) q[1];
cx q[0], q[1];

cx q[0], q[5];
rz(0.1189) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.1423) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1368) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.1395) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.1472) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.1458) q[6];
cx q[1], q[6];

cx q[2], q[4];
rz(0.1124) q[4];
cx q[2], q[4];

cx q[2], q[6];
rz(0.1197) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(0.1083) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.1156) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.1218) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.1241) q[6];
cx q[4], q[6];

cx q[5], q[6];
rz(0.1327) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3782) q[0];
h q[0];

h q[1];
rz(0.4569) q[1];
h q[1];

h q[2];
rz(0.3217) q[2];
h q[2];

h q[3];
rz(0.2894) q[3];
h q[3];

h q[4];
rz(0.4128) q[4];
h q[4];

h q[5];
rz(0.5231) q[5];
h q[5];

h q[6];
rz(0.3675) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
rz(0.1987) q[0];
rz(0.8236) q[1];
rz(0.5124) q[2];
rz(0.3452) q[3];
rz(0.5987) q[4];
rz(0.6842) q[5];
rz(0.4891) q[6];

// Edge interactions
cx q[0], q[1];
rz(0.1183) q[1];
cx q[0], q[1];

cx q[0], q[5];
rz(0.1124) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.1347) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1291) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(0.1318) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(0.1392) q[5];
cx q[1], q[5];

cx q[1], q[6];
rz(0.1378) q[6];
cx q[1], q[6];

cx q[2], q[4];
rz(0.1062) q[4];
cx q[2], q[4];

cx q[2], q[6];
rz(0.1134) q[6];
cx q[2], q[6];

cx q[3], q[5];
rz(0.1023) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.1095) q[6];
cx q[3], q[6];

cx q[4], q[5];
rz(0.1152) q[5];
cx q[4], q[5];

cx q[4], q[6];
rz(0.1174) q[6];
cx q[4], q[6];

cx q[5], q[6];
rz(0.1256) q[6];
cx q[5], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(0.3564) q[0];
h q[0];

h q[1];
rz(0.4318) q[1];
h q[1];

h q[2];
rz(0.3042) q[2];
h q[2];

h q[3];
rz(0.2736) q[3];
h q[3];

h q[4];
rz(0.3897) q[4];
h q[4];

h q[5];
rz(0.4928) q[5];
h q[5];

h q[6];
rz(0.3472) q[6];
h q[6];

// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];