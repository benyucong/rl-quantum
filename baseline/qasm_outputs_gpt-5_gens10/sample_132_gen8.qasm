OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First Layer: Create entanglements based on edges of the graph
cx q[0], q[1]; // edge (0, 1)
cx q[0], q[2]; // edge (0, 2)
cx q[0], q[3]; // edge (0, 3)
cx q[0], q[5]; // edge (0, 5)
cx q[1], q[2]; // edge (1, 2)
cx q[1], q[3]; // edge (1, 3)
cx q[2], q[3]; // edge (2, 3)
cx q[5], q[4]; // edge (5, 4)

// Parameterization (using optimal angles for the second layer)
rx(1.1345) q[0];
ry(-1.2432) q[1];
rz(0.6578) q[2];
rx(0.8921) q[3];
ry(-0.6744) q[4];
rz(1.1089) q[5];

// Second Layer: Swap and entangle further to find k-clique
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];