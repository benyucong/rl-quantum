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

// Edge (0,2)
cx q[0], q[7];
rz(0.2145) q[7];
cx q[0], q[7];
cx q[2], q[7];
rz(0.2145) q[7];
cx q[2], q[7];

// Edge (0,3)
cx q[0], q[8];
rz(0.1987) q[8];
cx q[0], q[8];
cx q[3], q[8];
rz(0.1987) q[8];
cx q[3], q[8];

// Edge (0,4)
cx q[0], q[9];
rz(0.2251) q[9];
cx q[0], q[9];
cx q[4], q[9];
rz(0.2251) q[9];
cx q[4], q[9];

// Edge (0,5)
cx q[0], q[10];
rz(0.2318) q[10];
cx q[0], q[10];
cx q[5], q[10];
rz(0.2318) q[10];
cx q[5], q[10];

// Edge (0,6)
cx q[0], q[7];
rz(0.2432) q[7];
cx q[0], q[7];
cx q[6], q[7];
rz(0.2432) q[7];
cx q[6], q[7];

// Edge (1,5)
cx q[1], q[8];
rz(0.1876) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.1876) q[8];
cx q[5], q[8];

// Edge (1,6)
cx q[1], q[9];
rz(0.1923) q[9];
cx q[1], q[9];
cx q[6], q[9];
rz(0.1923) q[9];
cx q[6], q[9];

// Edge (3,6)
cx q[3], q[10];
rz(0.1765) q[10];
cx q[3], q[10];
cx q[6], q[10];
rz(0.1765) q[10];
cx q[6], q[10];

// Edge (4,5)
cx q[4], q[7];
rz(0.2089) q[7];
cx q[4], q[7];
cx q[5], q[7];
rz(0.2089) q[7];
cx q[5], q[7];

// Edge (4,6)
cx q[4], q[8];
rz(0.2214) q[8];
cx q[4], q[8];
cx q[6], q[8];
rz(0.2214) q[8];
cx q[6], q[8];

// Edge (5,6)
cx q[5], q[9];
rz(0.2357) q[9];
cx q[5], q[9];
cx q[6], q[9];
rz(0.2357) q[9];
cx q[6], q[9];

// Layer 2: Mixer and cost Hamiltonian
h q[0];
rz(0.4528) q[0];
h q[0];
h q[1];
rz(0.3799) q[1];
h q[1];
h q[2];
rz(0.4290) q[2];
h q[2];
h q[3];
rz(0.3752) q[3];
h q[3];
h q[4];
rz(0.4541) q[4];
h q[4];
h q[5];
rz(0.4636) q[5];
h q[5];
h q[6];
rz(0.4864) q[6];
h q[6];

// Layer 3: Final parameterized rotations
rz(0.1124) q[0];
rz(0.0950) q[1];
rz(0.1073) q[2];
rz(0.0938) q[3];
rz(0.1135) q[4];
rz(0.1159) q[5];
rz(0.1216) q[6];

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