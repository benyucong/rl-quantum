OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Layer 1: Apply Hadamard gates to all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 2: Apply controlled-X gates based on the edges
cx q[0], q[4]; // For edge (0, 4)
cx q[0], q[5]; // For edge (0, 5)
cx q[1], q[2]; // For edge (1, 2)
cx q[2], q[4]; // For edge (2, 4)
cx q[2], q[5]; // For edge (2, 5)
cx q[3], q[4]; // For edge (3, 4)

// Layer 3: Apply rotations for entanglement
rz(0.5) q[0];
rz(0.3) q[1];
rz(0.2) q[2];
rz(0.4) q[3];
rz(0.1) q[4];
rz(0.6) q[5];

// Layer 4: Apply Hadamard gates again
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];