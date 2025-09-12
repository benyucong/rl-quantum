OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize qubits and apply Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Encode the capacities into quantum gates
// Applying controlled X (cx) gates to represent the graph's edges
cx q[0], q[2]; // capacity 5
rz(-0.1542) q[2]; // phase based on capacity
cx q[0], q[3]; // capacity 1
rz(-0.0760) q[3]; // phase based on capacity
cx q[1], q[2]; // capacity 1
rz(-0.0760) q[2]; // phase based on capacity
cx q[1], q[3]; // capacity 6
rz(-0.3098) q[3]; // phase based on capacity

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];