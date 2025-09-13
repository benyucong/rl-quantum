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

// Layer 1 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1987) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.2318) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.2256) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2089) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.1923) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1857) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];

h q[1];
rz(0.3987) q[1];
h q[1];

h q[2];
rz(0.4562) q[2];
h q[2];

h q[3];
rz(0.4876) q[3];
h q[3];

h q[4];
rz(0.4123) q[4];
h q[4];

h q[5];
rz(0.3765) q[5];
h q[5];

h q[6];
rz(0.3892) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.1983) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1842) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.2147) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.2089) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1934) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.1782) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1721) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3918) q[0];
h q[0];

h q[1];
rz(0.3692) q[1];
h q[1];

h q[2];
rz(0.4226) q[2];
h q[2];

h q[3];
rz(0.4517) q[3];
h q[3];

h q[4];
rz(0.3819) q[4];
h q[4];

h q[5];
rz(0.3487) q[5];
h q[5];

h q[6];
rz(0.3604) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.1837) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.1706) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.1989) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.1934) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.1791) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.1651) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1594) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3628) q[0];
h q[0];

h q[1];
rz(0.3419) q[1];
h q[1];

h q[2];
rz(0.3913) q[2];
h q[2];

h q[3];
rz(0.4183) q[3];
h q[3];

h q[4];
rz(0.3536) q[4];
h q[4];

h q[5];
rz(0.3229) q[5];
h q[5];

h q[6];
rz(0.3337) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];