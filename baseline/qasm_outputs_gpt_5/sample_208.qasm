OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize the qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// First layer of entangling gates corresponding to the graph edges
cx q[0], q[1]; // Edge (0-1)
cx q[0], q[3]; // Edge (0-3)
cx q[0], q[4]; // Edge (0-4)
cx q[1], q[4]; // Edge (1-4)
cx q[2], q[4]; // Edge (2-4)
cx q[3], q[4]; // Edge (3-4)
cx q[4], q[5]; // Edge (4-5)

// Parameterized rotation gates for the second layer
rx(1.2038) q[0];
ry(0.8591) q[1];
rz(2.0923) q[2];
rx(0.7854) q[3];
ry(1.5708) q[4];
rz(1.0472) q[5];

// Final layer of entangling gates
cx q[0], q[1];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];