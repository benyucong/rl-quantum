OPENQASM 3.0;
include "stdgates.inc";
bit[4] c;
qubit[4] q;

// Preparing the initial state
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1
cx q[0], q[1];
rx(0.5) q[0];
rz(0.1) q[1];

// Layer 2
cx q[1], q[2];
rx(0.6) q[1];
rz(0.3) q[2];

// Layer 3
cx q[2], q[3];
rx(0.2) q[2];
rz(0.4) q[3];

// Layer 4
cx q[0], q[3];
rx(0.7) q[0];
rz(0.5) q[3];

// Measurement
c[0] = measure q[0];
c[1] = measure q[1];
c[2] = measure q[2];
c[3] = measure q[3];