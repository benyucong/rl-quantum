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

rz(0.2145) q[0];
rz(0.1987) q[1];
rz(0.2312) q[2];
rz(0.2056) q[3];
rz(0.1923) q[4];
rz(0.2238) q[5];
rz(0.2089) q[6];
rz(0.2176) q[7];
rz(0.2014) q[8];
rz(0.2251) q[9];
rz(0.1968) q[10];
rz(0.2193) q[11];
rz(0.2072) q[12];

// Layer 1 - Problem-specific entangling gates
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[5];
cx q[3], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 2 - Parameterized rotations
rz(0.4123) q[0];
rz(0.3981) q[1];
rz(0.4256) q[2];
rz(0.4012) q[3];
rz(0.3879) q[4];
rz(0.4184) q[5];
rz(0.4035) q[6];
rz(0.4122) q[7];
rz(0.3960) q[8];
rz(0.4197) q[9];
rz(0.3914) q[10];
rz(0.4139) q[11];
rz(0.4018) q[12];

// Layer 2 - Mixer layer
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

// Layer 3 - Parameterized rotations
rz(0.6018) q[0];
rz(0.5876) q[1];
rz(0.6151) q[2];
rz(0.5907) q[3];
rz(0.5774) q[4];
rz(0.6079) q[5];
rz(0.5930) q[6];
rz(0.6017) q[7];
rz(0.5855) q[8];
rz(0.6092) q[9];
rz(0.5809) q[10];
rz(0.6034) q[11];
rz(0.5913) q[12];

// Layer 3 - Problem-specific entangling gates
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[3];
cx q[1], q[4];
cx q[1], q[6];
cx q[2], q[3];
cx q[2], q[5];
cx q[2], q[6];
cx q[3], q[5];
cx q[3], q[6];
cx q[4], q[5];
cx q[5], q[6];

// Layer 4 - Final parameterized rotations
rz(0.8124) q[0];
rz(0.7982) q[1];
rz(0.8257) q[2];
rz(0.8013) q[3];
rz(0.7880) q[4];
rz(0.8185) q[5];
rz(0.8036) q[6];
rz(0.8123) q[7];
rz(0.7961) q[8];
rz(0.8198) q[9];
rz(0.7915) q[10];
rz(0.8140) q[11];
rz(0.8019) q[12];

// Final measurements
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