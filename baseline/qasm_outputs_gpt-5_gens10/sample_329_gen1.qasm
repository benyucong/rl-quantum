OPENQASM 3.0;
include "stdgates.inc";
bit[7] c;
qubit[7] q;

// Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// First layer of operations
cx q[0], q[2]; // Connect source to intermediary
rz(0.200) q[2];
cx q[0], q[3]; // Connect source to intermediary
rz(0.300) q[3];
cx q[0], q[4]; // Connect source to intermediary
rz(0.400) q[4];
cx q[0], q[6]; // Connect source to sink
rz(0.500) q[6];

// Second layer of operations
cx q[1], q[3]; // Connect intermediary to another intermediary
rz(0.150) q[3];
cx q[1], q[5]; // Connect intermediary to another intermediary
rz(0.250) q[5];
cx q[2], q[4]; // Connect intermediaries
rz(0.350) q[4];
cx q[3], q[6]; // Connect intermediary to sink
rz(0.450) q[6];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];