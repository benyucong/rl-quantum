OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

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
h q[11];

// Edge interactions - Layer 1
// Edge 0-1
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge 0-4
cx q[0], q[4];
rz(0.1987) q[4];
cx q[0], q[4];

// Edge 0-6
cx q[0], q[6];
rz(0.2251) q[6];
cx q[0], q[6];

// Edge 1-4
cx q[1], q[4];
rz(0.1832) q[4];
cx q[1], q[4];

// Edge 1-6
cx q[1], q[6];
rz(0.2076) q[6];
cx q[1], q[6];

// Edge 2-3
cx q[2], q[3];
rz(0.1923) q[3];
cx q[2], q[3];

// Edge 2-5
cx q[2], q[5];
rz(0.2058) q[5];
cx q[2], q[5];

// Edge 2-6
cx q[2], q[6];
rz(0.2189) q[6];
cx q[2], q[6];

// Edge 3-4
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];

// Edge 3-6
cx q[3], q[6];
rz(0.2014) q[6];
cx q[3], q[6];

// Edge 4-5
cx q[4], q[5];
rz(0.1892) q[5];
cx q[4], q[5];

// Edge 5-6
cx q[5], q[6];
rz(0.2137) q[6];
cx q[5], q[6];

// Layer 2: Mixer and additional rotations
rz(0.1243) q[0];
rz(0.1357) q[1];
rz(0.1421) q[2];
rz(0.1289) q[3];
rz(0.1512) q[4];
rz(0.1384) q[5];
rz(0.1678) q[6];
rz(0.1156) q[7];
rz(0.1298) q[8];
rz(0.1214) q[9];
rz(0.1327) q[10];
rz(0.1189) q[11];

// Layer 3: Final parameterized rotations and measurements
rx(0.0876) q[0];
rx(0.0942) q[1];
rx(0.0915) q[2];
rx(0.0837) q[3];
rx(0.1023) q[4];
rx(0.0898) q[5];
rx(0.1134) q[6];
rx(0.0794) q[7];
rx(0.0851) q[8];
rx(0.0819) q[9];
rx(0.0883) q[10];
rx(0.0772) q[11];

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
c[11] = measure q[11];