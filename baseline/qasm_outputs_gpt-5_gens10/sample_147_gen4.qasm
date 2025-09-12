OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization layer
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer (Entangling layer based on edges)
cx q[0], q[1]; // Edge (0, 1)
rz(4.0) q[1];
cx q[0], q[1];

cx q[0], q[4]; // Edge (0, 4)
rz(19.0) q[4];
cx q[0], q[4];

cx q[1], q[3]; // Edge (1, 3)
rz(18.0) q[3];
cx q[1], q[3];

cx q[1], q[4]; // Edge (1, 4)
rz(16.0) q[4];
cx q[1], q[4];

cx q[1], q[5]; // Edge (1, 5)
rz(11.0) q[5];
cx q[1], q[5];

cx q[2], q[3]; // Edge (2, 3)
rz(10.0) q[3];
cx q[2], q[3];

cx q[2], q[6]; // Edge (2, 6)
rz(18.0) q[6];
cx q[2], q[6];

cx q[4], q[5]; // Edge (4, 5)
rz(4.0) q[5];
cx q[4], q[5];

// Second layer (Rotation layer)
rz(-0.5) q[0];
rz(-0.3) q[1];
rz(-0.4) q[2];
rz(-0.6) q[3];
rz(-0.2) q[4];
rz(-0.1) q[5];
rz(-0.3) q[6];
rz(-0.5) q[7];

// Third layer (Entangling and final measurements)
cx q[0], q[1];
rz(2.0) q[1];
cx q[0], q[1];

cx q[0], q[4];
rz(3.0) q[4];
cx q[0], q[4];

cx q[1], q[3];
rz(1.5) q[3];
cx q[1], q[3];

cx q[1], q[4];
rz(2.5) q[4];
cx q[1], q[4];

cx q[1], q[5];
rz(1.0) q[5];
cx q[1], q[5];

cx q[2], q[3];
rz(1.5) q[3];
cx q[2], q[3];

cx q[2], q[6];
rz(2.0) q[6];
cx q[2], q[6];

cx q[4], q[5];
rz(3.5) q[5];
cx q[4], q[5];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];