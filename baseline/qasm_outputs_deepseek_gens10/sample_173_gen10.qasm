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

// Edge (1,4)
cx q[1], q[4];
rz(0.1832) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.2251) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.2318) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.2436) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1924) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.2079) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2193) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.2357) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.2016) q[6];
cx q[5], q[6];

// First QAOA layer - Mixer Hamiltonian
h q[0];
rz(0.8763) q[0];
h q[0];

h q[1];
rz(0.8921) q[1];
h q[1];

h q[2];
rz(0.8347) q[2];
h q[2];

h q[3];
rz(0.8215) q[3];
h q[3];

h q[4];
rz(0.8092) q[4];
h q[4];

h q[5];
rz(0.7968) q[5];
h q[5];

h q[6];
rz(0.8842) q[6];
h q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.4327) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.4012) q[5];
cx q[0], q[5];

// Edge (1,4)
cx q[1], q[4];
rz(0.3698) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.4543) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.4675) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.4914) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.3881) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.4193) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.4424) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.4754) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.4067) q[6];
cx q[5], q[6];

// Second QAOA layer - Mixer Hamiltonian
h q[0];
rz(1.7682) q[0];
h q[0];

h q[1];
rz(1.7993) q[1];
h q[1];

h q[2];
rz(1.6837) q[2];
h q[2];

h q[3];
rz(1.6569) q[3];
h q[3];

h q[4];
rz(1.6321) q[4];
h q[4];

h q[5];
rz(1.6072) q[5];
h q[5];

h q[6];
rz(1.7835) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];