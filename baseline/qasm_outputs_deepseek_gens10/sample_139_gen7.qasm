OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First QAOA layer - Mixer Hamiltonian
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(0.7854) q[5];
rz(0.7854) q[6];
rz(0.7854) q[7];

// First QAOA layer - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];

// Second QAOA layer - Mixer Hamiltonian
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(1.1781) q[5];
rz(1.1781) q[6];
rz(1.1781) q[7];

// Second QAOA layer - Problem Hamiltonian
// Edge (0,1)
cx q[0], q[1];
rz(0.5890) q[1];
cx q[0], q[1];
// Edge (0,3)
cx q[0], q[3];
rz(0.5890) q[3];
cx q[0], q[3];
// Edge (1,2)
cx q[1], q[2];
rz(0.5890) q[2];
cx q[1], q[2];
// Edge (2,3)
cx q[2], q[3];
rz(0.5890) q[3];
cx q[2], q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];