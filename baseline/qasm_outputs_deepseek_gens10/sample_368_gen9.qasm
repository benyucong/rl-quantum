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
// Edge (1,2)
cx q[1], q[2];
rz(0.1876) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.2093) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2224) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.1952) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.1765) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.2039) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.1921) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.2187) q[4];
cx q[3], q[4];

// Layer 1 - Mixer Hamiltonian
h q[0];
rz(0.3421) q[0];
h q[0];
h q[1];
rz(0.3567) q[1];
h q[1];
h q[2];
rz(0.3315) q[2];
h q[2];
h q[3];
rz(0.3678) q[3];
h q[3];
h q[4];
rz(0.3812) q[4];
h q[4];
h q[5];
rz(0.3243) q[5];
h q[5];
h q[6];
rz(0.3389) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.4289) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.3974) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.4502) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.4636) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.3752) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.4186) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.4448) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.3904) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.3530) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.4078) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.3842) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.4374) q[4];
cx q[3], q[4];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(0.6842) q[0];
h q[0];
h q[1];
rz(0.7134) q[1];
h q[1];
h q[2];
rz(0.6630) q[2];
h q[2];
h q[3];
rz(0.7356) q[3];
h q[3];
h q[4];
rz(0.7624) q[4];
h q[4];
h q[5];
rz(0.6486) q[5];
h q[5];
h q[6];
rz(0.6778) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.6434) q[1];
cx q[0], q[1];
// Edge (0,2)
cx q[0], q[2];
rz(0.5961) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.6753) q[3];
cx q[0], q[3];
// Edge (0,4)
cx q[0], q[4];
rz(0.6954) q[4];
cx q[0], q[4];
// Edge (1,2)
cx q[1], q[2];
rz(0.5628) q[2];
cx q[1], q[2];
// Edge (1,3)
cx q[1], q[3];
rz(0.6279) q[3];
cx q[1], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.6672) q[4];
cx q[1], q[4];
// Edge (1,6)
cx q[1], q[6];
rz(0.5856) q[6];
cx q[1], q[6];
// Edge (2,3)
cx q[2], q[3];
rz(0.5295) q[3];
cx q[2], q[3];
// Edge (2,4)
cx q[2], q[4];
rz(0.6117) q[4];
cx q[2], q[4];
// Edge (2,5)
cx q[2], q[5];
rz(0.5763) q[5];
cx q[2], q[5];
// Edge (3,4)
cx q[3], q[4];
rz(0.6561) q[4];
cx q[3], q[4];

// Layer 3 - Mixer Hamiltonian
h q[0];
rz(1.0263) q[0];
h q[0];
h q[1];
rz(1.0701) q[1];
h q[1];
h q[2];
rz(0.9945) q[2];
h q[2];
h q[3];
rz(1.1034) q[3];
h q[3];
h q[4];
rz(1.1436) q[4];
h q[4];
h q[5];
rz(0.9729) q[5];
h q[5];
h q[6];
rz(1.0167) q[6];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];