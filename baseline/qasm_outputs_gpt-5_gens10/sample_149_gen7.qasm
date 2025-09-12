OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;

// Initialization
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First layer
rz(1.76) q[0];
rz(1.12) q[1];
cz q[0], q[1];
rz(1.05) q[2];
rz(0.89) q[3];
cz q[2], q[3];

// Second layer
rx(2.04) q[0];
rx(2.23) q[1];
cx q[0], q[1];
rx(1.98) q[2];
rx(1.85) q[3];
cx q[2], q[3];

// Third layer
h q[4];
h q[5];
h q[6];
h q[7];
rz(0.55) q[4];
rz(2.40) q[5];
cz q[4], q[5];
rz(1.65) q[6];
rz(0.78) q[7];
cz q[6], q[7];

// Fourth layer
ry(1.25) q[0];
ry(2.17) q[1];
cx q[0], q[1];
ry(1.95) q[2];
ry(1.34) q[3];
cx q[2], q[3];

// Measuring
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];