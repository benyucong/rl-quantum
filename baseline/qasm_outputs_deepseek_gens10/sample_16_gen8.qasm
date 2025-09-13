OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;
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
// Layer 1: Problem-specific phase separators
// Edge (0,8)
cx q[0], q[8];
rz(0.2145) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[2];
rz(0.1987) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1832) q[6];
cx q[1], q[6];
// Edge (1,8)
cx q[1], q[8];
rz(0.2056) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[4];
rz(0.1923) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1891) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1874) q[6];
cx q[2], q[6];
// Edge (2,7)
cx q[2], q[7];
rz(0.2018) q[7];
cx q[2], q[7];
// Edge (3,7)
cx q[3], q[7];
rz(0.1765) q[7];
cx q[3], q[7];
// Edge (4,5)
cx q[4], q[5];
rz(0.1689) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1723) q[6];
cx q[4], q[6];
// Edge (5,8)
cx q[5], q[8];
rz(0.1954) q[8];
cx q[5], q[8];
// Layer 1: Mixing operators
rx(0.4231) q[0];
rx(0.3987) q[1];
rx(0.4125) q[2];
rx(0.3876) q[3];
rx(0.4052) q[4];
rx(0.4018) q[5];
rx(0.3967) q[6];
rx(0.4089) q[7];
rx(0.4193) q[8];
// Layer 2: Problem-specific phase separators
// Edge (0,8)
cx q[0], q[8];
rz(0.2287) q[8];
cx q[0], q[8];
// Edge (1,2)
cx q[1], q[2];
rz(0.2114) q[2];
cx q[1], q[2];
// Edge (1,6)
cx q[1], q[6];
rz(0.1952) q[6];
cx q[1], q[6];
// Edge (1,8)
cx q[1], q[8];
rz(0.2191) q[8];
cx q[1], q[8];
// Edge (2,4)
cx q[2], q[4];
rz(0.2048) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.2013) q[5];
cx q[2], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1996) q[6];
cx q[2], q[6];
// Edge (2,7)
cx q[2], q[7];
rz(0.2149) q[7];
cx q[2], q[7];
// Edge (3,7)
cx q[3], q[7];
rz(0.1881) q[7];
cx q[3], q[7];
// Edge (4,5)
cx q[4], q[5];
rz(0.1799) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1835) q[6];
cx q[4], q[6];
// Edge (5,8)
cx q[5], q[8];
rz(0.2082) q[8];
cx q[5], q[8];
// Layer 2: Mixing operators
rx(0.4507) q[0];
rx(0.4248) q[1];
rx(0.4394) q[2];
rx(0.4129) q[3];
rx(0.4317) q[4];
rx(0.4281) q[5];
rx(0.4226) q[6];
rx(0.4356) q[7];
rx(0.4467) q[8];
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