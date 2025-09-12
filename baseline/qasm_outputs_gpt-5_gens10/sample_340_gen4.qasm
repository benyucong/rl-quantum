OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Encode the edges of the graph using CNOT gates
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[3]; // edge (0, 3)
cx q[0], q[5]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 3)
cx q[1], q[4]; // edge (1, 4)
cx q[1], q[5]; // edge (1, 5)
cx q[1], q[6]; // edge (1, 6)
cx q[2], q[4]; // edge (2, 4)
cx q[2], q[5]; // edge (2, 5)
cx q[3], q[5]; // edge (3, 5)
cx q[3], q[6]; // edge (3, 6)
cx q[7], q[11]; // edge (7, 11)
cx q[8], q[9]; // edge (8, 9)
cx q[8], q[10]; // edge (8, 10)
cx q[8], q[12]; // edge (8, 12)
cx q[9], q[12]; // edge (9, 12)
cx q[11], q[12]; // edge (11, 12)

// Measure qubits
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