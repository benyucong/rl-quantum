OPENQASM 3.0;
include "stdgates.inc";
bit[5] c;
qubit[5] q;

// Initialize qubits in state |+>
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// First Layer: Apply RX rotations and CNOTs based on the edges
rx(1.7) q[0];
rx(1.5) q[1];
cx q[0], q[2]; // Edge (0, 2)
cx q[0], q[3]; // Edge (0, 3)
cx q[0], q[1]; // Edge (0, 1)
cx q[1], q[4]; // Edge (1, 4)

// Second Layer: Additional rotations to create entanglement
rx(1.3) q[2];
rx(1.2) q[3];
cx q[2], q[4]; // New interaction to ensure coverage
rz(-0.5) q[4]; // Z-rotation on node 4

// Third Layer: Additional gates for optimization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
rz(0.5) q[0];
rz(0.3) q[1];
rz(0.4) q[2];
rz(0.2) q[3];
rz(0.6) q[4];

// Measure the qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];