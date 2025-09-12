OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled rotations based on edges
cz q[0], q[2]; // edge (0, 2)
cz q[0], q[3]; // edge (0, 3)
cz q[0], q[5]; // edge (0, 5)
cz q[1], q[2]; // edge (1, 2)
cz q[1], q[3]; // edge (1, 3)
cz q[1], q[5]; // edge (1, 5)
cz q[3], q[4]; // edge (3, 4)
cz q[3], q[5]; // edge (3, 5)
cz q[4], q[5]; // edge (4, 5)

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];