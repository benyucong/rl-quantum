OPENQASM 3.0;
include "stdgates.inc";
bit[9] c;
qubit[9] q;

// Prepare the state
h q[0];
h q[1];
h q[2];

// First layer of gates
cx q[0], q[1];
rx(1.3) q[0];
ry(2.5) q[1];
rz(0.4) q[2];

// Second layer of gates
cx q[1], q[2];
rx(0.7) q[1];
ry(1.1) q[2];
rz(1.7) q[0];

// Third layer of gates
cx q[0], q[2];
rx(0.9) q[0];
ry(1.3) q[2];
rz(0.6) q[1];

// Fourth layer of gates
cx q[1], q[0];
rx(0.5) q[1];
ry(1.2) q[0];
rz(1.1) q[2];

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