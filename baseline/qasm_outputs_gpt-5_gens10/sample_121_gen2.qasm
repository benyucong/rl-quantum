OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Prepare an equal superposition state
h q;

// Layer 2: Apply controlled rotations based on the K-Clique structure
rx(1.245) q[0]; // Rotation for node 0
rx(1.245) q[1]; // Rotation for node 1
rx(1.245) q[2]; // Rotation for node 2
rx(1.245) q[3]; // Rotation for node 3
rx(1.245) q[4]; // Rotation for node 4
rx(1.245) q[5]; // Rotation for node 5

// Establish entanglement between nodes that are connected in the graph
cx q[0], q[1];
cx q[0], q[2];
cx q[0], q[3];
cx q[1], q[2];
cx q[1], q[3];
cx q[2], q[3];
cx q[3], q[4];
cx q[3], q[5];

// Layer 3: Apply final rotations
rz(0.987) q[0];
rz(0.987) q[1];
rz(0.987) q[2];
rz(0.987) q[3];
rz(0.987) q[4];
rz(0.987) q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];