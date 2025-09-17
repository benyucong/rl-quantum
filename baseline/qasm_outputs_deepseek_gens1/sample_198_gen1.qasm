OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First QAOA layer - Problem unitary
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];

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
rz(0.2251) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.2076) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1923) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.1895) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.2018) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1764) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1849) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1952) q[6];
cx q[5], q[6];

// First QAOA layer - Mixer unitary
h q[0];
rz(0.4321) q[0];
h q[0];

h q[1];
rz(0.3987) q[1];
h q[1];

h q[2];
rz(0.4156) q[2];
h q[2];

h q[3];
rz(0.3872) q[3];
h q[3];

h q[4];
rz(0.4238) q[4];
h q[4];

h q[5];
rz(0.4093) q[5];
h q[5];

h q[6];
rz(0.4015) q[6];
h q[6];

// Second QAOA layer - Problem unitary
// Edge (0,3)
cx q[0], q[3];
rz(0.1123) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.1042) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.0961) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.1187) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.1089) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1008) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.0994) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.1057) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.0925) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.0969) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1023) q[6];
cx q[5], q[6];

// Second QAOA layer - Mixer unitary
h q[0];
rz(0.2264) q[0];
h q[0];

h q[1];
rz(0.2089) q[1];
h q[1];

h q[2];
rz(0.2178) q[2];
h q[2];

h q[3];
rz(0.2029) q[3];
h q[3];

h q[4];
rz(0.2221) q[4];
h q[4];

h q[5];
rz(0.2145) q[5];
h q[5];

h q[6];
rz(0.2103) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];