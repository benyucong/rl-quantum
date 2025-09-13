OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1 - Initial Hadamard and parameterized rotations
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
h q[12];

// Layer 1 - Problem-specific entangling gates
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
rz(0.2231) q[9];
cx q[0], q[9];
// Edge (1,3)
cx q[1], q[8];
rz(0.1856) q[8];
cx q[1], q[8];
// Edge (1,4)
cx q[1], q[9];
rz(0.2103) q[9];
cx q[1], q[9];
// Edge (1,6)
cx q[1], q[11];
rz(0.1924) q[11];
cx q[1], q[11];
// Edge (2,3)
cx q[2], q[8];
rz(0.1768) q[8];
cx q[2], q[8];
// Edge (2,5)
cx q[2], q[10];
rz(0.2019) q[10];
cx q[2], q[10];
// Edge (2,6)
cx q[2], q[11];
rz(0.1842) q[11];
cx q[2], q[11];
// Edge (3,5)
cx q[3], q[10];
rz(0.1895) q[10];
cx q[3], q[10];
// Edge (3,6)
cx q[3], q[11];
rz(0.1721) q[11];
cx q[3], q[11];
// Edge (4,5)
cx q[4], q[10];
rz(0.2067) q[10];
cx q[4], q[10];
// Edge (5,6)
cx q[5], q[11];
rz(0.1798) q[11];
cx q[5], q[11];

// Layer 2 - Mixer and parameterized rotations
rx(0.4321) q[0];
rx(0.4156) q[1];
rx(0.3987) q[2];
rx(0.4213) q[3];
rx(0.4389) q[4];
rx(0.4267) q[5];
rx(0.4098) q[6];
rx(0.4123) q[7];
rx(0.3956) q[8];
rx(0.4189) q[9];
rx(0.4034) q[10];
rx(0.3867) q[11];
rx(0.4012) q[12];

// Layer 3 - Problem-specific entangling gates
// Edge (0,1)
cx q[0], q[7];
rz(0.2089) q[7];
cx q[0], q[7];
// Edge (0,3)
cx q[0], q[8];
rz(0.1932) q[8];
cx q[0], q[8];
// Edge (0,4)
cx q[0], q[9];
rz(0.2176) q[9];
cx q[0], q[9];
// Edge (1,3)
cx q[1], q[8];
rz(0.1804) q[8];
cx q[1], q[8];
// Edge (1,4)
cx q[1], q[9];
rz(0.2048) q[9];
cx q[1], q[9];
// Edge (1,6)
cx q[1], q[11];
rz(0.1871) q[11];
cx q[1], q[11];
// Edge (2,3)
cx q[2], q[8];
rz(0.1716) q[8];
cx q[2], q[8];
// Edge (2,5)
cx q[2], q[10];
rz(0.1965) q[10];
cx q[2], q[10];
// Edge (2,6)
cx q[2], q[11];
rz(0.1791) q[11];
cx q[2], q[11];
// Edge (3,5)
cx q[3], q[10];
rz(0.1843) q[10];
cx q[3], q[10];
// Edge (3,6)
cx q[3], q[11];
rz(0.1672) q[11];
cx q[3], q[11];
// Edge (4,5)
cx q[4], q[10];
rz(0.2011) q[10];
cx q[4], q[10];
// Edge (5,6)
cx q[5], q[11];
rz(0.1749) q[11];
cx q[5], q[11];

// Layer 4 - Final mixer and parameterized rotations
rx(0.4198) q[0];
rx(0.4034) q[1];
rx(0.3871) q[2];
rx(0.4092) q[3];
rx(0.4263) q[4];
rx(0.4145) q[5];
rx(0.3982) q[6];
rx(0.4008) q[7];
rx(0.3846) q[8];
rx(0.4073) q[9];
rx(0.3921) q[10];
rx(0.3759) q[11];
rx(0.3902) q[12];

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
c[11] = measure q[11];
c[12] = measure q[12];