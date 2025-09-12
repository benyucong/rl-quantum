OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled operations based on the min-cut problem
cx q[0], q[1]; // Connect source to node 1
cx q[0], q[3]; // Connect source to node 3
cx q[0], q[4]; // Connect source to node 4
cx q[0], q[5]; // Connect source to sink
cx q[1], q[3]; // Connect node 1 to node 3
cx q[1], q[4]; // Connect node 1 to node 4
cx q[1], q[5]; // Connect node 1 to sink
cx q[3], q[2]; // Connect node 3 to node 2
cx q[3], q[4]; // Connect node 3 to node 4
cx q[3], q[5]; // Connect node 3 to sink

// Layer 3: Finalize the state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];