OPENQASM 3.0;
include "stdgates.inc";
bit[13] c;
qubit[13] q;

// Layer 1
h q[0]; // Initialize source qubit
h q[1]; // Start superposition for further qubits
h q[2]; // Forwarding qubit
h q[3]; // Forwarding qubit
h q[4]; // Forwarding qubit
h q[5]; // Sink qubit

cx q[0], q[2]; // Capacity 1 edge from source to node 2
cx q[0], q[3]; // Capacity 1 edge from source to node 3
cx q[0], q[4]; // Capacity 2 edge from source to node 4
cx q[0], q[5]; // Capacity 2 edge from source to sink

cx q[2], q[3]; // Capacity 1 edge between nodes
cx q[2], q[5]; // Capacity 2 edge from node 2 to sink
cx q[3], q[1]; // Capacity 2 edge from node 3 to node 1
cx q[3], q[4]; // Capacity 1 edge from node 3 to node 4

// Layer 2
h q[0]; // Reintroduce superposition at source
h q[1]; // Ensure we check all paths
h q[2]; // Don't lose information
h q[3]; // Second edge state and measure
h q[4]; // Pathways from node 4
h q[5]; // Confirm sink state

// Measurement for all qubits
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
c[12] = measure q[12];