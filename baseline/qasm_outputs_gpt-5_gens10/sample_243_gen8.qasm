OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Apply controlled rotations to create entanglement according to the k-clique connections
cx q[0], q[1]; // between node 0 and 1
cx q[0], q[2]; // between node 0 and 2
cx q[0], q[4]; // between node 0 and 4
cx q[0], q[5]; // between node 0 and 5
cx q[1], q[2]; // between node 1 and 2
cx q[1], q[4]; // between node 1 and 4
cx q[5], q[3]; // between node 5 and 3

// Apply rotation gates to fine-tune state preparation
rz(0.6789) q[0];
rz(0.2345) q[1];
rz(0.1234) q[2];
rz(0.6789) q[3];
rz(0.4567) q[4];
rz(0.3456) q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];