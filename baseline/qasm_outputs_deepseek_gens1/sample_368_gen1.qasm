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
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1987) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2231) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2059) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1923) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2178) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2014) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1896) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.2082) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1937) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1851) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.2119) q[4];
cx q[3], q[4];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4327) q[0];
h q[0];
h q[1];
rz(0.4327) q[1];
h q[1];
h q[2];
rz(0.4327) q[2];
h q[2];
h q[3];
rz(0.4327) q[3];
h q[3];
h q[4];
rz(0.4327) q[4];
h q[4];
h q[5];
rz(0.4327) q[5];
h q[5];
h q[6];
rz(0.4327) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1842) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.2067) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1908) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1781) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2019) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1865) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1756) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1929) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1794) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1714) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1963) q[4];
cx q[3], q[4];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4012) q[0];
h q[0];
h q[1];
rz(0.4012) q[1];
h q[1];
h q[2];
rz(0.4012) q[2];
h q[2];
h q[3];
rz(0.4012) q[3];
h q[3];
h q[4];
rz(0.4012) q[4];
h q[4];
h q[5];
rz(0.4012) q[5];
h q[5];
h q[6];
rz(0.4012) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.1706) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1915) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.1767) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.1650) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.1871) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.1728) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1626) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1787) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.1662) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1588) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.1818) q[4];
cx q[3], q[4];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3716) q[0];
h q[0];
h q[1];
rz(0.3716) q[1];
h q[1];
h q[2];
rz(0.3716) q[2];
h q[2];
h q[3];
rz(0.3716) q[3];
h q[3];
h q[4];
rz(0.3716) q[4];
h q[4];
h q[5];
rz(0.3716) q[5];
h q[5];
h q[6];
rz(0.3716) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];