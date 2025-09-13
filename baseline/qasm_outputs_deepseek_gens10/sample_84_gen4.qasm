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

// Layer 1: Problem-specific entangling gates
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.2231) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1876) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.2053) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.1924) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.1798) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.2112) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1869) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(0.2087) q[6];
cx q[4], q[6];

// Layer 1: Mixer gates
rx(0.1543) q[0];
rx(0.1628) q[1];
rx(0.1487) q[2];
rx(0.1572) q[3];
rx(0.1659) q[4];
rx(0.1514) q[5];
rx(0.1598) q[6];
rx(0.1436) q[7];
rx(0.1521) q[8];
rx(0.1607) q[9];

// Layer 2: Problem-specific entangling gates
cx q[0], q[1];
rz(0.1982) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(0.1834) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.2067) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1739) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.1902) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.1783) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.1667) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.1958) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1732) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(0.1934) q[6];
cx q[4], q[6];

// Layer 2: Mixer gates
rx(0.1429) q[0];
rx(0.1508) q[1];
rx(0.1378) q[2];
rx(0.1457) q[3];
rx(0.1537) q[4];
rx(0.1403) q[5];
rx(0.1482) q[6];
rx(0.1331) q[7];
rx(0.1410) q[8];
rx(0.1490) q[9];

// Layer 3: Problem-specific entangling gates
cx q[0], q[1];
rz(0.1836) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(0.1699) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.1919) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1613) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.1764) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.1653) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.1545) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.1814) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1605) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(0.1792) q[6];
cx q[4], q[6];

// Layer 3: Mixer gates
rx(0.1324) q[0];
rx(0.1396) q[1];
rx(0.1276) q[2];
rx(0.1349) q[3];
rx(0.1423) q[4];
rx(0.1300) q[5];
rx(0.1373) q[6];
rx(0.1233) q[7];
rx(0.1306) q[8];
rx(0.1380) q[9];

// Layer 4: Problem-specific entangling gates
cx q[0], q[1];
rz(0.1700) q[1];
cx q[0], q[1];
cx q[0], q[5];
rz(0.1574) q[5];
cx q[0], q[5];
cx q[0], q[6];
rz(0.1778) q[6];
cx q[0], q[6];
cx q[1], q[3];
rz(0.1495) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.1634) q[4];
cx q[1], q[4];
cx q[2], q[4];
rz(0.1531) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.1431) q[4];
cx q[3], q[4];
cx q[3], q[6];
rz(0.1680) q[6];
cx q[3], q[6];
cx q[4], q[5];
rz(0.1486) q[5];
cx q[4], q[5];
cx q[4], q[6];
rz(0.1660) q[6];
cx q[4], q[6];

// Layer 4: Mixer gates
rx(0.1226) q[0];
rx(0.1293) q[1];
rx(0.1182) q[2];
rx(0.1249) q[3];
rx(0.1317) q[4];
rx(0.1204) q[5];
rx(0.1271) q[6];
rx(0.1142) q[7];
rx(0.1209) q[8];
rx(0.1278) q[9];

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