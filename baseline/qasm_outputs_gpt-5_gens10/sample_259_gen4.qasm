OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize qubits to |+> state
h q[0];
h q[1];
h q[2];
h q[3];

// Apply entangling gates for min-cut problem
cx q[0], q[1]; // Connect source node 0 to node 1
cx q[0], q[2]; // Connect source node 0 to node 2
cx q[0], q[3]; // Connect source node 0 to sink node 3

// Apply rotation to create appropriate superposition
rz(0.9428) q[0];
rz(0.2731) q[1];
rz(1.5708) q[2];
rz(0.7854) q[3];

// Measurement of all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];