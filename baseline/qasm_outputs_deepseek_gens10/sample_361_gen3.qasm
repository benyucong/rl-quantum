OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edges)
// Edge 0-1
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.2251) q[4];
cx q[0], q[4];
// Edge 0-6
cx q[0], q[6];
rz(0.1923) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(0.1839) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.2076) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.1954) q[5];
cx q[1], q[5];
// Edge 1-6
cx q[1], q[6];
rz(0.1892) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1765) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.2018) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1883) q[5];
cx q[2], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1729) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.1947) q[5];
cx q[4], q[5];
// Edge 4-6
cx q[4], q[6];
rz(0.1864) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
rx(1.8324) q[0];
rx(1.8457) q[1];
rx(1.8196) q[2];
rx(1.8571) q[3];
rx(1.8269) q[4];
rx(1.8382) q[5];
rx(1.8513) q[6];

// Layer 2 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(0.1876) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1742) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.1968) q[4];
cx q[0], q[4];
// Edge 0-6
cx q[0], q[6];
rz(0.1683) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(0.1609) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.1816) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.1709) q[5];
cx q[1], q[5];
// Edge 1-6
cx q[1], q[6];
rz(0.1655) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1544) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.1765) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1647) q[5];
cx q[2], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1512) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.1703) q[5];
cx q[4], q[5];
// Edge 4-6
cx q[4], q[6];
rz(0.1631) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.6038) q[0];
rx(1.6149) q[1];
rx(1.5921) q[2];
rx(1.6249) q[3];
rx(1.5984) q[4];
rx(1.6082) q[5];
rx(1.6196) q[6];

// Layer 3 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(0.1641) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1524) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.1722) q[4];
cx q[0], q[4];
// Edge 0-6
cx q[0], q[6];
rz(0.1472) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(0.1408) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.1589) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.1495) q[5];
cx q[1], q[5];
// Edge 1-6
cx q[1], q[6];
rz(0.1448) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1351) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.1544) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1441) q[5];
cx q[2], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1323) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.1490) q[5];
cx q[4], q[5];
// Edge 4-6
cx q[4], q[6];
rz(0.1427) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.4033) q[0];
rx(1.4131) q[1];
rx(1.3930) q[2];
rx(1.4218) q[3];
rx(1.3986) q[4];
rx(1.4072) q[5];
rx(1.4173) q[6];

// Layer 4 - Problem Hamiltonian
// Edge 0-1
cx q[0], q[1];
rz(0.1436) q[1];
cx q[0], q[1];
// Edge 0-3
cx q[0], q[3];
rz(0.1333) q[3];
cx q[0], q[3];
// Edge 0-4
cx q[0], q[4];
rz(0.1507) q[4];
cx q[0], q[4];
// Edge 0-6
cx q[0], q[6];
rz(0.1288) q[6];
cx q[0], q[6];
// Edge 1-3
cx q[1], q[3];
rz(0.1232) q[3];
cx q[1], q[3];
// Edge 1-4
cx q[1], q[4];
rz(0.1390) q[4];
cx q[1], q[4];
// Edge 1-5
cx q[1], q[5];
rz(0.1308) q[5];
cx q[1], q[5];
// Edge 1-6
cx q[1], q[6];
rz(0.1267) q[6];
cx q[1], q[6];
// Edge 2-3
cx q[2], q[3];
rz(0.1182) q[3];
cx q[2], q[3];
// Edge 2-4
cx q[2], q[4];
rz(0.1351) q[4];
cx q[2], q[4];
// Edge 2-5
cx q[2], q[5];
rz(0.1261) q[5];
cx q[2], q[5];
// Edge 3-6
cx q[3], q[6];
rz(0.1158) q[6];
cx q[3], q[6];
// Edge 4-5
cx q[4], q[5];
rz(0.1304) q[5];
cx q[4], q[5];
// Edge 4-6
cx q[4], q[6];
rz(0.1249) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
rx(1.2279) q[0];
rx(1.2364) q[1];
rx(1.2188) q[2];
rx(1.2441) q[3];
rx(1.2238) q[4];
rx(1.2313) q[5];
rx(1.2401) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];