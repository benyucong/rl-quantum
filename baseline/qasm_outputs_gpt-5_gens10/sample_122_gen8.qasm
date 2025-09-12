OPENQASM 3.0;
include "stdgates.inc";
bit[15] c;
qubit[15] q;

// Layer 1 - Initialize with Hadamard gates to create superposition
h q[0];  // Source
h q[1];  // Intermediate node 1
h q[2];  // Intermediate node 2
h q[3];  // Intermediate node 3
h q[4];  // Intermediate node 4
h q[5];  // Sink

// Create Conditional Edges based on the provided capacities
// Edge from node 0 to node 2 (capacity 3)
cx q[0], q[2];
rz(-0.23) q[2];

// Edge from node 1 to node 5 (capacity 3)
cx q[1], q[5];
rz(-0.23) q[5];

// Edge from node 2 to node 5 (capacity 4)
cx q[2], q[5];
rz(-0.23) q[5];

// Edge from node 4 to node 1 (capacity 4)
cx q[4], q[1];
rz(-0.23) q[1];

// Edge from node 4 to node 3 (capacity 3)
cx q[4], q[3];
rz(-0.23) q[3];

// Edge from node 4 to node 5 (capacity 6)
cx q[4], q[5];
rz(-0.23) q[5];

// Layer 2 - Add more entanglement with additional gates
h q[0];
cx q[0], q[2];
h q[1];
cx q[1], q[5];
h q[2];
cx q[2], q[5];
h q[4];
cx q[4], q[1];
h q[3];
cx q[3], q[5];

// Layer 3 - Final adjustments and measurements
h q[0];
rz(0.12) q[0];
h q[0];
h q[1];
rz(0.12) q[1];
h q[1];
h q[2];
rz(0.12) q[2];
h q[2];
h q[3];
rz(0.12) q[3];
h q[3];
h q[4];
rz(0.12) q[4];
h q[4];
h q[5];
rz(0.12) q[5];
h q[5];

// Measure all qubits
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
c[13] = measure q[13];
c[14] = measure q[14];