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

// Edge interactions for layer 1
// Edge 0-4
cx q[0], q[4];
rz(0.2145) q[4];
cx q[0], q[4];

// Edge 0-5
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];

// Edge 1-2
cx q[1], q[2];
rz(0.1763) q[2];
cx q[1], q[2];

// Edge 1-3
cx q[1], q[3];
rz(0.1921) q[3];
cx q[1], q[3];

// Edge 2-3
cx q[2], q[3];
rz(0.1542) q[3];
cx q[2], q[3];

// Edge 2-4
cx q[2], q[4];
rz(0.1689) q[4];
cx q[2], q[4];

// Edge 2-5
cx q[2], q[5];
rz(0.1824) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.2037) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(0.1476) q[4];
cx q[3], q[4];

// Edge 3-5
cx q[3], q[5];
rz(0.1618) q[5];
cx q[3], q[5];

// Edge 3-6
cx q[3], q[6];
rz(0.1892) q[6];
cx q[3], q[6];

// Mixer layer 1
rx(0.3247) q[0];
rx(0.3129) q[1];
rx(0.2984) q[2];
rx(0.3056) q[3];
rx(0.2913) q[4];
rx(0.2837) q[5];
rx(0.2765) q[6];
rx(0.2678) q[7];
rx(0.2591) q[8];
rx(0.2514) q[9];
rx(0.2437) q[10];

// Layer 2: Parameterized rotations
// Edge interactions for layer 2
cx q[0], q[4];
rz(0.1876) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.1732) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.1541) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1684) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.1348) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.1476) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.1593) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.1781) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.1291) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.1414) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.1654) q[6];
cx q[3], q[6];

// Mixer layer 2
rx(0.2839) q[0];
rx(0.2736) q[1];
rx(0.2609) q[2];
rx(0.2672) q[3];
rx(0.2547) q[4];
rx(0.2481) q[5];
rx(0.2417) q[6];
rx(0.2341) q[7];
rx(0.2265) q[8];
rx(0.2198) q[9];
rx(0.2131) q[10];

// Layer 3: Parameterized rotations
// Edge interactions for layer 3
cx q[0], q[4];
rz(0.1641) q[4];
cx q[0], q[4];

cx q[0], q[5];
rz(0.1515) q[5];
cx q[0], q[5];

cx q[1], q[2];
rz(0.1348) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.1473) q[3];
cx q[1], q[3];

cx q[2], q[3];
rz(0.1179) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.1291) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.1393) q[5];
cx q[2], q[5];

cx q[2], q[6];
rz(0.1558) q[6];
cx q[2], q[6];

cx q[3], q[4];
rz(0.1129) q[4];
cx q[3], q[4];

cx q[3], q[5];
rz(0.1237) q[5];
cx q[3], q[5];

cx q[3], q[6];
rz(0.1447) q[6];
cx q[3], q[6];

// Final mixer layer
rx(0.2484) q[0];
rx(0.2393) q[1];
rx(0.2282) q[2];
rx(0.2337) q[3];
rx(0.2228) q[4];
rx(0.2170) q[5];
rx(0.2114) q[6];
rx(0.2047) q[7];
rx(0.1981) q[8];
rx(0.1923) q[9];
rx(0.1864) q[10];

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