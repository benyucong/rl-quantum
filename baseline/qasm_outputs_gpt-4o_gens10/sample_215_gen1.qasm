OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Layer 1: Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2: Apply controlled rotations based on edges
cx q[0], q[1]; // Edge (1, 2)
rz(0.5) q[1];
cx q[0], q[1];

cx q[0], q[3]; // Edge (1, 3)
rz(0.5) q[3];
cx q[0], q[3];

cx q[1], q[3]; // Edge (2, 3)
rz(0.5) q[3];
cx q[1], q[3];

cx q[2], q[3]; // Edge (0, 3)
rz(0.5) q[3];
cx q[2], q[3];

// Layer 3: Apply additional rotations to enhance entanglement
rz(0.3) q[0];
rz(0.3) q[1];
rz(0.3) q[2];
rz(0.3) q[3];

// Layer 4: Finalize the circuit with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];