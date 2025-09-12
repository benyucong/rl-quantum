OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Layer 1: Initialize qubits
h q[0]; // Source qubit
h q[1]; // Intermediate qubit
h q[2]; // Intermediate qubit
h q[3]; // Intermediate qubit
h q[4]; // Intermediate qubit
h q[5]; // Sink qubit
h q[6]; // Intermediate qubit
h q[7]; // Intermediate qubit
h q[8]; // Intermediate qubit

// Layer 1: Apply CX and rotation gates based on edges
cx q[0], q[6];    // Source to Node 6
rz(0.5) q[6];     // Rotation based on capacity
cx q[0], q[8];    // Source to Sink
rz(0.5) q[8];     // Rotation based on capacity
cx q[1], q[4];    // Node 1 to Node 4
rz(1.0) q[4];     // Rotation based on capacity
cx q[1], q[5];    // Node 1 to Node 5
rz(1.0) q[5];     // Rotation based on capacity
cx q[1], q[6];    // Node 1 to Node 6
rz(0.5) q[6];     // Rotation based on capacity
cx q[1], q[7];    // Node 1 to Node 7
rz(1.0) q[7];     // Rotation based on capacity
cx q[2], q[8];    // Node 2 to Sink
rz(1.5) q[8];     // Rotation based on capacity
cx q[3], q[2];    // Node 3 to Node 2
rz(0.5) q[2];     // Rotation based on capacity
cx q[4], q[5];    // Node 4 to Node 5
rz(1.0) q[5];     // Rotation based on capacity
cx q[4], q[7];    // Node 4 to Node 7
rz(1.0) q[7];     // Rotation based on capacity
cx q[6], q[5];    // Node 6 to Node 5
rz(1.0) q[5];     // Rotation based on capacity
cx q[6], q[7];    // Node 6 to Node 7
rz(0.5) q[7];     // Rotation based on capacity
cx q[7], q[3];    // Node 7 to Node 3
rz(0.5) q[3];     // Rotation based on capacity
cx q[7], q[4];    // Node 7 to Node 4
rz(1.0) q[4];     // Rotation based on capacity
cx q[7], q[5];    // Node 7 to Node 5
rz(1.0) q[5];     // Rotation based on capacity

// Layer 2: Finalize the circuit with inverse operations
h q[0];
rz(-0.5) q[6];
h q[6];
h q[1];
rz(-1.0) q[4];
h q[4];
h q[2];
rz(-1.5) q[8];
h q[8];
h q[3];
rz(-0.5) q[2];
h q[2];
h q[4];
rz(-1.0) q[5];
h q[5];
h q[6];
rz(-0.5) q[7];
h q[7];

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