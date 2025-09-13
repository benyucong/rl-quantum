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

// First Mixer layer
h q[0];
rz(0.8763) q[0];
h q[0];

h q[1];
rz(0.9127) q[1];
h q[1];

h q[2];
rz(0.8349) q[2];
h q[2];

h q[3];
rz(0.7892) q[3];
h q[3];

h q[4];
rz(0.8015) q[4];
h q[4];

h q[5];
rz(0.7658) q[5];
h q[5];

h q[6];
rz(0.9234) q[6];
h q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.4289) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.3974) q[5];
cx q[0], q[5];

// Edge (1,4)
cx q[1], q[4];
rz(0.3664) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.4502) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.4636) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.4872) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.3848) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.4158) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.4386) q[5];
cx q[3], q[5];

// Edge (4,5)
cx q[4], q[5];
rz(0.4714) q[5];
cx q[4], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.4032) q[6];
cx q[5], q[6];

// Second Mixer layer
h q[0];
rz(1.7526) q[0];
h q[0];

h q[1];
rz(1.8254) q[1];
h q[1];

h q[2];
rz(1.6698) q[2];
h q[2];

h q[3];
rz(1.5784) q[3];
h q[3];

h q[4];
rz(1.6030) q[4];
h q[4];

h q[5];
rz(1.5316) q[5];
h q[5];

h q[6];
rz(1.8468) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];