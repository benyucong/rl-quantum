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

// Layer 1 - Cost Hamiltonian implementation
// Edge (0,1)
cx q[0], q[1];
rz(0.2145) q[1];
cx q[0], q[1];

// Edge (0,6)
cx q[0], q[6];
rz(0.1987) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.2251) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.2318) q[5];
cx q[1], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.1923) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.2056) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.2189) q[6];
cx q[4], q[6];

// Layer 1 - Mixer Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 2 - Cost Hamiltonian implementation
// Edge (0,1)
cx q[0], q[1];
rz(0.4289) q[1];
cx q[0], q[1];

// Edge (0,6)
cx q[0], q[6];
rz(0.3974) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.4502) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.4636) q[5];
cx q[1], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.3846) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.4112) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.4378) q[6];
cx q[4], q[6];

// Layer 2 - Mixer Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Layer 3 - Cost Hamiltonian implementation
// Edge (0,1)
cx q[0], q[1];
rz(0.6434) q[1];
cx q[0], q[1];

// Edge (0,6)
cx q[0], q[6];
rz(0.5961) q[6];
cx q[0], q[6];

// Edge (1,4)
cx q[1], q[4];
rz(0.6753) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.6954) q[5];
cx q[1], q[5];

// Edge (2,6)
cx q[2], q[6];
rz(0.5769) q[6];
cx q[2], q[6];

// Edge (3,6)
cx q[3], q[6];
rz(0.6168) q[6];
cx q[3], q[6];

// Edge (4,6)
cx q[4], q[6];
rz(0.6567) q[6];
cx q[4], q[6];

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