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
rz(0.2056) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.1923) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1768) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1891) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.2014) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1876) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.1942) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2089) q[6];
cx q[5], q[6];

// Mixer Hamiltonian - First layer
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.4367) q[1];
h q[1];
h q[2];
rz(0.4125) q[2];
h q[2];
h q[3];
rz(0.4452) q[3];
h q[3];
h q[4];
rz(0.3987) q[4];
h q[4];
h q[5];
rz(0.4318) q[5];
h q[5];
h q[6];
rz(0.4276) q[6];
h q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.2258) q[3];
cx q[0], q[3];
// Edge (0,5)
cx q[0], q[5];
rz(0.2094) q[5];
cx q[0], q[5];
// Edge (1,2)
cx q[1], q[2];
rz(0.1931) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2167) q[3];
cx q[1], q[3];
// Edge (1,6)
cx q[1], q[6];
rz(0.2028) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1864) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1993) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.2122) q[5];
cx q[3], q[5];
// Edge (4,5)
cx q[4], q[5];
rz(0.1978) q[5];
cx q[4], q[5];
// Edge (4,6)
cx q[4], q[6];
rz(0.2047) q[6];
cx q[4], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2201) q[6];
cx q[5], q[6];

// Mixer Hamiltonian - Second layer
h q[0];
rz(0.4458) q[0];
h q[0];
h q[1];
rz(0.4602) q[1];
h q[1];
h q[2];
rz(0.4347) q[2];
h q[2];
h q[3];
rz(0.4691) q[3];
h q[3];
h q[4];
rz(0.4201) q[4];
h q[4];
h q[5];
rz(0.4549) q[5];
h q[5];
h q[6];
rz(0.4504) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];