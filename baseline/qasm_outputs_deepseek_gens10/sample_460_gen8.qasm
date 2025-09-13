OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;
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
// Layer 1: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
// Edge (0,4)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.2312) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[7];
rz(0.1876) q[7];
cx q[1], q[7];
// Edge (1,6)
cx q[1], q[9];
rz(0.2053) q[9];
cx q[1], q[9];
// Edge (2,5)
cx q[2], q[8];
rz(0.1924) q[8];
cx q[2], q[8];
// Edge (2,6)
cx q[2], q[9];
rz(0.2198) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1765) q[7];
cx q[3], q[7];
// Edge (4,5)
cx q[4], q[8];
rz(0.2031) q[8];
cx q[4], q[8];
// Edge (4,6)
cx q[4], q[9];
rz(0.2257) q[9];
cx q[4], q[9];
// Layer 1: Mixing
rx(0.1542) q[0];
rx(0.1489) q[1];
rx(0.1623) q[2];
rx(0.1437) q[3];
rx(0.1578) q[4];
rx(0.1514) q[5];
rx(0.1689) q[6];
rx(0.1395) q[7];
rx(0.1468) q[8];
rx(0.1723) q[9];
// Layer 2: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.1983) q[7];
cx q[0], q[7];
// Edge (0,4)
cx q[0], q[8];
rz(0.1842) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.2136) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[7];
rz(0.1738) q[7];
cx q[1], q[7];
// Edge (1,6)
cx q[1], q[9];
rz(0.1901) q[9];
cx q[1], q[9];
// Edge (2,5)
cx q[2], q[8];
rz(0.1782) q[8];
cx q[2], q[8];
// Edge (2,6)
cx q[2], q[9];
rz(0.2034) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1635) q[7];
cx q[3], q[7];
// Edge (4,5)
cx q[4], q[8];
rz(0.1881) q[8];
cx q[4], q[8];
// Edge (4,6)
cx q[4], q[9];
rz(0.2089) q[9];
cx q[4], q[9];
// Layer 2: Mixing
rx(0.1427) q[0];
rx(0.1381) q[1];
rx(0.1502) q[2];
rx(0.1331) q[3];
rx(0.1461) q[4];
rx(0.1402) q[5];
rx(0.1563) q[6];
rx(0.1292) q[7];
rx(0.1359) q[8];
rx(0.1595) q[9];
// Layer 3: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.1837) q[7];
cx q[0], q[7];
// Edge (0,4)
cx q[0], q[8];
rz(0.1706) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.1976) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[7];
rz(0.1610) q[7];
cx q[1], q[7];
// Edge (1,6)
cx q[1], q[9];
rz(0.1760) q[9];
cx q[1], q[9];
// Edge (2,5)
cx q[2], q[8];
rz(0.1650) q[8];
cx q[2], q[8];
// Edge (2,6)
cx q[2], q[9];
rz(0.1883) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1514) q[7];
cx q[3], q[7];
// Edge (4,5)
cx q[4], q[8];
rz(0.1742) q[8];
cx q[4], q[8];
// Edge (4,6)
cx q[4], q[9];
rz(0.1934) q[9];
cx q[4], q[9];
// Layer 3: Mixing
rx(0.1321) q[0];
rx(0.1279) q[1];
rx(0.1391) q[2];
rx(0.1233) q[3];
rx(0.1353) q[4];
rx(0.1298) q[5];
rx(0.1447) q[6];
rx(0.1196) q[7];
rx(0.1258) q[8];
rx(0.1476) q[9];
// Layer 4: Problem-specific phase separation
// Edge (0,1)
cx q[0], q[7];
rz(0.1701) q[7];
cx q[0], q[7];
// Edge (0,4)
cx q[0], q[8];
rz(0.1579) q[8];
cx q[0], q[8];
// Edge (0,6)
cx q[0], q[9];
rz(0.1828) q[9];
cx q[0], q[9];
// Edge (1,2)
cx q[1], q[7];
rz(0.1491) q[7];
cx q[1], q[7];
// Edge (1,6)
cx q[1], q[9];
rz(0.1629) q[9];
cx q[1], q[9];
// Edge (2,5)
cx q[2], q[8];
rz(0.1527) q[8];
cx q[2], q[8];
// Edge (2,6)
cx q[2], q[9];
rz(0.1743) q[9];
cx q[2], q[9];
// Edge (3,4)
cx q[3], q[7];
rz(0.1402) q[7];
cx q[3], q[7];
// Edge (4,5)
cx q[4], q[8];
rz(0.1613) q[8];
cx q[4], q[8];
// Edge (4,6)
cx q[4], q[9];
rz(0.1790) q[9];
cx q[4], q[9];
// Layer 4: Mixing
rx(0.1223) q[0];
rx(0.1184) q[1];
rx(0.1288) q[2];
rx(0.1142) q[3];
rx(0.1253) q[4];
rx(0.1202) q[5];
rx(0.1339) q[6];
rx(0.1107) q[7];
rx(0.1165) q[8];
rx(0.1366) q[9];
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