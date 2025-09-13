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
// Edge (0,2)
cx q[0], q[2];
rz(0.2145) q[2];
cx q[0], q[2];
// Edge (0,3)
cx q[0], q[3];
rz(0.1987) q[3];
cx q[0], q[3];
// Edge (1,4)
cx q[1], q[4];
rz(0.2251) q[4];
cx q[1], q[4];
// Edge (1,5)
cx q[1], q[5];
rz(0.2318) q[5];
cx q[1], q[5];
// Edge (2,4)
cx q[2], q[4];
rz(0.2073) q[4];
cx q[2], q[4];
// Edge (3,6)
cx q[3], q[6];
rz(0.2196) q[6];
cx q[3], q[6];
// Edge (5,6)
cx q[5], q[6];
rz(0.2229) q[6];
cx q[5], q[6];

// Layer 1 - Mixer Hamiltonian
rz(0.5236) q[0];
h q[0];
rz(0.5236) q[0];
h q[0];
rz(0.5236) q[1];
h q[1];
rz(0.5236) q[1];
h q[1];
rz(0.5236) q[2];
h q[2];
rz(0.5236) q[2];
h q[2];
rz(0.5236) q[3];
h q[3];
rz(0.5236) q[3];
h q[3];
rz(0.5236) q[4];
h q[4];
rz(0.5236) q[4];
h q[4];
rz(0.5236) q[5];
h q[5];
rz(0.5236) q[5];
h q[5];
rz(0.5236) q[6];
h q[6];
rz(0.5236) q[6];
h q[6];

// Layer 2 - Problem Hamiltonian
cx q[0], q[2];
rz(0.4289) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.3974) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(0.4502) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.4636) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.4146) q[4];
cx q[2], q[4];
cx q[3], q[6];
rz(0.4392) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(0.4458) q[6];
cx q[5], q[6];

// Layer 2 - Mixer Hamiltonian
rz(1.0472) q[0];
h q[0];
rz(1.0472) q[0];
h q[0];
rz(1.0472) q[1];
h q[1];
rz(1.0472) q[1];
h q[1];
rz(1.0472) q[2];
h q[2];
rz(1.0472) q[2];
h q[2];
rz(1.0472) q[3];
h q[3];
rz(1.0472) q[3];
h q[3];
rz(1.0472) q[4];
h q[4];
rz(1.0472) q[4];
h q[4];
rz(1.0472) q[5];
h q[5];
rz(1.0472) q[5];
h q[5];
rz(1.0472) q[6];
h q[6];
rz(1.0472) q[6];
h q[6];

// Layer 3 - Problem Hamiltonian
cx q[0], q[2];
rz(0.6434) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.5961) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(0.6753) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.6954) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.6219) q[4];
cx q[2], q[4];
cx q[3], q[6];
rz(0.6588) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(0.6687) q[6];
cx q[5], q[6];

// Layer 3 - Mixer Hamiltonian
rz(1.5708) q[0];
h q[0];
rz(1.5708) q[0];
h q[0];
rz(1.5708) q[1];
h q[1];
rz(1.5708) q[1];
h q[1];
rz(1.5708) q[2];
h q[2];
rz(1.5708) q[2];
h q[2];
rz(1.5708) q[3];
h q[3];
rz(1.5708) q[3];
h q[3];
rz(1.5708) q[4];
h q[4];
rz(1.5708) q[4];
h q[4];
rz(1.5708) q[5];
h q[5];
rz(1.5708) q[5];
h q[5];
rz(1.5708) q[6];
h q[6];
rz(1.5708) q[6];
h q[6];

// Layer 4 - Problem Hamiltonian
cx q[0], q[2];
rz(0.8578) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.7948) q[3];
cx q[0], q[3];
cx q[1], q[4];
rz(0.9004) q[4];
cx q[1], q[4];
cx q[1], q[5];
rz(0.9272) q[5];
cx q[1], q[5];
cx q[2], q[4];
rz(0.8292) q[4];
cx q[2], q[4];
cx q[3], q[6];
rz(0.8784) q[6];
cx q[3], q[6];
cx q[5], q[6];
rz(0.8916) q[6];
cx q[5], q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];