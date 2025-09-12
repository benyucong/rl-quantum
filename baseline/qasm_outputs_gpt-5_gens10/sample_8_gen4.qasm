OPENQASM 3.0;
include "stdgates.inc";
bit[3] c;
qubit[3] q;

// Initial state preparation
h q[0];
h q[1];
h q[2];

// First layer of gates
cx q[0], q[2]; // Entangle qubit 0 with qubit 2
rz(0.5) q[0]; // Rotate q[0] by some angle
cx q[1], q[2]; // Entangle qubit 1 with qubit 2

// Second layer of gates
h q[0];
rz(0.3) q[1]; // Rotate q[1]
cx q[0], q[1]; // Entangle q[0] with q[1]

// Third layer of gates
rz(0.2) q[2]; // Rotate q[2]
cx q[1], q[2]; // Entangle q[1] with q[2]

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];