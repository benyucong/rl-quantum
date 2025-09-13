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

// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.2251) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.2318) q[6];
cx q[0], q[6];

// Edge (2,4)
cx q[2], q[4];
rz(0.1873) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.2039) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.2106) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.1762) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.1928) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.1995) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.2062) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.4289) q[1];
cx q[0], q[1];

// Edge (0,3)
cx q[0], q[3];
rz(0.3974) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.4502) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.4636) q[6];
cx q[0], q[6];

// Edge (2,4)
cx q[2], q[4];
rz(0.3746) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.4078) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.4212) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.3524) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.3856) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.3990) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.4124) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.6434) q[1];
cx q[0], q[1];

// Edge (0,3)
cx q[0], q[3];
rz(0.5961) q[3];
cx q[0], q[3];

// Edge (0,5)
cx q[0], q[5];
rz(0.6753) q[5];
cx q[0], q[5];

// Edge (0,6)
cx q[0], q[6];
rz(0.6954) q[6];
cx q[0], q[6];

// Edge (2,4)
cx q[2], q[4];
rz(0.5619) q[4];
cx q[2], q[4];

// Edge (2,5)
cx q[2], q[5];
rz(0.6117) q[5];
cx q[2], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.6318) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.5286) q[4];
cx q[3], q[4];

// Edge (4,5)
cx q[4], q[5];
rz(0.5784) q[5];
cx q[4], q[5];

// Edge (4,6)
cx q[4], q[6];
rz(0.5985) q[6];
cx q[4], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.6186) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rx(1.5708) q[0];
rx(1.5708) q[1];
rx(1.5708) q[2];
rx(1.5708) q[3];
rx(1.5708) q[4];
rx(1.5708) q[5];
rx(1.5708) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];