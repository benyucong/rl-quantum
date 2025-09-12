OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initializing the qubits at the left partition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Creating entanglement according to the edges
cx q[0], q[7]; // edge (0, 7)
cx q[0], q[9]; // edge (0, 9)
cx q[0], q[12]; // edge (0, 12)
cx q[1], q[8]; // edge (1, 8)
cx q[2], q[9]; // edge (2, 9)
cx q[2], q[12]; // edge (2, 12)
cx q[3], q[10]; // edge (3, 10)
cx q[4], q[11]; // edge (4, 11)
cx q[4], q[7]; // edge (4, 7)
cx q[5], q[12]; // edge (5, 12)
cx q[6], q[13]; // edge (6, 13)
cx q[6], q[9]; // edge (6, 9)

// Applying Hadamard gates again to ensure interference
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measurement of the qubits
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