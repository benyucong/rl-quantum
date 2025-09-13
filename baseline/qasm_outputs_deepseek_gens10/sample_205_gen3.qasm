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
rz(0.2251) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.2318) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.1876) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.2034) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2198) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2265) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.2089) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.2156) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.2327) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.1923) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.1891) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.5236) q[0];
h q[0];
h q[1];
rz(0.5236) q[1];
h q[1];
h q[2];
rz(0.5236) q[2];
h q[2];
h q[3];
rz(0.5236) q[3];
h q[3];
h q[4];
rz(0.5236) q[4];
h q[4];
h q[5];
rz(0.5236) q[5];
h q[5];
h q[6];
rz(0.5236) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.4123) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.3982) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.4267) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.4331) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.3845) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.4019) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.4187) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.4251) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.4076) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.4140) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.4318) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.3892) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.3867) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(1.0472) q[0];
h q[0];
h q[1];
rz(1.0472) q[1];
h q[1];
h q[2];
rz(1.0472) q[2];
h q[2];
h q[3];
rz(1.0472) q[3];
h q[3];
h q[4];
rz(1.0472) q[4];
h q[4];
h q[5];
rz(1.0472) q[5];
h q[5];
h q[6];
rz(1.0472) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.6184) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.5973) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.6401) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.6497) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.5768) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.6029) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.6281) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.6377) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.6114) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.6210) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.6477) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.5838) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.5801) q[6];
cx q[4], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(1.5708) q[0];
h q[0];
h q[1];
rz(1.5708) q[1];
h q[1];
h q[2];
rz(1.5708) q[2];
h q[2];
h q[3];
rz(1.5708) q[3];
h q[3];
h q[4];
rz(1.5708) q[4];
h q[4];
h q[5];
rz(1.5708) q[5];
h q[5];
h q[6];
rz(1.5708) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.8246) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.7964) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.8534) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.8662) q[4];
cx q[0], q[4];
// Edge (0,7)
cx q[0], q[6];
rz(0.7690) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.8039) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.8375) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.8503) q[4];
cx q[1], q[4];
// Edge (2,3)
cx q[2], q[3];
rz(0.8152) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.8280) q[4];
cx q[2], q[4];
// Edge (3,4)
cx q[3], q[4];
rz(0.8636) q[4];
cx q[3], q[4];
// Edge (3,6)
cx q[3], q[5];
rz(0.7784) q[5];
cx q[3], q[5];
// Edge (4,7)
cx q[4], q[6];
rz(0.7735) q[6];
cx q[4], q[6];

// Layer 4 - Mixer Hamiltonian
h q[0];
rz(2.0944) q[0];
h q[0];
h q[1];
rz(2.0944) q[1];
h q[1];
h q[2];
rz(2.0944) q[2];
h q[2];
h q[3];
rz(2.0944) q[3];
h q[3];
h q[4];
rz(2.0944) q[4];
h q[4];
h q[5];
rz(2.0944) q[5];
h q[5];
h q[6];
rz(2.0944) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];