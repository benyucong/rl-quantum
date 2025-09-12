OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1 - Initializing the qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2 - Apply controlled operations based on graph edges
cx q[0], q[1]; // Edge: 1 - 2
cx q[0], q[3]; // Edge: 1 - 3
cx q[1], q[3]; // Edge: 2 - 3
cx q[2], q[3]; // Edge: 0 - 3

// Layer 3 - Further entangling operations
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];

// Layer 4 - Finalizing the state preparation and measurement
h q[0];
h q[1];
h q[2];
h q[3];

c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];