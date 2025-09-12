OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// First layer
h q[0]; // Prepare source node
h q[1]; // Node 1
h q[2]; // Node 2
h q[3]; // Node 3
h q[4]; // Node 4
h q[5]; // Sink node
h q[6]; // Unused node

// Entangling gates for first layer
cx q[0], q[5];
cx q[1], q[5];
cx q[2], q[1];
cx q[2], q[3];
cx q[2], q[4];
cx q[3], q[6];
cx q[4], q[1];
cx q[4], q[2];
cx q[4], q[3];
cx q[5], q[1];
cx q[5], q[2];

// Second layer with optimized parameters
rz(0.1) q[0];
cz q[0], q[5];
rz(0.1) q[1];
cz q[1], q[5];
rz(0.1) q[2];
cz q[2], q[1];
rz(0.1) q[3];
cz q[3], q[6];
rz(0.1) q[4];
cz q[4], q[2];
rz(0.1) q[5];
cz q[5], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];