OPENQASM 3.0;
include "stdgates.inc";
bit[12] c;
qubit[12] q;

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];

// Apply controlled rotations for edges
// Edge (0, 1)
cx q[0], q[1];
rz(0.1234) q[1];
cx q[0], q[1];

// Edge (0, 3)
cx q[0], q[3];
rz(0.2345) q[3];
cx q[0], q[3];

// Edge (0, 4)
cx q[0], q[4];
rz(0.3456) q[4];
cx q[0], q[4];

// Edge (1, 2)
cx q[1], q[2];
rz(0.4567) q[2];
cx q[1], q[2];

// Edge (1, 4)
cx q[1], q[4];
rz(0.5678) q[4];
cx q[1], q[4];

// Edge (2, 4)
cx q[2], q[4];
rz(0.6789) q[4];
cx q[2], q[4];

// Edge (5, 6)
cx q[5], q[6];
rz(0.7890) q[6];
cx q[5], q[6];

// Edge (5, 7)
cx q[5], q[7];
rz(0.8901) q[7];
cx q[5], q[7];

// Edge (8, 10)
cx q[8], q[10];
rz(0.9012) q[10];
cx q[8], q[10];

// Edge (9, 10)
cx q[9], q[10];
rz(1.0123) q[10];
cx q[9], q[10];

// Edge (9, 12)
cx q[9], q[12];
rz(1.1234) q[12];
cx q[9], q[12];

// Edge (10, 11)
cx q[10], q[11];
rz(1.2345) q[11];
cx q[10], q[11];

// Measure all qubits
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];
c[8] = measure q[8];
c[9] = measure q[9];
c[10] = measure q[10];
c[11] = measure q[11];