OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initial Hadamard and parameterized rotations
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

// Edge interactions - Layer 1
// Edge (0,1)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.2251) q[9];
cx q[0], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.2318) q[10];
cx q[0], q[10];

// Edge (0,6)
cx q[0], q[11];
rz(0.2432) q[11];
cx q[0], q[11];

// Edge (1,2)
cx q[1], q[7];
rz(0.1876) q[7];
cx q[1], q[7];

// Edge (1,4)
cx q[1], q[9];
rz(0.1923) q[9];
cx q[1], q[9];

// Edge (2,3)
cx q[2], q[8];
rz(0.1765) q[8];
cx q[2], q[8];

// Edge (2,5)
cx q[2], q[10];
rz(0.2034) q[10];
cx q[2], q[10];

// Edge (2,6)
cx q[2], q[11];
rz(0.2189) q[11];
cx q[2], q[11];

// Edge (4,6)
cx q[4], q[11];
rz(0.1957) q[11];
cx q[4], q[11];

// Layer 2: Mixing and additional parameterized rotations
rx(0.1543) q[0];
rx(0.1421) q[1];
rx(0.1387) q[2];
rx(0.1469) q[3];
rx(0.1625) q[4];
rx(0.1582) q[5];
rx(0.1678) q[6];
rx(0.1354) q[7];
rx(0.1418) q[8];
rx(0.1492) q[9];
rx(0.1527) q[10];
rx(0.1631) q[11];

// Layer 3: Final parameterized rotations and measurement preparation
rz(0.1287) q[0];
rz(0.1214) q[1];
rz(0.1189) q[2];
rz(0.1246) q[3];
rz(0.1328) q[4];
rz(0.1295) q[5];
rz(0.1362) q[6];
rz(0.1172) q[7];
rz(0.1221) q[8];
rz(0.1268) q[9];
rz(0.1293) q[10];
rz(0.1347) q[11];

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