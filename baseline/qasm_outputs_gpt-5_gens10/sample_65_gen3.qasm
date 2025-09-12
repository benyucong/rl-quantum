OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Layer 1: Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Layer 2: Apply coupling based on graph structure
cx q[0], q[2]; // Connect source to intermediate
cx q[1], q[3]; // Connect other node to sink
cx q[2], q[3]; // Intermediate node to another
cx q[2], q[4]; // Intermediate to sink

// Layer 3: Final adjustments with rotations
rz(0.63) q[0];
rz(0.18) q[1];
rz(1.17) q[2];
rz(0.71) q[3];
rz(1.04) q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];