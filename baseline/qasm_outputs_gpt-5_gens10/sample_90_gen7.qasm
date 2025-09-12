OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits to the |+⟩ state
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Apply Controlled-Not gates to create entanglement based on the min_cut graph edges
cx q[0], q[2]; // (0 -> 2)
cx q[0], q[5]; // (0 -> 5) - direct edge to sink
cx q[2], q[1]; // (2 -> 1)
cx q[2], q[4]; // (2 -> 4)
cx q[3], q[2]; // (3 -> 2)
cx q[3], q[5]; // (3 -> 5)
cx q[4], q[1]; // (4 -> 1)
cx q[4], q[3]; // (4 -> 3)
cx q[4], q[5]; // (4 -> 5)

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];