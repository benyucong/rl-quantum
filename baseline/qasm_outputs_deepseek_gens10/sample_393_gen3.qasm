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
// Edge (0,3)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.2145) q[7];
cx q[3], q[7];

// Edge (0,5)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.1987) q[8];
cx q[5], q[8];

// Edge (1,2)
cx q[1], q[9];
rz(0.2251) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.2251) q[9];
cx q[2], q[9];

// Edge (1,3)
cx q[1], q[7];
rz(0.2034) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(0.2034) q[7];
cx q[3], q[7];

// Edge (1,6)
cx q[1], q[10];
rz(0.1923) q[10];
cx q[1], q[10];
cx q[6], q[10];
rz(0.1923) q[10];
cx q[6], q[10];

// Edge (2,3)
cx q[2], q[7];
rz(0.2189) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.2189) q[7];
cx q[3], q[7];

// Edge (2,6)
cx q[2], q[10];
rz(0.2076) q[10];
cx q[2], q[10];
cx q[6], q[10];
rz(0.2076) q[10];
cx q[6], q[10];

// Edge (3,5)
cx q[3], q[8];
rz(0.2112) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(0.2112) q[8];
cx q[5], q[8];

// Edge (4,5)
cx q[4], q[8];
rz(0.1865) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.1865) q[8];
cx q[5], q[8];

// Edge (4,6)
cx q[4], q[10];
rz(0.1798) q[10];
cx q[4], q[10];
cx q[6], q[10];
rz(0.1798) q[10];
cx q[6], q[10];

// Edge (5,6)
cx q[5], q[10];
rz(0.1954) q[10];
cx q[5], q[10];
cx q[6], q[10];
rz(0.1954) q[10];
cx q[6], q[10];

// Layer 3: Mixing layer
rx(0.4231) q[0];
rx(0.4387) q[1];
rx(0.4165) q[2];
rx(0.4019) q[3];
rx(0.3872) q[4];
rx(0.4128) q[5];
rx(0.3964) q[6];
rx(0.4083) q[7];
rx(0.3941) q[8];
rx(0.4027) q[9];
rx(0.3896) q[10];

// Layer 4: Final phase separation
// Edge (0,3)
cx q[0], q[7];
rz(0.1982) q[7];
cx q[0], q[7];
cx q[3], q[7];
rz(0.1982) q[7];
cx q[3], q[7];

// Edge (0,5)
cx q[0], q[8];
rz(0.1843) q[8];
cx q[0], q[8];
cx q[5], q[8];
rz(0.1843) q[8];
cx q[5], q[8];

// Edge (1,2)
cx q[1], q[9];
rz(0.2087) q[9];
cx q[1], q[9];
cx q[2], q[9];
rz(0.2087) q[9];
cx q[2], q[9];

// Edge (1,3)
cx q[1], q[7];
rz(0.1889) q[7];
cx q[1], q[7];
cx q[3], q[7];
rz(0.1889) q[7];
cx q[3], q[7];

// Edge (1,6)
cx q[1], q[10];
rz(0.1784) q[10];
cx q[1], q[10];
cx q[6], q[10];
rz(0.1784) q[10];
cx q[6], q[10];

// Edge (2,3)
cx q[2], q[7];
rz(0.2031) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.2031) q[7];
cx q[3], q[7];

// Edge (2,6)
cx q[2], q[10];
rz(0.1927) q[10];
cx q[2], q[10];
cx q[6], q[10];
rz(0.1927) q[10];
cx q[6], q[10];

// Edge (3,5)
cx q[3], q[8];
rz(0.1958) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(0.1958) q[8];
cx q[5], q[8];

// Edge (4,5)
cx q[4], q[8];
rz(0.1732) q[8];
cx q[4], q[8];
cx q[5], q[8];
rz(0.1732) q[8];
cx q[5], q[8];

// Edge (4,6)
cx q[4], q[10];
rz(0.1669) q[10];
cx q[4], q[10];
cx q[6], q[10];
rz(0.1669) q[10];
cx q[6], q[10];

// Edge (5,6)
cx q[5], q[10];
rz(0.1812) q[10];
cx q[5], q[10];
cx q[6], q[10];
rz(0.1812) q[10];
cx q[6], q[10];

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