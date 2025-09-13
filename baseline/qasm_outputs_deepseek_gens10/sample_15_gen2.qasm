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
rz(0.1234) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1876) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1765) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1654) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.2019) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1543) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1892) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.4321) q[0];
h q[0];
h q[1];
rz(0.3987) q[1];
h q[1];
h q[2];
rz(0.4123) q[2];
h q[2];
h q[3];
rz(0.4567) q[3];
h q[3];
h q[4];
rz(0.3765) q[4];
h q[4];
h q[5];
rz(0.4210) q[5];
h q[5];
h q[6];
rz(0.4432) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1984) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1842) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1156) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1732) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1638) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1539) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1876) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1432) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1754) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.4012) q[0];
h q[0];
h q[1];
rz(0.3708) q[1];
h q[1];
h q[2];
rz(0.3829) q[2];
h q[2];
h q[3];
rz(0.4238) q[3];
h q[3];
h q[4];
rz(0.3498) q[4];
h q[4];
h q[5];
rz(0.3914) q[5];
h q[5];
h q[6];
rz(0.4115) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,3)
cx q[0], q[3];
rz(0.1843) q[3];
cx q[0], q[3];
// Edge (0,6)
cx q[0], q[6];
rz(0.1712) q[6];
cx q[0], q[6];
// Edge (1,2)
cx q[1], q[2];
rz(0.1078) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.1612) q[3];
cx q[2], q[3];
// Edge (2,6)
cx q[2], q[6];
rz(0.1524) q[6];
cx q[2], q[6];
// Edge (3,5)
cx q[3], q[5];
rz(0.1435) q[5];
cx q[3], q[5];
// Edge (3,6)
cx q[3], q[6];
rz(0.1748) q[6];
cx q[3], q[6];
// Edge (3,4)
cx q[3], q[4];
rz(0.1334) q[4];
cx q[3], q[4];
// Edge (5,6)
cx q[5], q[6];
rz(0.1632) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(0.3732) q[0];
h q[0];
h q[1];
rz(0.3452) q[1];
h q[1];
h q[2];
rz(0.3564) q[2];
h q[2];
h q[3];
rz(0.3945) q[3];
h q[3];
h q[4];
rz(0.3256) q[4];
h q[4];
h q[5];
rz(0.3643) q[5];
h q[5];
h q[6];
rz(0.3829) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];