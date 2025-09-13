OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initial Hadamard layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1 - Problem Hamiltonian (k-clique constraints)
// Cost terms for k=5 clique
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.7854) q[3];
rz(0.7854) q[4];
rz(-1.5708) q[5];
rz(-1.5708) q[6];
rz(-1.5708) q[7];

// Edge constraints for the 5-clique {0,1,2,3,4}
cx q[0], q[1];
rz(0.3927) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.3927) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.3927) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.3927) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(0.3927) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.3927) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.3927) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.3927) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.3927) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.3927) q[4];
cx q[3], q[4];

// Layer 2 - Mixer Hamiltonian
h q[0];
rz(1.1781) q[0];
h q[0];
h q[1];
rz(1.1781) q[1];
h q[1];
h q[2];
rz(1.1781) q[2];
h q[2];
h q[3];
rz(1.1781) q[3];
h q[3];
h q[4];
rz(1.1781) q[4];
h q[4];
h q[5];
rz(-0.3927) q[5];
h q[5];
h q[6];
rz(-0.3927) q[6];
h q[6];
h q[7];
rz(-0.3927) q[7];
h q[7];

// Layer 3 - Final problem Hamiltonian
// Final cost terms for k=5 clique
rz(1.1781) q[0];
rz(1.1781) q[1];
rz(1.1781) q[2];
rz(1.1781) q[3];
rz(1.1781) q[4];
rz(-2.3562) q[5];
rz(-2.3562) q[6];
rz(-2.3562) q[7];

// Final edge constraints
cx q[0], q[1];
rz(0.5890) q[1];
cx q[0], q[1];
cx q[0], q[2];
rz(0.5890) q[2];
cx q[0], q[2];
cx q[0], q[3];
rz(0.5890) q[3];
cx q[0], q[3];
cx q[0], q[4];
rz(0.5890) q[4];
cx q[0], q[4];
cx q[1], q[2];
rz(0.5890) q[2];
cx q[1], q[2];
cx q[1], q[3];
rz(0.5890) q[3];
cx q[1], q[3];
cx q[1], q[4];
rz(0.5890) q[4];
cx q[1], q[4];
cx q[2], q[3];
rz(0.5890) q[3];
cx q[2], q[3];
cx q[2], q[4];
rz(0.5890) q[4];
cx q[2], q[4];
cx q[3], q[4];
rz(0.5890) q[4];
cx q[3], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];