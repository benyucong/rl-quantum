OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1: Initial Hadamard and mixing
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Layer 1: Problem Hamiltonian (edge constraints)
// Edge (0,5)
cx q[0], q[5];
rz(0.7854) q[5];
cx q[0], q[5];

// Edge (1,3)
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.5236) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.5236) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.5236) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.5236) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.3491) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.3491) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.3491) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.3491) q[5];
cx q[4], q[5];

// Layer 1: Mixing Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Layer 2: Problem Hamiltonian
// Edge (0,5)
cx q[0], q[5];
rz(0.6283) q[5];
cx q[0], q[5];

// Edge (1,3)
cx q[1], q[3];
rz(0.4189) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.4189) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.4189) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.4189) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.4189) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.2793) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2793) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.2793) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.2793) q[5];
cx q[4], q[5];

// Layer 2: Mixing Hamiltonian
rx(0.8378) q[0];
rx(0.8378) q[1];
rx(0.8378) q[2];
rx(0.8378) q[3];
rx(0.8378) q[4];
rx(0.8378) q[5];
rx(0.8378) q[6];

// Layer 3: Problem Hamiltonian
// Edge (0,5)
cx q[0], q[5];
rz(0.5027) q[5];
cx q[0], q[5];

// Edge (1,3)
cx q[1], q[3];
rz(0.3351) q[3];
cx q[1], q[3];

// Edge (1,4)
cx q[1], q[4];
rz(0.3351) q[4];
cx q[1], q[4];

// Edge (1,5)
cx q[1], q[5];
rz(0.3351) q[5];
cx q[1], q[5];

// Edge (2,3)
cx q[2], q[3];
rz(0.3351) q[3];
cx q[2], q[3];

// Edge (2,6)
cx q[2], q[6];
rz(0.3351) q[6];
cx q[2], q[6];

// Edge (3,4)
cx q[3], q[4];
rz(0.2234) q[4];
cx q[3], q[4];

// Edge (3,5)
cx q[3], q[5];
rz(0.2234) q[5];
cx q[3], q[5];

// Edge (3,6)
cx q[3], q[6];
rz(0.2234) q[6];
cx q[3], q[6];

// Edge (4,5)
cx q[4], q[5];
rz(0.2234) q[5];
cx q[4], q[5];

// Layer 3: Mixing Hamiltonian
rx(0.6702) q[0];
rx(0.6702) q[1];
rx(0.6702) q[2];
rx(0.6702) q[3];
rx(0.6702) q[4];
rx(0.6702) q[5];
rx(0.6702) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];