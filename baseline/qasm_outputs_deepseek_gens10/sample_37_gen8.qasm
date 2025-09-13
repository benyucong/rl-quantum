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

// Layer 1: Problem-specific entangling gates
// Edge (0,4)
cx q[0], q[4];
rz(0.2145) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1832) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.1765) q[3];
cx q[1], q[3];

// Edge (2,3)
cx q[2], q[3];
rz(0.1523) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1678) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1612) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1456) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1398) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1334) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.1279) q[6];
cx q[3], q[6];

// Layer 1: Mixer gates
rx(0.4231) q[0];
rx(0.3987) q[1];
rx(0.5123) q[2];
rx(0.4876) q[3];
rx(0.3765) q[4];
rx(0.3542) q[5];
rx(0.2987) q[6];
rx(0.4123) q[7];
rx(0.3876) q[8];
rx(0.3654) q[9];
rx(0.3421) q[10];

// Layer 2: Problem-specific entangling gates
// Edge (0,4)
cx q[0], q[4];
rz(0.1876) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.1734) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1598) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.1542) q[3];
cx q[1], q[3];

// Edge (2,3)
cx q[2], q[3];
rz(0.1327) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1463) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1405) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1269) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1218) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1162) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.1114) q[6];
cx q[3], q[6];

// Layer 2: Mixer gates
rx(0.3689) q[0];
rx(0.3472) q[1];
rx(0.4461) q[2];
rx(0.4248) q[3];
rx(0.3281) q[4];
rx(0.3087) q[5];
rx(0.2602) q[6];
rx(0.3591) q[7];
rx(0.3376) q[8];
rx(0.3184) q[9];
rx(0.2980) q[10];

// Layer 3: Problem-specific entangling gates
// Edge (0,4)
cx q[0], q[4];
rz(0.1635) q[4];
cx q[0], q[4];

// Edge (0,5)
cx q[0], q[5];
rz(0.1512) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1392) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.1343) q[3];
cx q[1], q[3];

// Edge (2,3)
cx q[2], q[3];
rz(0.1156) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1275) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1224) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1106) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1061) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1012) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.0971) q[6];
cx q[3], q[6];

// Layer 3: Mixer gates
rx(0.3214) q[0];
rx(0.3025) q[1];
rx(0.3887) q[2];
rx(0.3701) q[3];
rx(0.2858) q[4];
rx(0.2690) q[5];
rx(0.2267) q[6];
rx(0.3128) q[7];
rx(0.2942) q[8];
rx(0.2774) q[9];
rx(0.2596) q[10];

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