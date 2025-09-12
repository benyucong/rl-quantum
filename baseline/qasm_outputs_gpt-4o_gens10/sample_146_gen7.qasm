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

// First layer of entangling gates based on the edges
cx q[0], q[3]; // Edge (0, 3)
cx q[0], q[6]; // Edge (0, 6)
cx q[1], q[4]; // Edge (1, 4)
cx q[1], q[6]; // Edge (1, 6)
cx q[1], q[3]; // Edge (1, 3)
cx q[2], q[5]; // Edge (2, 5)
cx q[2], q[3]; // Edge (2, 3)
cx q[2], q[4]; // Edge (2, 4)

// Second layer of entangling gates
cx q[0], q[3]; // Edge (0, 3)
cx q[0], q[6]; // Edge (0, 6)
cx q[1], q[4]; // Edge (1, 4)
cx q[1], q[6]; // Edge (1, 6)
cx q[1], q[3]; // Edge (1, 3)
cx q[2], q[5]; // Edge (2, 5)
cx q[2], q[3]; // Edge (2, 3)
cx q[2], q[4]; // Edge (2, 4)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];