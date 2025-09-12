OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// First layer of Hadamard gates to prepare the superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Second layer: applying controlled-X (CX) based on the edges of the complete graph K4
// Edges
cx q[0], q[1]; // (0, 1)
cx q[0], q[2]; // (0, 2)
cx q[0], q[3]; // (0, 3)
cx q[1], q[2]; // (1, 2)
cx q[1], q[3]; // (1, 3)
cx q[2], q[3]; // (2, 3)

// Third layer: RZ rotations to encode the k-clique solution
rz(0.5) q[0];
rz(0.5) q[1];
rz(0.5) q[2];
rz(0.5) q[3];

// Final Hadamard gates for measurement basis transformation
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurements
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];