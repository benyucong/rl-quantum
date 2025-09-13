OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply problem-specific phase rotations based on edge weights
// Node 0 connections
rz(0.6283) q[0];  // Weight 4
rz(2.1991) q[3];  // Weight 4
rz(2.1991) q[0];  // Weight 14
rz(4.3982) q[5];  // Weight 14
rz(2.9845) q[0];  // Weight 19
rz(5.9690) q[6];  // Weight 19
rz(2.1991) q[0];  // Weight 14
rz(4.3982) q[4];  // Weight 14
rz(2.5133) q[0];  // Weight 16
rz(5.0265) q[7];  // Weight 16

// Node 1 connections
rz(1.0996) q[1];  // Weight 7
rz(2.1991) q[4];  // Weight 7
rz(2.0420) q[1];  // Weight 13
rz(4.0841) q[7];  // Weight 13

// Node 2 connections
rz(0.9425) q[2];  // Weight 6
rz(1.8850) q[5];  // Weight 6

// Entangling operations for bipartite structure
cx q[0], q[3];
cx q[0], q[4];
cx q[0], q[5];
cx q[0], q[6];
cx q[0], q[7];
cx q[1], q[4];
cx q[1], q[7];
cx q[2], q[5];

// Layer 2: Mixing and optimization
// Apply mixing Hamiltonian
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Final phase optimization
rz(0.7854) q[0];
rz(0.7854) q[1];
rz(0.7854) q[2];
rz(0.3927) q[3];
rz(0.3927) q[4];
rz(0.3927) q[5];
rz(0.3927) q[6];
rz(0.3927) q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];