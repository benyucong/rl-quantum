OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits with H-gates
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1 - Applying CNOTs according to edges
cx q[0], q[1]; // edge 1-2
cx q[0], q[3]; // edge 1-3
cx q[1], q[3]; // edge 2-3
cx q[2], q[3]; // edge 0-3

// Layer 2 - Apply rotation gates to introduce variational parameters
ry(0.5) q[0];
ry(0.3) q[1];
ry(0.7) q[2];
ry(0.4) q[3];

// Layer 3 - More CNOTs and entangling operations
cx q[0], q[2]; 
cx q[1], q[3];

// Layer 4 - Final rotation to encode solution
rz(0.2) q[0];
rz(0.1) q[1];
rz(0.3) q[2];
rz(0.25) q[3];

// Measure qubits to obtain the color assignment
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];