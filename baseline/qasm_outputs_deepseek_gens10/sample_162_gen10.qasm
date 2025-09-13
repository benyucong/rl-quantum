OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Layer 1 - Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1 - Problem Hamiltonian (edge constraints)
// Edge (0,2)
cx q[0], q[2];
rz(0.214) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.198) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.231) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.225) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.208) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.192) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.205) q[6];
cx q[5], q[6];

// Layer 1 - Mixing Hamiltonian
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Layer 2 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.428) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.396) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.462) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.450) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.416) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.384) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.410) q[6];
cx q[5], q[6];

// Layer 2 - Mixing Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Layer 3 - Problem Hamiltonian
// Edge (0,2)
cx q[0], q[2];
rz(0.642) q[2];
cx q[0], q[2];

// Edge (1,4)
cx q[1], q[4];
rz(0.594) q[4];
cx q[1], q[4];

// Edge (2,3)
cx q[2], q[3];
rz(0.693) q[3];
cx q[2], q[3];

// Edge (3,4)
cx q[3], q[4];
rz(0.675) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.624) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.576) q[6];
cx q[3], q[6];

// Edge (5,6)
cx q[5], q[6];
rz(0.615) q[6];
cx q[5], q[6];

// Layer 3 - Mixing Hamiltonian
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