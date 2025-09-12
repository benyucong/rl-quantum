OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Initialize qubits with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];

// First layer of edges
cx q[0], q[6]; // Edge: (0, 6)
rz(-0.5878) q[6]; // Rotation for capacity
cx q[0], q[6];

cx q[0], q[8]; // Edge: (0, 8)
rz(-0.5878) q[8]; // Rotation for capacity
cx q[0], q[8];

cx q[1], q[4]; // Edge: (1, 4)
rz(-0.46) q[4]; // Rotation for capacity
cx q[1], q[4];

cx q[1], q[5]; // Edge: (1, 5)
rz(-0.5) q[5]; // Rotation for capacity
cx q[1], q[5];

cx q[1], q[6]; // Edge: (1, 6)
rz(-0.6) q[6]; // Rotation for capacity
cx q[1], q[6];

cx q[1], q[7]; // Edge: (1, 7)
rz(-0.3) q[7]; // Rotation for capacity
cx q[1], q[7];

cx q[2], q[8]; // Edge: (2, 8)
rz(-0.7) q[8]; // Rotation for capacity
cx q[2], q[8];

// Second layer of edges
cx q[3], q[2]; // Edge: (3, 2)
rz(-0.4) q[2]; // Rotation for capacity
cx q[3], q[2];

cx q[4], q[5]; // Edge: (4, 5)
rz(-0.2) q[5]; // Rotation for capacity
cx q[4], q[5];

cx q[4], q[7]; // Edge: (4, 7)
rz(-0.5) q[7]; // Rotation for capacity
cx q[4], q[7];

cx q[6], q[5]; // Edge: (6, 5)
rz(-0.1) q[5]; // Rotation for capacity
cx q[6], q[5];

cx q[6], q[7]; // Edge: (6, 7)
rz(-0.3) q[7]; // Rotation for capacity
cx q[6], q[7];

cx q[7], q[3]; // Edge: (7, 3)
rz(-0.5) q[3]; // Rotation for capacity
cx q[7], q[3];

cx q[7], q[4]; // Edge: (7, 4)
rz(-0.2) q[4]; // Rotation for capacity
cx q[7], q[4];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];