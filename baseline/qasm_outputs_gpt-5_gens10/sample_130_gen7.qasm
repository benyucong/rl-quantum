OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialization
h q[0];  // Prepare source in superposition
h q[1];  // Prepare intermediary nodes
h q[2];  // Prepare intermediary nodes
h q[3];  // Prepare intermediary nodes
h q[4];  // Prepare intermediary nodes
h q[5];  // Prepare intermediary nodes
h q[6];  // Prepare sink in superposition
h q[7];  // Prepare sink in superposition

// Layer 2: Entangling operations
cx q[0], q[2]; // Connect source to intermediate node
cx q[0], q[7]; // Connect source to sink
cx q[2], q[4]; // Connect intermediary to target
cx q[4], q[1]; // Connect target to final
cx q[4], q[3]; // Connect target to final
cx q[4], q[5]; // Connect target to final
cx q[4], q[6]; // Connect target to final
cx q[5], q[1]; // Connect intermediary
cx q[6], q[2]; // Connect intermediary
cx q[6], q[5]; // Connect intermediary to final

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];