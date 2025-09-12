OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// First layer of operations (initialization with entanglement)
h q[0]; // Prepare superposition on left nodes
h q[1];
h q[2];

cx q[0], q[3]; // Entangle q[0] with right nodes
cx q[0], q[4];
cx q[0], q[6];
cx q[0], q[7];

cx q[1], q[3]; // Entangle q[1] with right nodes
cx q[1], q[4];
cx q[1], q[6];

cx q[2], q[5]; // Entangle q[2] with right nodes

// Second layer of operations (rotation and additional entanglement)
rz(0.45) q[3]; // Apply rotation based on weights
rz(0.65) q[4];
rz(0.8) q[5];
rz(0.9) q[6];
rz(1.0) q[7];

h q[3]; // Prepare final layer with Hadamard for measurement
h q[4];
h q[5];
h q[6];
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