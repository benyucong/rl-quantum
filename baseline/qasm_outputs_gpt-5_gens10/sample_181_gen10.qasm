OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialize qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer of entangling gates based on min-cut graph edges
cx q[0], q[1]; // (0 -> 1) capacity 3
cx q[1], q[2]; // (1 -> 2) capacity 4
cx q[1], q[5]; // (1 -> 5) capacity 5
cx q[2], q[6]; // (2 -> 6) capacity 1
cx q[3], q[1]; // (3 -> 1) capacity 3
cx q[3], q[2]; // (3 -> 2) capacity 3
cx q[4], q[1]; // (4 -> 1) capacity 4
cx q[4], q[3]; // (4 -> 3) capacity 4
cx q[5], q[3]; // (5 -> 3) capacity 2

// Second layer of entangling gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

cx q[0], q[1]; // (0 -> 1)
cx q[1], q[2]; // (1 -> 2)
cx q[1], q[5]; // (1 -> 5)
cx q[2], q[6]; // (2 -> 6)
cx q[3], q[1]; // (3 -> 1)
cx q[3], q[2]; // (3 -> 2)
cx q[4], q[1]; // (4 -> 1)
cx q[4], q[3]; // (4 -> 3)
cx q[5], q[3]; // (5 -> 3)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];