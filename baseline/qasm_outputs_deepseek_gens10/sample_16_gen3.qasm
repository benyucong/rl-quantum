OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First QAOA layer - Cost Hamiltonian
// Edge (0,8)
cx q[0], q[8];
rz(0.2145) q[8];
cx q[0], q[8];

// Edge (1,2)
cx q[1], q[2];
rz(0.1987) q[2];
cx q[1], q[2];

// Edge (1,6)
cx q[1], q[6];
rz(0.1832) q[6];
cx q[1], q[6];

// Edge (1,8)
cx q[1], q[8];
rz(0.2056) q[8];
cx q[1], q[8];

// Edge (2,4)
cx q[2], q[4];
rz(0.1923) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1891) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1876) q[6];
cx q[2], q[6];

// Edge (2,7)
cx q[2], q[7];
rz(0.1945) q[7];
cx q[2], q[7];

// Edge (3,7)
cx q[3], q[7];
rz(0.1768) q[7];
cx q[3], q[7];

// Edge (4,5)
cx q[4], q[5];
rz(0.1821) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1798) q[6];
cx q[4], q[6];

// Edge (5,8)
cx q[5], q[8];
rz(0.2013) q[8];
cx q[5], q[8];

// First Mixer Hamiltonian
h q[0];
rz(0.4231) q[0];
h q[0];
h q[1];
rz(0.5876) q[1];
h q[1];
h q[2];
rz(0.7823) q[2];
h q[2];
h q[3];
rz(0.3215) q[3];
h q[3];
h q[4];
rz(0.4562) q[4];
h q[4];
h q[5];
rz(0.5128) q[5];
h q[5];
h q[6];
rz(0.4987) q[6];
h q[6];
h q[7];
rz(0.3714) q[7];
h q[7];
h q[8];
rz(0.6219) q[8];
h q[8];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,8)
cx q[0], q[8];
rz(0.1983) q[8];
cx q[0], q[8];

// Edge (1,2)
cx q[1], q[2];
rz(0.1842) q[2];
cx q[1], q[2];

// Edge (1,6)
cx q[1], q[6];
rz(0.1698) q[6];
cx q[1], q[6];

// Edge (1,8)
cx q[1], q[8];
rz(0.1907) q[8];
cx q[1], q[8];

// Edge (2,4)
cx q[2], q[4];
rz(0.1781) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.1752) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1739) q[6];
cx q[2], q[6];

// Edge (2,7)
cx q[2], q[7];
rz(0.1802) q[7];
cx q[2], q[7];

// Edge (3,7)
cx q[3], q[7];
rz(0.1638) q[7];
cx q[3], q[7];

// Edge (4,5)
cx q[4], q[5];
rz(0.1687) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1665) q[6];
cx q[4], q[6];

// Edge (5,8)
cx q[5], q[8];
rz(0.1865) q[8];
cx q[5], q[8];

// Second Mixer Hamiltonian
h q[0];
rz(0.3921) q[0];
h q[0];
h q[1];
rz(0.5443) q[1];
h q[1];
h q[2];
rz(0.7248) q[2];
h q[2];
h q[3];
rz(0.2978) q[3];
h q[3];
h q[4];
rz(0.4226) q[4];
h q[4];
h q[5];
rz(0.4751) q[5];
h q[5];
h q[6];
rz(0.4621) q[6];
h q[6];
h q[7];
rz(0.3441) q[7];
h q[7];
h q[8];
rz(0.5763) q[8];
h q[8];

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