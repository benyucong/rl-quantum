OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Layer 1: Initialization and entangling
h q[0]; 
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
cx q[0], q[1]; // source to first edge
cx q[0], q[2]; // source to second edge
cx q[0], q[4]; // source to third edge

// Layer 2: Control for flow
cx q[1], q[6]; // edge from node 1 to sink
cx q[2], q[1]; // feedback from node 2 to 1
cx q[2], q[4]; // node 2 to node 4
cx q[3], q[5]; // feedback path from node 3 to 5
cx q[4], q[2]; // feedback from node 4 to node 2
cx q[4], q[6]; // second pathway to sink from 4
cx q[5], q[1]; // flow from node 5 to 1
cx q[5], q[3]; // feedback from 5 to 3

// Layer 3: Measurement preparation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];