OPENQASM 3.0;
include "stdgates.inc";
bit[11] c;
qubit[11] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Applying controlled operations - Layer 2
cx q[0], q[5]; // Source to sink
rz(-0.5) q[5]; // encoding capacity
cx q[2], q[3]; // Intermediate nodes
rz(-0.2) q[3];
cx q[3], q[1]; // Flow from node 3 to node 1
rz(-0.3) q[1];
cx q[3], q[2]; // Flow from node 3 to node 2
rz(-0.1) q[2];
cx q[3], q[5]; // Flow from node 3 to sink
rz(-0.4) q[5];
cx q[4], q[2]; // Flow from node 4 to node 2
rz(-0.2) q[2];

// Final Layer 3: Apply inverse operations
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
cx q[0], q[5];
cx q[2], q[3];
cx q[3], q[1];
cx q[3], q[2];
cx q[3], q[5]; 
cx q[4], q[2];

// Measurement
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