OPENQASM 3.0;
include "stdgates.inc";
bit[8] c;
qubit[8] q;
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// First Layer
rx(1.2) q[0];
rx(1.5) q[1];
rx(1.1) q[2];
rx(0.9) q[3];
rx(1.6) q[4];
rx(1.4) q[5];
rx(1.3) q[6];
rx(1.0) q[7];

// Entangling Layer
cx q[0], q[3];
cx q[0], q[4];
cx q[1], q[4];
cx q[1], q[7];
cx q[2], q[5];
cx q[3], q[6];

// Second Layer
rx(1.8) q[0];
rx(1.7) q[1];
rx(1.9) q[2];
rx(1.4) q[3];
rx(2.0) q[4];
rx(1.2) q[5];
rx(1.6) q[6];
rx(1.3) q[7];

// Final Entangling Layer
cx q[0], q[3];
cx q[0], q[5];
cx q[1], q[4];
cx q[2], q[5];
cx q[3], q[7];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];
c[4] = measure q[4];
c[5] = measure q[5];
c[6] = measure q[6];
c[7] = measure q[7];