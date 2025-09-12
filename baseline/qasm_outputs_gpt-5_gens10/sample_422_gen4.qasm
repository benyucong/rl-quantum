OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Apply controlled rotations based on the graph edges
rz(0.5) q[0]; // Source to first node
cx q[0], q[2]; // Connecting source to node 2
rz(0.5) q[0]; // Source to sink
cx q[0], q[3]; // Connecting source to sink

rz(0.5) q[1]; // Second node to first node
cx q[1], q[2]; // Connecting node 1 to node 2
rz(0.5) q[1]; // Second node to sink
cx q[1], q[3]; // Connecting node 1 to sink

// Layer 2: Entangling operations to prepare the final state
cx q[2], q[3]; // Entangling node 2 with sink
rz(0.5) q[2]; // Rotating node 2
cx q[2], q[3]; // Final entanglement

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];