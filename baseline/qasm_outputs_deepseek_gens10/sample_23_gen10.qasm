OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initial Hadamard and problem encoding
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply RZZ gates for edge weights (scaled by optimal parameters)
rz(0.7854) q[8];  // Ancilla qubit initialization

// Edge (0,4) with weight 8
cx q[0], q[8];
rz(0.6283) q[8];
cx q[0], q[8];
cx q[4], q[8];
rz(0.6283) q[8];
cx q[4], q[8];

// Edge (1,5) with weight 10
cx q[1], q[8];
rz(0.7854) q[8];
cx q[1], q[8];
cx q[5], q[8];
rz(0.7854) q[8];
cx q[5], q[8];

// Edge (1,4) with weight 14
cx q[1], q[8];
rz(1.0996) q[8];
cx q[1], q[8];
cx q[4], q[8];
rz(1.0996) q[8];
cx q[4], q[8];

// Edge (2,6) with weight 4
cx q[2], q[8];
rz(0.3142) q[8];
cx q[2], q[8];
cx q[6], q[8];
rz(0.3142) q[8];
cx q[6], q[8];

// Edge (2,4) with weight 16
cx q[2], q[8];
rz(1.2566) q[8];
cx q[2], q[8];
cx q[4], q[8];
rz(1.2566) q[8];
cx q[4], q[8];

// Edge (2,5) with weight 17
cx q[2], q[8];
rz(1.3352) q[8];
cx q[2], q[8];
cx q[5], q[8];
rz(1.3352) q[8];
cx q[5], q[8];

// Edge (3,7) with weight 9
cx q[3], q[8];
rz(0.7069) q[8];
cx q[3], q[8];
cx q[7], q[8];
rz(0.7069) q[8];
cx q[7], q[8];

// Edge (3,6) with weight 13
cx q[3], q[8];
rz(1.0210) q[8];
cx q[3], q[8];
cx q[6], q[8];
rz(1.0210) q[8];
cx q[6], q[8];

// Edge (3,5) with weight 11
cx q[3], q[8];
rz(0.8639) q[8];
cx q[3], q[8];
cx q[5], q[8];
rz(0.8639) q[8];
cx q[5], q[8];

// Layer 2: Mixing and optimization
// Apply mixing Hamiltonian with optimal parameters
rx(1.0472) q[0];
rx(1.0472) q[1];
rx(1.0472) q[2];
rx(1.0472) q[3];
rx(1.0472) q[4];
rx(1.0472) q[5];
rx(1.0472) q[6];
rx(1.0472) q[7];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];