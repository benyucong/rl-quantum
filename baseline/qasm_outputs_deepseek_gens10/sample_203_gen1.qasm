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

// Layer 1 - Edge constraints
rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2053) q[2];
rz(0.1921) q[3];
rz(0.2218) q[4];
rz(0.2346) q[5];
rz(0.2079) q[6];

cx q[0], q[4];
rz(-0.0872) q[4];
cx q[0], q[4];

cx q[0], q[6];
rz(-0.0915) q[6];
cx q[0], q[6];

cx q[0], q[3];
rz(-0.0839) q[3];
cx q[0], q[3];

cx q[1], q[4];
rz(-0.0856) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(-0.0893) q[5];
cx q[1], q[5];

cx q[2], q[5];
rz(-0.0921) q[5];
cx q[2], q[5];

cx q[5], q[6];
rz(-0.0947) q[6];
cx q[5], q[6];

// Layer 2 - Mixing
h q[0];
rz(0.1567) q[0];
h q[0];

h q[1];
rz(0.1623) q[1];
h q[1];

h q[2];
rz(0.1589) q[2];
h q[2];

h q[3];
rz(0.1512) q[3];
h q[3];

h q[4];
rz(0.1684) q[4];
h q[4];

h q[5];
rz(0.1729) q[5];
h q[5];

h q[6];
rz(0.1651) q[6];
h q[6];

// Layer 3 - Edge constraints
rz(0.1983) q[0];
rz(0.1845) q[1];
rz(0.1912) q[2];
rz(0.1789) q[3];
rz(0.2067) q[4];
rz(0.2184) q[5];
rz(0.1937) q[6];

cx q[0], q[4];
rz(-0.0815) q[4];
cx q[0], q[4];

cx q[0], q[6];
rz(-0.0852) q[6];
cx q[0], q[6];

cx q[0], q[3];
rz(-0.0789) q[3];
cx q[0], q[3];

cx q[1], q[4];
rz(-0.0798) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(-0.0834) q[5];
cx q[1], q[5];

cx q[2], q[5];
rz(-0.0861) q[5];
cx q[2], q[5];

cx q[5], q[6];
rz(-0.0883) q[6];
cx q[5], q[6];

// Layer 4 - Final mixing
h q[0];
rz(0.1423) q[0];
h q[0];

h q[1];
rz(0.1476) q[1];
h q[1];

h q[2];
rz(0.1442) q[2];
h q[2];

h q[3];
rz(0.1378) q[3];
h q[3];

h q[4];
rz(0.1531) q[4];
h q[4];

h q[5];
rz(0.1574) q[5];
h q[5];

h q[6];
rz(0.1498) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];