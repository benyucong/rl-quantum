OPENQASM 3.0;
include "stdgates.inc";
bit[14] c;
qubit[14] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer for entanglement based on max flow graph
cx q[0], q[1]; // edge (0 -> 1)
cx q[0], q[2]; // edge (0 -> 2)
cx q[0], q[4]; // edge (0 -> 4)
cx q[2], q[1]; // edge (2 -> 1)
cx q[2], q[4]; // edge (2 -> 4)
cx q[1], q[6]; // edge (1 -> 6)
cx q[4], q[6]; // edge (4 -> 6)
cx q[5], q[1]; // edge (5 -> 1)
cx q[5], q[3]; // edge (5 -> 3)
cx q[4], q[2]; // edge (4 -> 2)
cx q[3], q[5]; // edge (3 -> 5)

// Second layer with additional entangling gates
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];
rz(0.5) q[4];
rz(0.5) q[5];
rz(0.5) q[6];

h q[0]; // reapplying Hadamard to introduce superposition
h q[2];

// More entangling operations
cx q[1], q[3];
cx q[2], q[4];
cx q[4], q[5];

// Final layer to disentangle and measure
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];