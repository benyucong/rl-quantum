OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize and prepare the qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Create controlled interactions based on the graph specified
cx q[0], q[2]; // Connect source to intermediate
rz(-0.3927) q[2]; // Rotate to optimize the state
cx q[0], q[2];

cx q[1], q[2]; // Connect other node to intermediate
rz(-0.6723) q[2];
cx q[1], q[2];

cx q[1], q[3]; // Connect other node to sink
rz(-1.2183) q[3];
cx q[1], q[3];

// Layer 3: Finalize the state preparation
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];