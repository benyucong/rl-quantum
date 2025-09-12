OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Initialize qubits with Hadamard for superposition
h q[0];
h q[1];
h q[2];
h q[3];

// First layer – entangling steps based on edges
cx q[0], q[1]; // Connect qubit 0 and 1
rz(0.2) q[1];
cx q[2], q[3]; // Connect qubit 2 and 3
rz(0.3) q[3];

// Second layer – additional connections
cx q[3], q[4]; // Connect the last qubit to the previous one
rz(0.4) q[4];
cx q[1], q[2]; // Enable interaction between qubits in different groups

// Third layer – mixing operations
rx(0.5) q[0];
rx(0.6) q[1];
rx(0.7) q[2];
rx(0.8) q[3];

// Fourth layer – final measurements and adjustments
h q[0];
h q[1];
h q[2];
h q[3];

// Measure all qubits for final state determination
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];