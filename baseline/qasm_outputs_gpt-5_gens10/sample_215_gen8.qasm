OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1: Apply rotation gates
rx(1.0472) q[0]; // π/3
ry(1.0472) q[1]; // π/3
rz(0.0) q[2]; 
rx(1.0472) q[3]; // π/3

// Layer 2: Entangling operations
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];

// Layer 3: More rotations
rz(0.5) q[0];
ry(0.5) q[1];
rz(0.5) q[2];
rx(0.5) q[3];

// Layer 4: Measurement basis preparation
h q[0];
h q[1];
h q[2];
h q[3];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];