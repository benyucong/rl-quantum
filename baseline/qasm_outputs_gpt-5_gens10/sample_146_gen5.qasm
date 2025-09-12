OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialize qubits for the matching problem
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer of entanglement
cx q[0], q[3];  // Edge (0, 3)
rz(0.7457) q[3]; // Rotation to encode the weight
cx q[0], q[3];

cx q[0], q[6];  // Edge (0, 6)
rz(0.8740) q[6];
cx q[0], q[6];

cx q[1], q[4];  // Edge (1, 4)
rz(0.9331) q[4];
cx q[1], q[4];

cx q[1], q[6];  // Edge (1, 6)
rz(0.5742) q[6];
cx q[1], q[6];

cx q[1], q[3];  // Edge (1, 3)
rz(0.5863) q[3];
cx q[1], q[3];

cx q[2], q[5];  // Edge (2, 5)
rz(0.9144) q[5];
cx q[2], q[5];

cx q[2], q[3];  // Edge (2, 3)
rz(0.6416) q[3];
cx q[2], q[3];

cx q[2], q[4];  // Edge (2, 4)
rz(0.7112) q[4];
cx q[2], q[4];

// Second layer of entanglement
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[0], q[3];
rz(0.6944) q[3];
cx q[0], q[3];

cx q[0], q[6];
rz(0.8245) q[6];
cx q[0], q[6];

cx q[1], q[4];
rz(0.8792) q[4];
cx q[1], q[4];

cx q[1], q[6];
rz(0.6110) q[6];
cx q[1], q[6];

cx q[1], q[3];
rz(0.5090) q[3];
cx q[1], q[3];

cx q[2], q[5];
rz(0.9645) q[5];
cx q[2], q[5];

cx q[2], q[3];
rz(0.5276) q[3];
cx q[2], q[3];

cx q[2], q[4];
rz(0.4657) q[4];
cx q[2], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];