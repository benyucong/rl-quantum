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
// Edge (0,6)
cx q[0], q[6];
rz(0.7854) q[6];
cx q[0], q[6];

// Edge (1,2)
cx q[1], q[2];
rz(0.5236) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.5236) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.5236) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.3491) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.3491) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(0.3491) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.3491) q[5];
cx q[3], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.3491) q[6];
cx q[5], q[6];

// First Mixer layer
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];

// Second QAOA layer - Cost Hamiltonian
// Edge (0,6)
cx q[0], q[6];
rz(0.3927) q[6];
cx q[0], q[6];

// Edge (1,2)
cx q[1], q[2];
rz(0.2618) q[2];
cx q[1], q[2];

// Edge (1,3)
cx q[1], q[3];
rz(0.2618) q[3];
cx q[1], q[3];

// Edge (1,6)
cx q[1], q[6];
rz(0.2618) q[6];
cx q[1], q[6];

// Edge (2,3)
cx q[2], q[3];
rz(0.1745) q[3];
cx q[2], q[3];

// Edge (2,4)
cx q[2], q[4];
rz(0.1745) q[4];
cx q[2], q[4];

// Edge (2,6)
cx q[2], q[6];
rz(0.1745) q[6];
cx q[2], q[6];

// Edge (3,5)
cx q[3], q[5];
rz(0.1745) q[5];
cx q[3], q[5];

// Edge (5,6)
cx q[5], q[6];
rz(0.1745) q[6];
cx q[5], q[6];

// Second Mixer layer
rx(0.5236) q[0];
rx(0.5236) q[1];
rx(0.5236) q[2];
rx(0.5236) q[3];
rx(0.5236) q[4];
rx(0.5236) q[5];
rx(0.5236) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];