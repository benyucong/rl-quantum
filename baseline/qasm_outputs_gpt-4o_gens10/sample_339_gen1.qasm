OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled operations based on the min_cut problem
cx q[0], q[2]; // Edge from source 0 to node 2
cx q[1], q[3]; // Edge from node 1 to sink 3
cx q[2], q[1]; // Edge from node 2 to node 1
cx q[2], q[3]; // Edge from node 2 to sink 3

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];