OPENQASM 3.0;
include "stdgates.inc";
bit[10] c;
qubit[10] q;

// Layer 1
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

// Apply controlled rotations based on the edges
rz(0.1) q[0]; // Edge (0, 5)
cx q[0], q[5];
rz(0.2) q[0]; // Edge (0, 12)
cx q[0], q[12];

rz(0.3) q[1]; // Edge (1, 6)
cx q[1], q[6];
rz(0.4) q[1]; // Edge (1, 11)
cx q[1], q[11];

rz(0.5) q[2]; // Edge (2, 7)
cx q[2], q[7];
rz(0.6) q[2]; // Edge (2, 10)
cx q[2], q[10];

rz(0.7) q[3]; // Edge (3, 8)
cx q[3], q[8];

rz(0.8) q[4]; // Edge (4, 9)
cx q[4], q[9];
rz(0.9) q[4]; // Edge (4, 8)
cx q[4], q[8];
rz(1.0) q[4]; // Edge (4, 6)
cx q[4], q[6];

// Layer 2
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

rz(0.1) q[0]; // Edge (0, 5)
cx q[0], q[5];
rz(0.2) q[0]; // Edge (0, 12)
cx q[0], q[12];

rz(0.3) q[1]; // Edge (1, 6)
cx q[1], q[6];
rz(0.4) q[1]; // Edge (1, 11)
cx q[1], q[11];

rz(0.5) q[2]; // Edge (2, 7)
cx q[2], q[7];
rz(0.6) q[2]; // Edge (2, 10)
cx q[2], q[10];

rz(0.7) q[3]; // Edge (3, 8)
cx q[3], q[8];

rz(0.8) q[4]; // Edge (4, 9)
cx q[4], q[9];
rz(0.9) q[4]; // Edge (4, 8)
cx q[4], q[8];
rz(1.0) q[4]; // Edge (4, 6)
cx q[4], q[6];

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
c[9] = measure q[9];