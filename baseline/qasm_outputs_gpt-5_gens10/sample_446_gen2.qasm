OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];

// First layer of encodings
cx q[0], q[2];
rz(0.2548) q[2];
cx q[0], q[2];

cx q[1], q[2];
rz(0.2984) q[2];
cx q[1], q[2];

// Second layer of encodings
cx q[0], q[1];
rz(0.1602) q[1];
cx q[0], q[1];

cx q[0], q[2];
rz(-0.2819) q[2];
cx q[0], q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];