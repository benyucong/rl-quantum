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

// First QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.2145) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.1987) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1832) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.2251) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.2076) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1923) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.1895) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.2018) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1764) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1849) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1937) q[6];
cx q[5], q[6];

// Mixer Hamiltonian - First layer
h q[0];
rz(0.4321) q[0];
h q[0];

h q[1];
rz(0.3987) q[1];
h q[1];

h q[2];
rz(0.4156) q[2];
h q[2];

h q[3];
rz(0.4562) q[3];
h q[3];

h q[4];
rz(0.3874) q[4];
h q[4];

h q[5];
rz(0.4239) q[5];
h q[5];

h q[6];
rz(0.4098) q[6];
h q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1983) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.1842) q[5];
cx q[0], q[5];

// Edge (1,2)
cx q[1], q[2];
rz(0.1728) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.2087) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.1934) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1796) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.1762) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.1879) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.1648) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1721) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.1804) q[6];
cx q[5], q[6];

// Mixer Hamiltonian - Second layer
h q[0];
rz(0.4012) q[0];
h q[0];

h q[1];
rz(0.3715) q[1];
h q[1];

h q[2];
rz(0.3867) q[2];
h q[2];

h q[3];
rz(0.4248) q[3];
h q[3];

h q[4];
rz(0.3609) q[4];
h q[4];

h q[5];
rz(0.3946) q[5];
h q[5];

h q[6];
rz(0.3812) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];