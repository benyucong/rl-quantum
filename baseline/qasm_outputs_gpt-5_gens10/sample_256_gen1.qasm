OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Prepare qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer of entangling operations
cx q[0], q[4];
cx q[1], q[4];
cx q[2], q[4];
cx q[3], q[4];

// Second layer of rotation gates
rz(0.2) q[0];
rz(0.2) q[1];
rz(0.2) q[2];
rz(0.2) q[3];
rz(0.2) q[4];

// Third layer of entangling operations
cx q[0], q[3];
cx q[1], q[3];
cx q[2], q[3];

// Fourth layer of rotation gates
rz(0.4) q[0];
rz(0.4) q[1];
rz(0.4) q[2];
rz(0.4) q[3];
rz(0.4) q[4];

// Measurement step
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];