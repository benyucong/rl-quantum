OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Layer 1: Encoding the flow capacities
rx(1.0472) q[0]; // Source to Sink capacity
rx(1.5708) q[1]; // Intermediate node 1
rx(0.7854) q[2]; // Intermediate node 2
rx(0.5236) q[3]; // Sink node

// Layer 2: Entangling operations
cx q[0], q[3]; // Connect source to sink
cx q[1], q[2]; // Connect intermediate nodes
cx q[2], q[3]; // Connect intermediate to sink

// Layer 3: Apply rotations based on capacities
rz(0.5) q[0];
rz(0.3) q[1];
rz(0.2) q[2];
rz(0.1) q[3];

// Layer 4: Final entangling and measurement preparation
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];