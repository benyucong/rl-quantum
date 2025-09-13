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
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1832) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.2251) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.2076) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1923) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2189) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1765) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1894) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4563) q[2];
h q[2];
h q[3];
rz(0.4872) q[3];
h q[3];
h q[4];
rz(0.3654) q[4];
h q[4];
h q[5];
rz(0.4128) q[5];
h q[5];
h q[6];
rz(0.4765) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1983) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1842) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1698) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.2087) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1924) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1782) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2029) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1635) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1756) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3982) q[0];
h q[0];
h q[1];
rz(0.3674) q[1];
h q[1];
h q[2];
rz(0.4218) q[2];
h q[2];
h q[3];
rz(0.4512) q[3];
h q[3];
h q[4];
rz(0.3387) q[4];
h q[4];
h q[5];
rz(0.3821) q[5];
h q[5];
h q[6];
rz(0.4413) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1837) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1706) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1573) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1932) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1781) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1651) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1879) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1514) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1626) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3687) q[0];
h q[0];
h q[1];
rz(0.3402) q[1];
h q[1];
h q[2];
rz(0.3905) q[2];
h q[2];
h q[3];
rz(0.4178) q[3];
h q[3];
h q[4];
rz(0.3136) q[4];
h q[4];
h q[5];
rz(0.3538) q[5];
h q[5];
h q[6];
rz(0.4086) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];