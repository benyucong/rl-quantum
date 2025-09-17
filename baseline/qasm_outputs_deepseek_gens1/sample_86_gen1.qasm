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

// Layer 2: Problem-specific phase separation
// Edge (0,4)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[4], q[7];
rz(0.2145) q[7];
cx q[4], q[7];

// Edge (0,5)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.1987) q[8];
cx q[5], q[8];

// Edge (0,6)
cx q[0], q[9];
rz(0.2312) q[9];
cx q[0], q[9];
cx q[6], q[9];
rz(0.2312) q[9];
cx q[6], q[9];

// Edge (1,2)
cx q[1], q[10];
rz(0.1876) q[10];
cx q[1], q[10];
cx q[2], q[10];
rz(0.1876) q[10];
cx q[2], q[10];

// Edge (1,3)
cx q[1], q[7];
rz(0.2053) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(0.2053) q[7];
cx q[3], q[7];

// Edge (1,4)
cx q[1], q[8];
rz(0.1924) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(0.1924) q[8];
cx q[4], q[8];

// Edge (2,4)
cx q[2], q[9];
rz(0.2231) q[9];
cx q[2], q[9];
cx q[4], q[9];
rz(0.2231) q[9];
cx q[4], q[9];

// Edge (2,6)
cx q[2], q[10];
rz(0.2098) q[10];
cx q[2], q[10];
cx q[6], q[10];
rz(0.2098) q[10];
cx q[6], q[10];

// Edge (3,4)
cx q[3], q[8];
rz(0.2179) q[8];
cx q[3], q[8];
cx q[4], q[8];
rz(0.2179) q[8];
cx q[4], q[8];

// Edge (3,5)
cx q[3], q[9];
rz(0.1952) q[9];
cx q[3], q[9];
cx q[5], q[9];
rz(0.1952) q[9];
cx q[5], q[9];

// Edge (5,6)
cx q[5], q[10];
rz(0.2016) q[10];
cx q[5], q[10];
cx q[6], q[10];
rz(0.2016) q[10];
cx q[6], q[10];

// Layer 3: Mixing layer
rx(0.1543) q[0];
rx(0.1428) q[1];
rx(0.1632) q[2];
rx(0.1489) q[3];
rx(0.1715) q[4];
rx(0.1397) q[5];
rx(0.1576) q[6];
rx(0.1651) q[7];
rx(0.1524) q[8];
rx(0.1608) q[9];
rx(0.1462) q[10];

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