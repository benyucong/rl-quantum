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
// Edge (0,6)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.2251) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2318) q[5];
cx q[1], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1923) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.2056) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.2189) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.4367) q[1];
h q[1];
h q[2];
rz(0.3982) q[2];
h q[2];
h q[3];
rz(0.4115) q[3];
h q[3];
h q[4];
rz(0.4378) q[4];
h q[4];
h q[5];
rz(0.4636) q[5];
h q[5];
h q[6];
rz(0.4259) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1983) q[1];
cx q[0], q[1];
// Edge (0,6)
cx q[0], q[6];
rz(0.1842) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.2087) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2149) q[5];
cx q[1], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1781) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1905) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.2028) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.3921) q[0];
h q[0];
h q[1];
rz(0.4048) q[1];
h q[1];
h q[2];
rz(0.3690) q[2];
h q[2];
h q[3];
rz(0.3814) q[3];
h q[3];
h q[4];
rz(0.4057) q[4];
h q[4];
h q[5];
rz(0.4297) q[5];
h q[5];
h q[6];
rz(0.3948) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1836) q[1];
cx q[0], q[1];
// Edge (0,6)
cx q[0], q[6];
rz(0.1707) q[6];
cx q[0], q[6];
// Edge (1,4)
cx q[1], q[4];
rz(0.1933) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.1991) q[5];
cx q[1], q[5];
// Edge (2,6)
cx q[2], q[6];
rz(0.1650) q[6];
cx q[2], q[6];
// Edge (3,6)
cx q[3], q[6];
rz(0.1765) q[6];
cx q[3], q[6];
// Edge (4,6)
cx q[4], q[6];
rz(0.1879) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3632) q[0];
h q[0];
h q[1];
rz(0.3750) q[1];
h q[1];
h q[2];
rz(0.3418) q[2];
h q[2];
h q[3];
rz(0.3533) q[3];
h q[3];
h q[4];
rz(0.3759) q[4];
h q[4];
h q[5];
rz(0.3981) q[5];
h q[5];
h q[6];
rz(0.3657) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];