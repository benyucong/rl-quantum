OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize qubits
h q[0]; // Source
h q[1]; // Intermediary
h q[2]; // Intermediary
h q[3]; // Intermediary
h q[4]; // Sink

// Layer 2: Apply controlled operations based on graph edges
cx q[0], q[2]; // Source to Intermediate (edge capacity 1)
cx q[1], q[2]; // Intermediary to Intermediary (edge capacity 4)
cx q[2], q[4]; // Intermediate to Sink (edge capacity 6)
cx q[3], q[2]; // Intermediate to Intermediary (edge capacity 2)

// Layer 3: Rotate qubits to amplify correct states
rz(0.615) q[0];
rz(-0.615) q[1];
rz(0.2) q[2];
rz(-0.2) q[3];
rz(0.5) q[4];

// Layer 4: Finalize states 
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

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