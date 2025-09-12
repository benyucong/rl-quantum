OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize the qubit states
h q[0];
h q[1];
h q[2];
h q[3];

// Apply entangling gates based on the given graph
cx q[0], q[1]; // Connect nodes 0 and 1
cx q[2], q[3]; // Connect nodes 2 and 3
cx q[2], q[4]; // Connect nodes 2 and 4
cx q[3], q[4]; // Connect nodes 3 and 4

// Finalize the circuit
h q[0];
h q[1];
h q[2];
h q[3];

// Measure the output
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];