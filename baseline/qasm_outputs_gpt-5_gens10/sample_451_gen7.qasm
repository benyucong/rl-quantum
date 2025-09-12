OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First layer: apply controlled rotations based on edges
cx q[0], q[1]; // Edge (0, 1)
rz(0.3456) q[1];
cx q[0], q[1];

cx q[1], q[2]; // Edge (1, 2)
rz(0.2345) q[2];
cx q[1], q[2];

cx q[1], q[3]; // Edge (1, 3)
rz(0.1234) q[3];
cx q[1], q[3];

cx q[1], q[4]; // Edge (1, 4)
rz(0.4567) q[4];
cx q[1], q[4];

// Second layer: more entangling gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

cx q[0], q[2];
rz(0.6123) q[2];
cx q[0], q[2];

cx q[3], q[4];
rz(0.7890) q[4];
cx q[3], q[4];

// Third layer: final measurements
h q[0];
h q[1];

cx q[0], q[4];
rz(0.8765) q[4];
cx q[0], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];