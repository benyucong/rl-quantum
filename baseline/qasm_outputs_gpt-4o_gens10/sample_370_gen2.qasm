OPENQASM 3.0;
include "stdgates.inc";
bit[6] c;
qubit[6] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 1: Apply controlled rotations based on the graph edges
cx q[0], q[1]; // Edge (0, 1)
rz(0.5) q[1];
cx q[0], q[1];

cx q[1], q[2]; // Edge (1, 2)
rz(1.0) q[2];
cx q[1], q[2];

cx q[1], q[3]; // Edge (1, 3)
rz(0.8) q[3];
cx q[1], q[3];

cx q[2], q[4]; // Edge (2, 4)
rz(0.6) q[4];
cx q[2], q[4];

cx q[2], q[5]; // Edge (2, 5)
rz(0.4) q[5];
cx q[2], q[5];

cx q[4], q[5]; // Edge (4, 5)
rz(0.3) q[5];
cx q[4], q[5];

// Layer 2: Further entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Layer 3: Apply additional controlled rotations
cx q[0], q[1];
rz(0.5) q[1];
cx q[0], q[1];

cx q[1], q[2];
rz(1.0) q[2];
cx q[1], q[2];

cx q[1], q[3];
rz(0.8) q[3];
cx q[1], q[3];

cx q[2], q[4];
rz(0.6) q[4];
cx q[2], q[4];

cx q[2], q[5];
rz(0.4) q[5];
cx q[2], q[5];

cx q[4], q[5];
rz(0.3) q[5];
cx q[4], q[5];

// Layer 4: Finalize the circuit
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];