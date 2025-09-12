OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Layer 1: Apply Hadamard
h q[0];
h q[1];
h q[2];

// Layer 2: Apply CX gates for entanglement between qubits representing edges
cx q[0], q[1]; // edge (0, 1)
cx q[0], q[2]; // edge (0, 2)
cx q[1], q[2]; // edge (1, 2)

// Layer 3: Apply rotation gates to encode the vertex cover solution
rz(0.4312) q[0];
rz(0.2156) q[1];
rz(0.6544) q[2];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];