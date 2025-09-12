OPENQASM 3.0;
include "stdgates.inc";

bit[5] c;
qubit[5] q;

// Initialize with Hadamard gates for superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of entangling gates
cx q[0], q[1];
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[2];
cx q[1], q[4];
cx q[2], q[3];
cx q[2], q[4];

// Apply rotations for optimization
rx(0.5) q[0];
ry(0.5) q[1];
rz(0.5) q[2];
rx(0.5) q[3];
ry(0.5) q[4];

// Second layer of entangling gates
cx q[0], q[1];
cx q[3], q[4];
cx q[2], q[3];
cx q[1], q[2];

// Apply additional rotations
rx(0.8) q[0];
ry(0.8) q[1];
rz(0.8) q[2];
rx(0.8) q[3];
ry(0.8) q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];