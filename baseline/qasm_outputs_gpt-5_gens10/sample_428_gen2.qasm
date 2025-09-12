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

// Entangling gates based on edges
cx q[0], q[1]; // edge (0, 1)
rz(1.1072) q[1];
cx q[0], q[1];

cx q[0], q[4]; // edge (0, 4)
rz(1.2159) q[4];
cx q[0], q[4];

cx q[0], q[6]; // edge (0, 6)
rz(1.0234) q[6];
cx q[0], q[6];

cx q[1], q[8]; // edge (1, 8)
rz(0.9878) q[8];
cx q[1], q[8];

cx q[2], q[3]; // edge (2, 3)
rz(0.5439) q[3];
cx q[2], q[3];

cx q[2], q[5]; // edge (2, 5)
rz(1.4296) q[5];
cx q[2], q[5];

cx q[4], q[5]; // edge (4, 5)
rz(0.6675) q[5];
cx q[4], q[5];

cx q[6], q[7]; // edge (6, 7)
rz(1.2048) q[7];
cx q[6], q[7];

cx q[7], q[9]; // edge (7, 9)
rz(1.6783) q[9];
cx q[7], q[9];

cx q[8], q[9]; // edge (8, 9)
rz(0.8954) q[9];
cx q[8], q[9];

// Layer 2
h q[0];
rz(0.5678) q[0];
h q[0];

h q[1];
rz(0.5143) q[1];
h q[1];

h q[2];
rz(0.8342) q[2];
h q[2];

h q[3];
rz(0.2045) q[3];
h q[3];

h q[4];
rz(1.2638) q[4];
h q[4];

h q[5];
rz(0.3924) q[5];
h q[5];

h q[6];
rz(0.8849) q[6];
h q[6];

h q[7];
rz(0.7665) q[7];
h q[7];

h q[8];
rz(0.3140) q[8];
h q[8];

h q[9];
rz(0.5551) q[9];
h q[9];

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