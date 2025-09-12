OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize all qubits to the |+⟩ state
h q[0];
h q[1];
h q[2];
h q[3];

// Apply control gates based on the min_cut problem definition
cx q[0], q[2]; // From node 0 to node 2
rz(0.8436) q[2]; // Apply rotation for edge (0, 2)
cx q[0], q[2];
cx q[0], q[3]; // From node 0 to node 3
rz(1.3453) q[3]; // Apply rotation for edge (0, 3)
cx q[0], q[3];

cx q[1], q[2]; // From node 1 to node 2
rz(0.5347) q[2]; // Apply rotation for edge (1, 2)
cx q[1], q[2];

cx q[1], q[3]; // From node 1 to node 3
rz(1.2670) q[3]; // Apply rotation for edge (1, 3)
cx q[1], q[3];

// Second layer of operations
h q[0];
h q[1];
h q[2];
h q[3];

// Final measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];