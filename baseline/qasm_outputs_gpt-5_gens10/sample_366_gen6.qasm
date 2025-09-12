OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits
h q[0]; // Initialize source qubit
h q[1]; // Initialize qubit for node 1
h q[2]; // Initialize qubit for node 2
h q[3]; // Initialize sink qubit

// Layer 1: Encode edges from source
cx q[0], q[1]; // Source to node 1
rxy(0.4636, 0.2) q[0], q[3]; // Source to sink
cx q[1], q[2]; // Node 1 to node 2

// Layer 2: Encode edges between nodes
cx q[1], q[3]; // Node 1 to sink
rxy(0.7854, -0.1) q[1], q[2]; // Node 1 to node 2
cx q[2], q[3]; // Node 2 to sink

// Layer 3: Adjust and measure
rx(0.4) q[0]; // Adjust source qubit
cz q[1], q[3]; // Controlled Z gate for final condition
cx q[2], q[1]; // Final interaction

// Measurements
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