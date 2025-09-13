OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1: Initial Hadamard and mixing
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

// Problem Hamiltonian (edge constraints)
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
cx q[1], q[10];
rz(0.2034) q[10];
cx q[1], q[10];
cx q[3], q[10];
rz(0.2034) q[10];
cx q[3], q[10];

// Edge (1,4)
cx q[1], q[11];
rz(0.1923) q[11];
cx q[1], q[11];
cx q[4], q[11];
rz(0.1923) q[11];
cx q[4], q[11];

// Edge (1,5)
cx q[1], q[12];
rz(0.1876) q[12];
cx q[1], q[12];
cx q[5], q[12];
rz(0.1876) q[12];
cx q[5], q[12];

// Edge (2,3)
cx q[2], q[7];
rz(0.2189) q[7];
cx q[2], q[7];
cx q[3], q[7];
rz(0.2189) q[7];
cx q[3], q[7];

// Edge (2,4)
cx q[2], q[9];
rz(0.2078) q[9];
cx q[2], q[9];
cx q[4], q[9];
rz(0.2078) q[9];
cx q[4], q[9];

// Edge (2,5)
cx q[2], q[10];
rz(0.2012) q[10];
cx q[2], q[10];
cx q[5], q[10];
rz(0.2012) q[10];
cx q[5], q[10];

// Edge (3,4)
cx q[3], q[11];
rz(0.1956) q[11];
cx q[3], q[11];
cx q[4], q[11];
rz(0.1956) q[11];
cx q[4], q[11];

// Edge (4,5)
cx q[4], q[12];
rz(0.1894) q[12];
cx q[4], q[12];
cx q[5], q[12];
rz(0.1894) q[12];
cx q[5], q[12];

// Edge (4,6)
cx q[4], q[8];
rz(0.2237) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.2237) q[8];
cx q[6], q[8];

// Edge (5,6)
cx q[5], q[7];
rz(0.2211) q[7];
cx q[5], q[7];
cx q[6], q[7];
rz(0.2211) q[7];
cx q[6], q[7];

// Layer 2: Mixing Hamiltonian
h q[0];
rz(0.4123) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4056) q[2];
h q[2];
h q[3];
rz(0.3879) q[3];
h q[3];
h q[4];
rz(0.3942) q[4];
h q[4];
h q[5];
rz(0.4018) q[5];
h q[5];
h q[6];
rz(0.4231) q[6];
h q[6];
h q[7];
rz(0.3765) q[7];
h q[7];
h q[8];
rz(0.3829) q[8];
h q[8];
h q[9];
rz(0.3794) q[9];
h q[9];
h q[10];
rz(0.3857) q[10];
h q[10];
h q[11];
rz(0.3912) q[11];
h q[11];
h q[12];
rz(0.3968) q[12];
h q[12];

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