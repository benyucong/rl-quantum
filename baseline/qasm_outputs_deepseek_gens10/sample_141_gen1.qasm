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

// Edge (1,2)
cx q[1], q[2];
rz(0.1987) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1863) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.2031) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1759) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1924) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1897) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.4236) q[0];
rx(0.4236) q[1];
rx(0.4236) q[2];
rx(0.4236) q[3];
rx(0.4236) q[4];
rx(0.4236) q[5];
rx(0.4236) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1982) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1845) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1729) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.1883) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1632) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1784) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1758) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(0.3921) q[0];
rx(0.3921) q[1];
rx(0.3921) q[2];
rx(0.3921) q[3];
rx(0.3921) q[4];
rx(0.3921) q[5];
rx(0.3921) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.1837) q[1];
cx q[0], q[1];

// Edge (1,2)
cx q[1], q[2];
rz(0.1712) q[2];
cx q[1], q[2];

// Edge (1,5)
cx q[1], q[5];
rz(0.1605) q[5];
cx q[1], q[5];

// Edge (1,6)
cx q[1], q[6];
rz(0.1747) q[6];
cx q[1], q[6];

// Edge (2,6)
cx q[2], q[6];
rz(0.1514) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.1655) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.1631) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
rx(0.3637) q[0];
rx(0.3637) q[1];
rx(0.3637) q[2];
rx(0.3637) q[3];
rx(0.3637) q[4];
rx(0.3637) q[5];
rx(0.3637) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];