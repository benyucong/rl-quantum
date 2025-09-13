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

// Edge covering interactions - Layer 1
// Edge (0,4)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.1763) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.1921) q[10];
cx q[1], q[10];
// Edge (2,3)
cx q[2], q[3];
rz(0.1542) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1689) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1824) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.2037) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1458) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.1593) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1876) q[6];
cx q[3], q[6];

// Layer 2: Mixing and parameterized rotations
rz(0.1124) q[0];
rz(0.1087) q[1];
rz(0.1245) q[2];
rz(0.1198) q[3];
rz(0.1321) q[4];
rz(0.1267) q[5];
rz(0.1412) q[6];
rz(0.0956) q[7];
rz(0.0912) q[8];
rz(0.0874) q[9];
rz(0.0839) q[10];

// Edge covering interactions - Layer 2
// Edge (0,4)
cx q[0], q[7];
rz(0.1789) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.1654) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.1472) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.1608) q[10];
cx q[1], q[10];
// Edge (2,3)
cx q[2], q[3];
rz(0.1287) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1408) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1521) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1698) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1216) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.1329) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1564) q[6];
cx q[3], q[6];

// Layer 3: Final parameterized rotations
rz(0.0937) q[0];
rz(0.0906) q[1];
rz(0.1038) q[2];
rz(0.0999) q[3];
rz(0.1102) q[4];
rz(0.1056) q[5];
rz(0.1177) q[6];
rz(0.0797) q[7];
rz(0.0760) q[8];
rz(0.0729) q[9];
rz(0.0699) q[10];

// Edge covering interactions - Layer 3
// Edge (0,4)
cx q[0], q[7];
rz(0.1491) q[7];
cx q[0], q[7];
// Edge (0,5)
cx q[0], q[8];
rz(0.1379) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[9];
rz(0.1227) q[9];
cx q[1], q[9];
// Edge (1,3)
cx q[1], q[10];
rz(0.1340) q[10];
cx q[1], q[10];
// Edge (2,3)
cx q[2], q[3];
rz(0.1073) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1174) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1268) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1415) q[6];
cx q[2], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1014) q[4];
cx q[3], q[4];
// Edge (3,5)
cx q[3], q[5];
rz(0.1108) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1303) q[6];
cx q[3], q[6];

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