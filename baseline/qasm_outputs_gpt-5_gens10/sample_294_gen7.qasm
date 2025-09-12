OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize all qubits with Hadamard gate
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer - apply controlled rotations based on edges
cx q[0], q[1];
rz(-1.234) q[1]; // Parameter adjusted for edge (0, 1)
cx q[0], q[1];

cx q[0], q[2];
rz(-0.785) q[2]; // Parameter adjusted for edge (0, 2)
cx q[0], q[2];

cx q[0], q[3];
rz(-1.047) q[3]; // Parameter adjusted for edge (0, 3)
cx q[0], q[3];

cx q[1], q[4];
rz(-0.523) q[4]; // Parameter adjusted for edge (1, 4)
cx q[1], q[4];

// Second layer - further entanglement
h q[0];
h q[1];
h q[3];
cx q[0], q[2];
rz(0.456) q[2];
cx q[0], q[2];

cx q[1], q[3];
rz(0.567) q[3];
cx q[1], q[3];

// Third layer - final adjustments
h q[2];
h q[4];
cx q[2], q[3];
rz(0.123) q[3];
cx q[2], q[3];

h q[0];
h q[1];
h q[2];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];