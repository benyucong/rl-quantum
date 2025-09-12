OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Layer 1: Initialize qubits and create entanglement
h q[0];
h q[1];
h q[2];
h q[3];
cx q[0], q[3]; // Edge (0, 3)
cx q[0], q[4]; // Edge (0, 4)
cx q[0], q[6]; // Edge (0, 6)
cx q[0], q[7]; // Edge (0, 7)
cx q[1], q[4]; // Edge (1, 4)
cx q[1], q[3]; // Edge (1, 3)
cx q[1], q[6]; // Edge (1, 6)
cx q[2], q[5]; // Edge (2, 5)

// Layer 2: Apply rotations based on weights
rz(0.1) q[3]; // Weight for edge (0, 3)
rz(0.19) q[4]; // Weight for edge (0, 4)
rz(0.2) q[6]; // Weight for edge (0, 6)
rz(0.14) q[7]; // Weight for edge (0, 7)
rz(0.02) q[4]; // Weight for edge (1, 4)
rz(0.11) q[3]; // Weight for edge (1, 3)
rz(0.13) q[6]; // Weight for edge (1, 6)
rz(0.03) q[5]; // Weight for edge (2, 5)

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];