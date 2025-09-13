OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;
// Layer 1
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
// Cost Hamiltonian for vertex cover
rz(0.2145) q[0];
rz(0.8923) q[1];
rz(0.5671) q[2];
rz(0.1032) q[3];
rz(0.0789) q[4];
rz(0.3456) q[5];
rz(0.7812) q[6];
// Edge constraints
cx q[0], q[1];
rz(0.1567) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.1892) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.2015) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.2238) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(0.1783) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.1349) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.1124) q[6];
cx q[4], q[6];
// Mixer layer 1
rx(0.4231) q[0];
rx(0.3876) q[1];
rx(0.4562) q[2];
rx(0.2987) q[3];
rx(0.2654) q[4];
rx(0.4123) q[5];
rx(0.4891) q[6];
// Layer 2
// Cost Hamiltonian for vertex cover
rz(0.1987) q[0];
rz(0.8234) q[1];
rz(0.5219) q[2];
rz(0.0945) q[3];
rz(0.0723) q[4];
rz(0.3189) q[5];
rz(0.7236) q[6];
// Edge constraints
cx q[0], q[1];
rz(0.1423) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.1738) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.1861) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.2074) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(0.1642) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.1238) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.1031) q[6];
cx q[4], q[6];
// Mixer layer 2
rx(0.3892) q[0];
rx(0.3567) q[1];
rx(0.4218) q[2];
rx(0.2745) q[3];
rx(0.2432) q[4];
rx(0.3789) q[5];
rx(0.4523) q[6];
// Layer 3
// Cost Hamiltonian for vertex cover
rz(0.1832) q[0];
rz(0.7618) q[1];
rz(0.4837) q[2];
rz(0.0871) q[3];
rz(0.0667) q[4];
rz(0.2945) q[5];
rz(0.6712) q[6];
// Edge constraints
cx q[0], q[1];
rz(0.1308) q[1];
cx q[0], q[1];
cx q[1], q[2];
rz(0.1602) q[2];
cx q[1], q[2];
cx q[1], q[5];
rz(0.1724) q[5];
cx q[1], q[5];
cx q[1], q[6];
rz(0.1927) q[6];
cx q[1], q[6];
cx q[2], q[6];
rz(0.1518) q[6];
cx q[2], q[6];
cx q[3], q[6];
rz(0.1142) q[6];
cx q[3], q[6];
cx q[4], q[6];
rz(0.0951) q[6];
cx q[4], q[6];
// Final measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];