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

// Edge interaction terms (layer 1)
// Edge 0-1
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
// Edge 0-3
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
// Edge 0-4
cx q[0], q[9];
rz(0.2251) q[9];
cx q[0], q[9];
// Edge 0-5
cx q[0], q[10];
rz(0.2318) q[10];
cx q[0], q[10];
// Edge 0-6
cx q[0], q[1];
rz(0.2083) q[1];
cx q[0], q[1];
// Edge 1-2
cx q[1], q[2];
rz(0.1924) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.2056) q[4];
cx q[1], q[4];
// Edge 2-3
cx q[2], q[3];
rz(0.1879) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.2192) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.2237) q[6];
cx q[2], q[6];
// Edge 4-6
cx q[4], q[6];
rz(0.2114) q[6];
cx q[4], q[6];

// Layer 2: Mixer and additional parameterized rotations
rx(0.1542) q[0];
rx(0.1487) q[1];
rx(0.1423) q[2];
rx(0.1398) q[3];
rx(0.1516) q[4];
rx(0.1579) q[5];
rx(0.1592) q[6];
rx(0.1621) q[7];
rx(0.1584) q[8];
rx(0.1637) q[9];
rx(0.1653) q[10];

// Edge interaction terms (layer 2)
// Edge 0-1
cx q[0], q[7];
rz(0.2087) q[7];
cx q[0], q[7];
// Edge 0-3
cx q[0], q[8];
rz(0.1932) q[8];
cx q[0], q[8];
// Edge 0-4
cx q[0], q[9];
rz(0.2189) q[9];
cx q[0], q[9];
// Edge 0-5
cx q[0], q[10];
rz(0.2254) q[10];
cx q[0], q[10];
// Edge 0-6
cx q[0], q[1];
rz(0.2021) q[1];
cx q[0], q[1];
// Edge 1-2
cx q[1], q[2];
rz(0.1869) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.1998) q[4];
cx q[1], q[4];
// Edge 2-3
cx q[2], q[3];
rz(0.1824) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.2131) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.2175) q[6];
cx q[2], q[6];
// Edge 4-6
cx q[4], q[6];
rz(0.2053) q[6];
cx q[4], q[6];

// Layer 3: Final parameterized rotations
rx(0.1498) q[0];
rx(0.1443) q[1];
rx(0.1382) q[2];
rx(0.1359) q[3];
rx(0.1472) q[4];
rx(0.1534) q[5];
rx(0.1547) q[6];
rx(0.1575) q[7];
rx(0.1539) q[8];
rx(0.1591) q[9];
rx(0.1606) q[10];

// Edge interaction terms (layer 3)
// Edge 0-1
cx q[0], q[7];
rz(0.2032) q[7];
cx q[0], q[7];
// Edge 0-3
cx q[0], q[8];
rz(0.1881) q[8];
cx q[0], q[8];
// Edge 0-4
cx q[0], q[9];
rz(0.2132) q[9];
cx q[0], q[9];
// Edge 0-5
cx q[0], q[10];
rz(0.2195) q[10];
cx q[0], q[10];
// Edge 0-6
cx q[0], q[1];
rz(0.1964) q[1];
cx q[0], q[1];
// Edge 1-2
cx q[1], q[2];
rz(0.1818) q[2];
cx q[1], q[2];
// Edge 1-4
cx q[1], q[4];
rz(0.1945) q[4];
cx q[1], q[4];
// Edge 2-3
cx q[2], q[3];
rz(0.1774) q[3];
cx q[2], q[3];
// Edge 2-5
cx q[2], q[5];
rz(0.2075) q[5];
cx q[2], q[5];
// Edge 2-6
cx q[2], q[6];
rz(0.2118) q[6];
cx q[2], q[6];
// Edge 4-6
cx q[4], q[6];
rz(0.1997) q[6];
cx q[4], q[6];

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