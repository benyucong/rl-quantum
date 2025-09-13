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

// Layer 2: Problem-specific entangling gates with optimal parameters
// Edge (0,1)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.2031) q[9];
cx q[0], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.2218) q[10];
cx q[0], q[10];

// Edge (0,6)
cx q[0], q[1];
rz(0.1923) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1856) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.2079) q[5];
cx q[1], q[5];

// Edge (3,4)
cx q[3], q[4];
rz(0.1764) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1942) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1893) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.2017) q[6];
cx q[5], q[6];

// Layer 3: Mixer layer with optimal parameters
rx(1.4321) q[0];
rx(1.4187) q[1];
rx(1.4056) q[2];
rx(1.4278) q[3];
rx(1.4112) q[4];
rx(1.4395) q[5];
rx(1.4236) q[6];
rx(1.4089) q[7];
rx(1.4153) q[8];
rx(1.4217) q[9];
rx(1.4372) q[10];

// Layer 4: Final parameterized rotations
rz(0.1087) q[0];
rz(0.1154) q[1];
rz(0.1023) q[2];
rz(0.1128) q[3];
rz(0.1076) q[4];
rz(0.1192) q[5];
rz(0.1105) q[6];
rz(0.1049) q[7];
rz(0.1113) q[8];
rz(0.1137) q[9];
rz(0.1178) q[10];

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