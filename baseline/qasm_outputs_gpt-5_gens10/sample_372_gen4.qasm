OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Apply Controlled-RZ gates based on edges (for k-clique problem)
cz q[0], q[1]; // edge (0, 1)
cz q[0], q[2]; // edge (0, 2)
cz q[1], q[2]; // edge (1, 2)
cz q[1], q[3]; // edge (1, 3)
cz q[2], q[4]; // edge (2, 4)
cz q[2], q[5]; // edge (2, 5)

// Apply the final Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];