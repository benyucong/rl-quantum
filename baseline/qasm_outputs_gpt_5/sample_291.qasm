OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1
h q[0]; // Prepare the source
h q[1]; // Prepare qubit 1
h q[2]; // Prepare qubit 2
h q[3]; // Prepare qubit 3
h q[4]; // Prepare the sink
cx q[0], q[2]; // Create a flow to node 2
cx q[0], q[4]; // Create a flow to the sink

// Layer 2
h q[1]; // Prepare qubit 1 for interaction
cx q[1], q[2]; // Flow interaction from 1 to 2
cx q[1], q[3]; // Flow interaction from 1 to 3
cx q[2], q[1]; // Feedback from 2 to 1
cx q[2], q[3]; // Create flow from 2 to 3
cx q[3], q[1]; // Create flow from 3 to 1

// Layer 3
h q[2]; // Prepare qubit 2 for final interaction
cx q[2], q[4]; // Final flow to the sink
cx q[3], q[4]; // Flow from 3 to the sink

// Layer 4
h q[3]; // Prepare last qubit for measurement
h q[4]; // Prepare sink qubit for measurement

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];