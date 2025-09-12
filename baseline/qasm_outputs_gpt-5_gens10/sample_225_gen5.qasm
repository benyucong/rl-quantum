OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits to superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of entanglement
cx q[0], q[1];
cx q[0], q[2];
cx q[1], q[2];
cx q[2], q[4];
cx q[4], q[3];

// Second layer of entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cx q[2], q[0];
cx q[2], q[1];
cx q[3], q[4];

// Measure qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];